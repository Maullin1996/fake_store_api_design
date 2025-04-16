import 'package:fake_store_api_package/domain/models.dart';
import 'package:fake_store_design/models/base_product.dart';

class ProductAdapter implements BaseProduct {
  final Product product;

  ProductAdapter(this.product);

  @override
  String get category => product.category;

  @override
  String get description => product.description;

  @override
  String get image => product.image;

  @override
  double get price => product.price;

  @override
  String get title => product.title;

  @override
  int get id => product.id;
}
