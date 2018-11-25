import 'dart:convert' as Convert;
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import '../models/user.dart';

class ConnectedProducts extends Model {
  List<Product> _products = [];
  String _selProductId;
  bool _isLoading = false;

  User _authenticatedUser;

  Future<bool> addProduct(
    String title,
    String description,
    String image,
    double price,
  ) async {

    try {
      _isLoading = true;
      notifyListeners();
      final Map<String, dynamic> productData = {
        'title': title,
        'description': description,
        'image':
            'https://www.livemint.com/rf/Image-621x414/LiveMint/Period2/2017/10/31/Photos/Processed/fruits-kFLF--621x414@LiveMint.jpg',
        'price': price,
        'userEmail': _authenticatedUser.email,
        'userId': _authenticatedUser.id
      };
      final http.Response response = await http
          .post(
        'https://flutter-products-gs.firebaseio.com/products.json',
        body: Convert.json.encode(productData),
      );
          //.then((http.Response response) {
      if(response.statusCode != 200 && response.statusCode != 201) {
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
          image: image,
          price: price,
          userEmail: _authenticatedUser.email,
          userId: _authenticatedUser.id);
      _products.add(newProduct);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch(error) {
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
  Future<bool> deleteProduct() {
    _isLoading = true;
    final String deletedProductId = selectedProduct.id;
    _products.removeAt(selectedProductIndex);
    _selProductId = null;
    notifyListeners();
    return http.delete('https://flutter-products-gs.firebaseio.com/products/${deletedProductId}.json')
      .then((http.Response response) {
        _isLoading = false;
        notifyListeners();
        return true;
      })
      .catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }

  Future<Null> fetchProducts() {
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://flutter-products-gs.firebaseio.com/products.json')
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
            image: productData['image'],
            price: productData['price'],
            userEmail: productData['userEmail'],
            userId: productData['userId']);
        fetchedProductList.add(product);
      });
      _products = fetchedProductList;
      _isLoading = false;
      notifyListeners();
      _selProductId = null;
    })
    .catchError((error) {
      _isLoading = false;
      notifyListeners();
      //return false;
    });
  }

  Future<bool> updateProduct(
    String title,
    String description,
    String image,
    double price,
  ) {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> updateData = {
      'title': title,
      'description': description,
      'image': 'https://www.livemint.com/rf/Image-621x414/LiveMint/Period2/2017/10/31/Photos/Processed/fruits-kFLF--621x414@LiveMint.jpg',
      'price': price,
      'userEmail': _authenticatedUser.email,
      'userId': _authenticatedUser.id
    };
    return http.put(
      'https://flutter-products-gs.firebaseio.com/products/${selectedProduct.id}.json',
      body: Convert.json.encode(updateData),
    ).then((http.Response response) {
      _isLoading = false;
      final Product updatedProduct = Product(
        id: selectedProduct.id,
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: _authenticatedUser.email,
        userId: _authenticatedUser.id,
      );
      _products[selectedProductIndex] = updatedProduct;
      notifyListeners();
      return true;
    })
    .catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });

    
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = _products[selectedProductIndex].isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
      id: selectedProduct.id,
      title: selectedProduct.title,
      description: selectedProduct.description,
      price: selectedProduct.price,
      image: selectedProduct.image,
      userEmail: _authenticatedUser.email,
      userId: _authenticatedUser.id,
      isFavorite: newFavoriteStatus,
    );
    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
  }

  void selectProduct(String productId) {
    _selProductId = productId;
    if (_selProductId != null) {
      notifyListeners();
    }
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

mixin UserModel on ConnectedProducts {
  void login(String email, String password) {
    _authenticatedUser = User(
      id: '12345',
      email: email,
      password: password,
    );
  }
}

mixin UtilityModel on ConnectedProducts {
  bool get isLoading {
    return _isLoading;
  }
}