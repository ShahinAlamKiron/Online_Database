import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:offline_database/Models/Auth_Model.dart';
import 'package:offline_database/Pages/Dashbord_Page.dart';
import 'package:offline_database/Pages/Register_Page.dart';
import 'package:offline_database/Services/Firebase_Auth.dart';



class LogIn_Page extends StatefulWidget {
  @override
  _LogIn_PageState createState() => _LogIn_PageState();
}

class _LogIn_PageState extends State<LogIn_Page> {

  bool vissible=true;

  TextEditingController _email=new TextEditingController();
  TextEditingController _password=new TextEditingController();
  GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  GlobalKey<ScaffoldState>sangbar=GlobalKey<ScaffoldState>();
  AuthServices authServices;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: sangbar,
      backgroundColor: Colors.blueAccent,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Google Product",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
          SizedBox(height: 50,),
          Textield(),
        ],
      ),
    );
  }

//TextEdit Container
  Textield(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: Form(
        key: _globalKey,
        child: Column(
          children: [

            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              validator: (val){
                if(val.isEmpty){
                  sangbar.currentState.showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                      content: Text("Please your email")));
                }return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: "Enter Email",
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
                enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
              ),
            ),
            SizedBox(height: 20,),

            TextFormField (
              controller: _password,
              keyboardType: TextInputType.visiblePassword,
              validator: (val){
                if(val.isEmpty){
                  sangbar.currentState.showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Please your password")));
                }return null;
              },
              obscureText: vissible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      vissible=!vissible;
                    });
                  },
                  icon: vissible?Icon(Icons.visibility,color: Colors.blueAccent,):Icon(Icons.visibility_off,color: Colors.red,),
                ),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: "Enter Password",
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
                enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
              ),
            ),
            SizedBox(height: 15,),
            Row(mainAxisAlignment:MainAxisAlignment.end,children: [Text("Forget Password",
              style: TextStyle(color: Colors.white,decoration: TextDecoration.underline),)],),
            SizedBox(height: 40,),

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
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New account create?",style: TextStyle(color: Colors.white),),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Register_Page()));
                  },
                    child: Text("Sign Up",style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),)),

              ],)
          ],
        ),
      ),
    );
  }

  //validation
  validation()async{
    final valid=_globalKey.currentState;
    if(valid.validate()){

    }
  }

}
