class ProductModel {
  late String productName;
  late String description;
  late String category;
  late String imagePath;
  late bool wight50;
  late bool wight100;
  late int quantity;

   String? id;
  ProductModel({
    required this.productName,
    required this.description,
    required this.imagePath,
    required this.wight50,
    required this.category,
    required this.wight100,
    this.quantity = 0,

  });
  ProductModel.fromMap(Map<String, dynamic> map) {
    id=map['id'];
    productName = map['productName'];
    description = map['description'];
    imagePath = map['imagePath'];
    wight50 = map['wight50'];
    wight100 = map['wight100'];
    category = map['category'];
    quantity = map['quantity'];

  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id']=id;
    map['productName'] = productName;
    map['description'] = description;
    map['imagePath'] = imagePath;
    map['wight50'] = wight50;
    map['wight100'] = wight100;
    map['category'] = category;
    map['quantity'] = quantity;

    return map;
  }
}