class CustomerModel {
  late String name;
  late String email;
  late String address;
  late String phoneNumber;
  late String password;
  late String bakeryName;
  bool? isAccept;
  bool? isReject;
  late String id;
  CustomerModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.address,
    required this.bakeryName,
    this.isAccept =false,
    this.isReject =false,
  });
  CustomerModel.fromMap(Map<String, dynamic> map) {
    id=map['id'];
    name = map['name'];
    email = map['email'];
    phoneNumber = map['phoneNumber'];
    password = map['password'];
    bakeryName = map['bakeryName'];
    address = map['address'];
    isAccept = map['isAccept'];
    isReject = map['isReject'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id']=id;
    map['name'] = name;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['bakeryName'] = bakeryName;
    map['address'] = address;
    map['isAccept'] = isAccept;
    map['isReject'] = isReject;
    return map;
  }
}
