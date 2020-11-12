

class Cloudmodel{
  String name;
  String email;
  String number;
  String address;
  String img;

  Cloudmodel({this.email, this.name, this.address, this.number, this.img});

  Map<String ,dynamic>tomap(){
    var map=<String,dynamic>{
      'name':name,
      'number':number,
      'email':email,
      'address':address,
      'img':img,
    };
    return map;
  }
  Cloudmodel.fromMap(Map<String,dynamic>map){
    name=map['name'][name];
    number=map['number'][number];
    email=map['email'][email];
    address=map['address'][address];
    img=map['img'][img];
  }
}