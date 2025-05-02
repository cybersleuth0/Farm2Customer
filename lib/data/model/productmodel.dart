import 'package:farm2customer/data/local/db_helper.dart';

class ProductModel {
  int? productId;
  String productName;
  String productDescription;
  double productPrice;
  String productCategory;
  String productImage;

  ProductModel({
    this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productCategory,
    required this.productImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DBHelper.productIdColumn: productId,
      DBHelper.productNameColumn: productName,
      DBHelper.productDescriptionColumn: productDescription,
      DBHelper.productPriceColumn: productPrice,
      DBHelper.productCategoryColumn: productCategory,
      DBHelper.productImageColumn: productImage,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map[DBHelper.productIdColumn],
      productName: map[DBHelper.productNameColumn],
      productDescription: map[DBHelper.productDescriptionColumn],
      productPrice: map[DBHelper.productPriceColumn],
      productCategory: map[DBHelper.productCategoryColumn],
      productImage: map[DBHelper.productImageColumn],
    );
  }
}
