import './connected_products.dart';
import './products.dart';
import './user.dart';

class MainModel extends ConnectedProducts with UserModel, ProductsModel {}