import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../models/user.dart';

class ConnectedProducts extends Model {
  List<Product> _products = [];
  int _selProductIndex;
  
  User _authenticatedUser;

  void addProduct(
      String title, String description, String image, double price,) {
    final Product newProduct = Product(
      title: title,
      description: description,
      image: image,
      price: price,
      userEmail: _authenticatedUser.email,
      userId: _authenticatedUser.id
    );
    _products.add(newProduct);
    notifyListeners();
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

  int get selectedProductIndex {
    return _selProductIndex;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    } else {
      return _products[selectedProductIndex];
    }
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
  }

  void updateProduct(String title, String description, String image, double price,) {
    final Product updatedProduct = Product(
      title: title,
      description: description,
      image: image,
      price: price,
      userEmail: _authenticatedUser.email,
      userId: _authenticatedUser.id
    );
    _products[selectedProductIndex] = updatedProduct;
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite =
        _products[selectedProductIndex].isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
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

  void selectProduct(int index) {
    _selProductIndex = index;
    if(_selProductIndex != null) {
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
    _authenticatedUser = User(id: '12345', email: email, password: password,);
  }
}

