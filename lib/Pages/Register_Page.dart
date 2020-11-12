import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offline_database/Models/Auth_Model.dart';
import 'package:offline_database/Pages/Dashbord_Page.dart';
import 'package:offline_database/Services/Firebase_Auth.dart';

class Register_Page extends StatefulWidget {
  @override
  _Register_PageState createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {

  TextEditingController name=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();
  GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  GlobalKey<ScaffoldState>_snakbar=GlobalKey<ScaffoldState>();

  bool showpass=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _snakbar,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue,

      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              alignment: AlignmentDirectional.bottomCenter,
              child: Text("Google Product",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30,color: Colors.white),),
            ),
            SizedBox(height: 50,),

            //TextFormFild Container
            Container(
              padding: EdgeInsets.only(right: 20,left: 20),
              width: double.infinity,
              child: Column(
                children: [

                  //Name TextFormFild
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Name",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 17),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
                      enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
                    ),
                  ),
                  SizedBox(height: 15,),

                  //Email TextFormFild
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Email",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 17),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
                      enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
                    ),
                  ),
                  SizedBox(height: 15,),

                  //Password TextFormFild
                  TextFormField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText:showpass,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            showpass=!showpass;
                          });
                        },
                        icon: showpass?Icon(Icons.visibility,color: Colors.blue,):Icon(Icons.visibility_off,color: Colors.red,),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Password",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 17),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
                      enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
                    ),
                  ),
                  SizedBox(height: 50,),

                  Container(
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text("Sign Up",style: TextStyle(fontSize: 17,color: Colors.white),),
                      elevation: 0,
                      color: Color(0xff0955C8),
                      onPressed: (){
                        //to do
                        validation();
                      },),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  validation(){
    if(name.text.isEmpty && email.text.isEmpty && password.text.isEmpty){
       _snakbar.currentState.showSnackBar(SnackBar(
           backgroundColor: Colors.red,
           content: Text("All input data empty")));
    }else if(name.text.isEmpty){
       _snakbar.currentState.showSnackBar(SnackBar(
           backgroundColor: Colors.red,
           content: Text("your name empty")));
    } else if(email.text.isEmpty){
       _snakbar.currentState.showSnackBar(SnackBar(
           backgroundColor: Colors.red,
           content: Text("your email empty")));
    }else if(password.text.isEmpty){
       _snakbar.currentState.showSnackBar(SnackBar(
           backgroundColor: Colors.red,
           content: Text("your password empty")));
    }

    if(_globalKey.currentState.validate()){

    }
  }

}
