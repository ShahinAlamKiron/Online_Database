import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offline_database/Constent_Page.dart';
import 'package:offline_database/Models/Employee_Model.dart';
import 'package:offline_database/Services/EmployeeDB.dart';

import 'LogIn_Page.dart';

class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  GlobalKey<ScaffoldState>Snakbar=GlobalKey<ScaffoldState>();
  GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  TextEditingController _name=new TextEditingController();
  TextEditingController _course=new TextEditingController();
  
  
  DBManager _dbManager=new DBManager();
  Employee _employee;
  List<Employee>_listemployee=[];

  bool showdata=true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      key: Snakbar,
      
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            height:360,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight:Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
                color:blueColor),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                //Offline Database Text Widget
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(

                      onTap: ()async{
                        List<Employee>list=await _dbManager.getdb();
                        setState(() {
                          showdata=!showdata;
                          _listemployee=list;
                        });
                      },
                      child: Text(showdata?"Offline Database":"Show Data",style: TextStyle(fontSize: 30,color:fontColor),))
                ],
              ),

                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 30),
                  child: Form(
                    key: _globalKey,

                    child: Column(
                      children: [

                        //Name TextFormFild
                        TextFormField(
                          controller: _name,
                          validator: (val){
                            if(val.isEmpty){
                              Snakbar.currentState.showSnackBar(SnackBar(
                                backgroundColor: blueColor,
                                  content: Text('Invalid your Name')));
                            }return null;
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:fillColor)),
                            enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:fillColor)),
                            hintText: "Enter Name",
                              hintStyle: TextStyle(color: blueColor),
                              filled: true,
                            fillColor: fillColor,
                            contentPadding: EdgeInsets.symmetric(horizontal: 12),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                          ),
                        ),
                        SizedBox(height: 10,),

                        //Course TextFormFild
                        TextFormField(
                          controller: _course,
                          validator: (val){
                            if(val.isEmpty){
                              Snakbar.currentState.showSnackBar(SnackBar(
                                  backgroundColor: blueColor,
                                  content: Text('Invalid your Course')));
                            }return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:fillColor)),
                              enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:fillColor)),
                              hintText: "Enter Course",
                              hintStyle: TextStyle(color: blueColor),
                              filled: true,
                              fillColor: fillColor,
                              contentPadding: EdgeInsets.symmetric(horizontal: 12),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                          ),
                        ),
                        SizedBox(height: 20,),

                        //Button Container
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 0,
                            color: buttonColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Text("Save Data",style: TextStyle(fontSize: 20,color: fontColor),),
                            onPressed: (){
                              valid();
                            },
                          ),)
                      ],
                    ),
                  ),
                ),

            ],),
          ),

          Expanded(
              child:Container(
                child: ListView.builder(
                    itemCount:_listemployee==null?0:_listemployee.length,
                    itemBuilder: (context,index){
                      Employee data=_listemployee[index];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),

                        child: ListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          tileColor: fontColor,
                          leading: CircleAvatar(child: Icon(Icons.check),),
                          subtitle: Text(data.course,style: TextStyle(fontSize: 16),),
                          title: Text(data.name,style: TextStyle(fontSize: 25),),
                          trailing: CircleAvatar(
                            backgroundColor: fillColor,
                            radius: 20,
                            child: IconButton(
                              icon: Icon(Icons.delete,color: Colors.red,),
                              onPressed: (){
                                _dbManager.deletedb(data.id);
                                setState(() {
                                  _listemployee.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    }),
              ))
        ],
      ),

      //Floating ActionButton
      floatingActionButton: FloatingActionButton(
        elevation: 2,child: Icon(Icons.arrow_forward_ios_rounded),
      onPressed: (){
          //To Do
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn_Page()));
      },),

    );
  }
  valid(){
    if(_name.text.isEmpty && _course.text.isEmpty){
      Snakbar.currentState.showSnackBar(SnackBar(content: Text("Empty your input")));
    }else if(_name.text.isEmpty){
      Snakbar.currentState.showSnackBar(SnackBar(content: Text("Empty your Name")));
    }else if(_name.text.isEmpty){
      Snakbar.currentState.showSnackBar(SnackBar(content: Text("Empty your Course")));
    }
    if(_globalKey.currentState.validate()){
      if(_employee==null){
        Employee employee=Employee(name: _name.text, course: _course.text);
        _dbManager.insertDb(employee).then((index) => {
          _name.clear(),
          _course.clear(),
          print("Database Add Data"),
        });
      }

    }
  }

}
