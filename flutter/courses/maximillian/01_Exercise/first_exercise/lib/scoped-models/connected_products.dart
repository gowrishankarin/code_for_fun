import 'dart:convert' as Convert;
import 'dart:async';
import 'dart:io';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart' as SP;
import 'package:rxdart/subjects.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

import '../models/product.dart';
import '../models/user.dart';
import '../models/auth.dart';
import '../models/location_data.dart';

import '../config.dart';

class ConnectedProducts extends Model {
  List<Product> _products = [];
  String _selProductId;
  bool _isLoading = false;
  User _authenticatedUser;
}

mixin ProductsModel on ConnectedProducts {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return List.from(
          _products.where((Product product) => product.isFavorite).toList());
    }
    return List.from(_products);
  }

  String get selectedProductId {
    return _selProductId;
  }

  Product get selectedProduct {
    if (selectedProductId == null) {
      return null;
    } else {
      return _products.firstWhere((Product product) {
        return product.id == _selProductId;
      });
    }
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  int get selectedProductIndex {
    return _products.indexWhere((Product product) {
      return product.id == _selProductId;
    });
  }

  Future<Map<String, dynamic>> uploadImage(File image,
      {String imagePath}) async {
    final mimeTypeData = lookupMimeType(image.path).split('/');
    final imageUploadRequest = http.MultipartRequest(
        'POST', Uri.parse(CONFIGURATIONS.fbCloudStoragePath));

    print(mimeTypeData);
    print(image.path);
    final file = await http.MultipartFile.fromPath(
      'image',
      image.path,
      contentType: MediaType(
        mimeTypeData[0],
        mimeTypeData[1],
      ),
    );
    imageUploadRequest.files.add(file);
    if (imagePath != null) {
      imageUploadRequest.fields['imagePath'] = Uri.encodeComponent(imagePath);
    }

    imageUploadRequest.headers['Authorization'] =
        'Bearer ${_authenticatedUser.token}';

    try {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode != 200 && response.statusCode != 201) {
        print('Something went wrong');
        print(Convert.json.decode(response.body));
        return null;
      }

      final responseData = Convert.json.decode(response.body);
      return responseData;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<bool> addProduct(String title, String description, File image,
      double price, LocationData locationData) async {
    try {
      _isLoading = true;
      notifyListeners();
      final uploadData = await uploadImage(image);
      if (uploadData == null) {
        _isLoading = false;
        notifyListeners();

        print('Upload Failed');
        return false;
      }

      final Map<String, dynamic> productData = {
        'title': title,
        'description': description,
        'price': price,
        'userEmail': _authenticatedUser.email,
        'userId': _authenticatedUser.id,
        'imagePath': uploadData['imagePath'],
        'imageUrl': uploadData['imageUrl'],
        'loc_lat': locationData.latitude,
        'loc_lng': locationData.longitude,
        'loc_address': locationData.address
      };
      final http.Response response = await http.post(
        'https://flutter-products-gs.firebaseio.com/products.json?auth=${_authenticatedUser.token}',
        body: Convert.json.encode(productData),
      );
      //.then((http.Response response) {
      if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        notifyListeners();
        return false;
      }
      final Map<String, dynamic> responseData =
          Convert.json.decode(response.body);
      final Product newProduct = Product(
        id: responseData['name'],
        title: title,
        description: description,
        image: uploadData['imageUrl'],
        imagePath: uploadData['imagePath'],
        price: price,
        locationData: locationData,
        userEmail: _authenticatedUser.email,
        userId: _authenticatedUser.id,
      );
      _products.add(newProduct);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
    //})
    // .catchError((error) {
    //   _isLoading = false;
    //   notifyListeners();
    //   return false;
    // });
  }

  Future<bool> deleteProduct() {
    _isLoading = true;
    final String deletedProductId = selectedProduct.id;
    _products.removeAt(selectedProductIndex);
    _selProductId = null;
    notifyListeners();
    return http
        .delete(
            'https://flutter-products-gs.firebaseio.com/products/$deletedProductId.json?auth=${_authenticatedUser.token}')
        .then((http.Response response) {
          print(response.body);
      _isLoading = false;
      notifyListeners();
      return true;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }

  Future<Null> fetchProducts({bool onlyForUser = false, clearExisting = false}) {
    _isLoading = true;
    if(clearExisting) {
      _products = [];
    }
    
    notifyListeners();
    return http
        .get(
            'https://flutter-products-gs.firebaseio.com/products.json?auth=${_authenticatedUser.token}')
        .then<Null>((http.Response response) {
      _isLoading = true;
      final List<Product> fetchedProductList = [];
      final Map<String, dynamic> productListData =
          Convert.json.decode(response.body);
      if (productListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }
      productListData.forEach((String productId, dynamic productData) {
        final Product product = Product(
            id: productId,
            title: productData['title'],
            description: productData['description'],
            image: productData['imageUrl'],
            imagePath: productData['imagePath'],
            price: productData['price'],
            locationData: LocationData(
              address: productData['loc_address'],
              latitude: productData['loc_lat'],
              longitude: productData['loc_lng'],
            ),
            userEmail: productData['userEmail'],
            userId: productData['userId'],
            isFavorite: productData['wishlistUsers'] == null
                ? false
                : (productData['wishlistUsers'] as Map<String, dynamic>)
                    .containsKey(_authenticatedUser.id));
        fetchedProductList.add(product);
      });
      _products = onlyForUser
          ? fetchedProductList.where((Product product) {
              return product.userId == _authenticatedUser.id;
            }).toList()
          : fetchedProductList;
      _isLoading = false;
      notifyListeners();
      _selProductId = null;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      //return false;
    });
  }

  Future<bool> updateProduct(String title, String description, File image,
      double price, LocationData locationData) async {
    try {
      _isLoading = true;
      notifyListeners();

      String imageUrl = selectedProduct.image;
      String imagePath = selectedProduct.imagePath;
      if (image != null) {
        final uploadData = await uploadImage(image);
        if (uploadData == null) {
          _isLoading = false;
          notifyListeners();

          print('Upload Failed');
          return false;
        }

        imageUrl = uploadData['imageUrl'];
        imagePath = uploadData['imagePath'];
      }

      final Map<String, dynamic> updateData = {
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'imagePath': imagePath,
        'price': price,
        'userEmail': _authenticatedUser.email,
        'userId': _authenticatedUser.id,
        'loc_address': locationData.address,
        'loc_lat': locationData.latitude,
        'loc_lng': locationData.longitude
      };
      await http.put(
        'https://flutter-products-gs.firebaseio.com/products/${selectedProduct.id}.json?auth=${_authenticatedUser.token}',
        body: Convert.json.encode(updateData),
      );
      _isLoading = false;
      final Product updatedProduct = Product(
        id: selectedProduct.id,
        title: title,
        description: description,
        image: imageUrl,
        imagePath: imagePath,
        price: price,
        locationData: locationData,
        userEmail: _authenticatedUser.email,
        userId: _authenticatedUser.id,
      );
      _products[selectedProductIndex] = updatedProduct;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void toggleProductFavoriteStatus(Product toggledProduct) async {
    final bool isCurrentlyFavorite = _products[selectedProductIndex].isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;

    final int toggledProductIndex = _products.indexWhere((Product product) {
      return product.id == toggledProduct.id;
    });
    final Product updatedProduct = Product(
      id: selectedProduct.id,
      title: selectedProduct.title,
      description: selectedProduct.description,
      price: selectedProduct.price,
      locationData: selectedProduct.locationData,
      image: selectedProduct.image,
      imagePath: selectedProduct.imagePath,
      userEmail: _authenticatedUser.email,
      userId: _authenticatedUser.id,
      isFavorite: newFavoriteStatus,
    );
    _products[toggledProductIndex] = updatedProduct;
    notifyListeners();
    http.Response response;
    if (newFavoriteStatus) {
      response = await http.put(
        'https://flutter-products-gs.firebaseio.com/products/${selectedProduct.id}/wishlistUsers/${_authenticatedUser.id}.json?auth=${_authenticatedUser.token}',
        body: Convert.json.encode(true),
      );
    } else {
      response = await http.delete(
        'https://flutter-products-gs.firebaseio.com/products/${selectedProduct.id}/wishlistUsers/${_authenticatedUser.id}.json?auth=${_authenticatedUser.token}',
      );
    }

    if (response.statusCode != 200 && response.statusCode != 201) {
      final Product updatedProduct = Product(
        id: selectedProduct.id,
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        imagePath: selectedProduct.imagePath,
        userEmail: _authenticatedUser.email,
        userId: _authenticatedUser.id,
        isFavorite: !newFavoriteStatus, 
        locationData: selectedProduct.locationData,
      );
      _products[toggledProductIndex] = updatedProduct;
      notifyListeners();
    }
  }

  void selectProduct(String productId) {
    _selProductId = productId;
    if (productId != null) {
      notifyListeners();
    }
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

mixin UserModel on ConnectedProducts {
  Timer _authTimer;
  PublishSubject<bool> _userSubject = PublishSubject();

  User get user {
    return _authenticatedUser;
  }

  PublishSubject<bool> get userSubject {
    return _userSubject;
  }

  Future<Map<String, dynamic>> authenticate(String email, String password,
      [AuthMode mode = AuthMode.Login]) async {
    _isLoading = true;
    notifyListeners();
    http.Response response;
    if (mode == AuthMode.Login) {
      response = await http.post(
          'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyBS-hQNId35PQwSjTzyMevsLEjuGhUIhos',
          body: Convert.json.encode({'email': email, 'password': password, 'returnSecureToken': true}),
          headers: {'Content-Type': 'application/json'});
    } else {
      response = await http.post(
          'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyBS-hQNId35PQwSjTzyMevsLEjuGhUIhos',
          body: Convert.json.encode({'email': email, 'password': password, 'returnSecureToken': true}),
          headers: {'Content-Type': 'application/json'});
    }

    final Map<String, dynamic> responseData =
        Convert.json.decode(response.body);
    bool hasError = true;
    String message = 'Login Failed!';
    if (responseData.containsKey('idToken')) {
      hasError = false;
      message = 'Authentication Succeeded!!';
      _authenticatedUser = User(
        id: responseData['localId'],
        email: responseData['email'],
        token: responseData['idToken'],
      );
      setAuthTimeout(int.parse(responseData['expiresIn']));
      _userSubject.add(true);

      final now = DateTime.now();
      final DateTime expiryTime =
          now.add(Duration(seconds: int.parse(responseData['expiresIn'])));
      final SP.SharedPreferences prefs =
          await SP.SharedPreferences.getInstance();
      prefs.setString('token', responseData['idToken']);
      prefs.setString('userEmail', responseData['email']);
      prefs.setString('userId', responseData['localId']);
      prefs.setString('expiryTime', expiryTime.toString());
    } else if (responseData['error']['message'] == 'INVALID_PASSWORD') {
      message = 'Wrong Password!!';
    } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
      message = 'This email already exists';
    }

    _isLoading = false;
    notifyListeners();

    return {'success': !hasError, 'message': message};
  }

  void autoAuthenticate() async {
    final SP.SharedPreferences prefs = await SP.SharedPreferences.getInstance();
    final String token = prefs.getString('token');
    final String expiryTimeString = prefs.getString('expiryTime');
    if (token != null) {
      final DateTime now = DateTime.now();
      final DateTime parsedExpiryTime = DateTime.parse(expiryTimeString);
      if (parsedExpiryTime.isBefore(now)) {
        _authenticatedUser = null;
        notifyListeners();
        return;
      }
      final String userEmail = prefs.getString('userEmail');
      final String userId = prefs.getString('userId');
      final int tokenLifespan = parsedExpiryTime.difference(now).inSeconds;
      _authenticatedUser = User(id: userId, email: userEmail, token: token);
      _userSubject.add(true);
      setAuthTimeout(tokenLifespan);
      notifyListeners();
    }
  }

  void logout() async {
    print('Logout');
    _authenticatedUser = null;
    _authTimer.cancel();
    _userSubject.add(false);
    _selProductId = null;
    final SP.SharedPreferences prefs = await SP.SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('userEmail');
    prefs.remove('userId');
  }

  void setAuthTimeout(int time) {
    _authTimer = Timer(Duration(seconds: time), logout);
  }
}

mixin UtilityModel on ConnectedProducts {
  bool get isLoading {
    return _isLoading;
  }
}
