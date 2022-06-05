class UserApp{
    String? name;
    String? email;
    String? phonenumber;
    String? password;
    String? jobtitle;
    bool? isaccept;
    bool? isreject;
    bool? disable;
  String? id;
  UserApp(
      {required this.name,
        required this.password,
        required this.email,
          this.disable=false,
          this.isaccept=false,
      this.isreject=false,
        required this.jobtitle,
        required this.phonenumber});

  UserApp.fromMap(Map<String, dynamic> map) {
    id=map['id'];
    name = map['name'];
    email = map['email'];
    phonenumber = map['phonenumber'];
    password = map['password'];
    jobtitle = map['jobtitle'];
    isaccept = map['isaccept'];
    isreject = map['isreject'];
    disable = map['disable'];


  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id']=id;
    map['name'] = name;
    map['email'] = email;
    map['phonenumber'] = phonenumber;
    map['password'] = password;
    map['jobtitle'] = jobtitle;
    map['isaccept'] = isaccept;
    map['isreject'] = isreject;
    map['disable'] = disable;
    return map;
  }










}