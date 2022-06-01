class User{

  late String name;
  late String email;
  late String phonenumber;
  late String password;
  late String jobtitle;



   bool isaccept=false;
   bool isreject=false;





   bool disable=false;





  late String path;

  User();

  User.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    phonenumber = map['phonenumber'];
    password = map['password'];
    jobtitle = map['jobtitle'];
    isaccept = map['false'];
    isreject = map['false'];
    disable = map['false'];


  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phonenumber'] = phonenumber;
    map['password'] = password;
    map['jobtitle'] = jobtitle;
    map['false'] = isaccept;
    map['false'] = isreject;
    map['false'] = disable;

    return map;
  }










}