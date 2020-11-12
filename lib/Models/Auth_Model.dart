class AuthModel{
  String email;
  String password;
  String name;
  AuthModel({this.email, this.password, this.name});
  Map<String,dynamic>tomap(){
    var map=<String,dynamic>{
      'name':name,
      'email':email,
      'password':password,
    };
    return map;
  }
  AuthModel.fromMap(Map<String,dynamic>map){
    name=map['name'][name];
    email=map['email'][email];
    password=map['password'][password];
  }
}