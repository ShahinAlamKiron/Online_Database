import 'package:flutter/material.dart'; 
import 'package:image_picker/image_picker.dart';
import 'package:offline_database/Models/Cloud_Model.dart';


class Setting_Page extends StatefulWidget {
  @override
  _Setting_PageState createState() => _Setting_PageState();
}

class _Setting_PageState extends State<Setting_Page> {

  var _image;
  Cloudmodel cloudmodel;
  TextEditingController _name=new TextEditingController();
  TextEditingController _number=new TextEditingController();
  TextEditingController _email=new TextEditingController();
  TextEditingController _address=new TextEditingController();
  GlobalKey<ScaffoldState>snakbar=GlobalKey<ScaffoldState>();
  GlobalKey<FormState>_Formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      resizeToAvoidBottomPadding: false,
      key: snakbar,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: Text("Settings",style: TextStyle(fontSize: 20),),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding:  EdgeInsets.only(top: 20,right: 15,left: 15,bottom: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  getImage();
                },
                child: CircleAvatar(
                  radius: 70,
                  child: _image==null?Icon(Icons.person,size: 80,):CircleAvatar(backgroundImage: FileImage(_image),),
                ),
              ),
              SizedBox(height: 50,),
              textForm(),
            ],
          ),
        ),
      ),
    );
  }

  textForm(){
    return Form(
      key: _Formkey,
      child: Column(
        children: [

          TextFormField (
            controller: _name,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: "Enter Name",
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.blueAccent)),
              enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.white70)),
            ),
          ),
          SizedBox(height: 15,),

          TextFormField (
            controller: _email,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: "Enter E-mail",
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.blueAccent)),
              enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.white70)),
            ),
          ),
          SizedBox(height: 15,),

          TextFormField (
            controller: _number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: "Enter Number",
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.blueAccent)),
              enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.white70)),
            ),
          ),
          SizedBox(height: 15,),

          TextFormField(
            controller: _address,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintText: "Enter Address",
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.blueAccent)),
              enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.white70)),
            ),
          ),
          SizedBox(height: 60,),

          Container(
            height: 50,
            width: double.infinity,
            child: RaisedButton(
              child: Text("Sign In",style: TextStyle(fontSize: 17,color: Colors.white),),
              elevation: 0,
              color: Color(0xff0955C8),
              onPressed: (){
                //to do
                validation();
              },),
          ),
        ],
      ),
    );
  }


  Future getImage()async{
    final images=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=images;
    });
  }



  validation() async{
    if (_name.text.isEmpty && _email.text.isEmpty && _number.text.isEmpty &&
        _address.text.isEmpty){
      snakbar.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("All input data empty")));

    } else if (_name.text.isEmpty) {
      snakbar.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("your name empty")));

    } else if (_email.text.isEmpty) {
      snakbar.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("your email empty")));

    } else if (_number.text.isEmpty) {
      snakbar.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("your number empty")));

    } else if (_address.text.isEmpty) {
      snakbar.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("your address empty")));

    } else if (_image == null) {
      snakbar.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("your image not selected")));

      if (_Formkey.currentState.validate()){
        if(cloudmodel==null){
          Cloudmodel cloudmodel=new Cloudmodel(name: _name.text,email: _email.text,number: _number.text, address: _address.text,img: _image);
        }
      }
    }
  }


}
