class ProductModel {
  late String productName;
  late String description;
  late String? categoryName;
  late String? imagePath;
  late String wight;
bool? disAble;
  late int quantity;

   String? id;
  ProductModel({
    required this.productName,
    required this.description,
     this.imagePath,
    required this.categoryName,
    required this.wight,
    this.quantity = 0,
    this.disAble=false

  });
  ProductModel.fromMap(Map<String, dynamic> map) {
    id=map['id'];
    productName = map['productName'];
    description = map['description'];
    imagePath = map['imagePath'];

    wight = map['wight'];
    categoryName = map['categoryName'];
    quantity = map['quantity'];
    disAble = map['disAble'];

  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id']=id;
    map['productName'] = productName;
    map['description'] = description;
    map['imagePath'] = imagePath;
    map['wight'] = wight;

    map['categoryName'] = categoryName;
    map['quantity'] = quantity;
    map['disAble'] = disAble;

    return map;
  }
}