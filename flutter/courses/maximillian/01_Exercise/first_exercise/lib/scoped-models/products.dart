import '../models/product.dart';
import './connected_products.dart';

mixin ProductsModel on ConnectedProducts {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return List.from(
          products.where((Product product) => product.isFavorite).toList());
    }
    return List.from(products);
  }

  int get selectedProductIndex {
    return selProductIndex;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    } else {
      return products[selectedProductIndex];
    }
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }



  void deleteProduct() {
    products.removeAt(selectedProductIndex);
    selProductIndex = null;
  }

  void updateProduct(String title, String description, String image, double price,) {
    final Product updatedProduct = Product(
      title: title,
      description: description,
      image: image,
      price: price,
      userEmail: authenticatedUser.email,
      userId: authenticatedUser.id
    );
    products[selectedProductIndex] = updatedProduct;
    selProductIndex = null;
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite =
        products[selectedProductIndex].isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      price: selectedProduct.price,
      image: selectedProduct.image,
      userEmail: authenticatedUser.email,
      userId: authenticatedUser.id,
      isFavorite: newFavoriteStatus,
    );
    products[selectedProductIndex] = updatedProduct;
    selProductIndex = null;
    notifyListeners();
    selProductIndex = null;
  }

  void selectProduct(int index) {
    selProductIndex = index;
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}
