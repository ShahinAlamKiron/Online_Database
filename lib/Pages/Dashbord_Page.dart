import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offline_database/Services/Provider.dart';
import 'package:provider/provider.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'Setting_Page.dart';

class Dashbord_Page extends StatefulWidget {
  @override
  _Dashbord_PageState createState() => _Dashbord_PageState();
}

class _Dashbord_PageState extends State<Dashbord_Page> {



  GlobalKey<ScaffoldState>_drawer=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final data=Provider.of<provides>(context).catagory;
    return Scaffold(
      key: _drawer,
      backgroundColor: Colors.blueAccent,

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("Google Product",style: TextStyle(fontSize: 20,),),
        leading: IconButton(icon:Icon(Icons.sort,size: 30,),
          onPressed: (){
            //To Do
            _drawer.currentState.openDrawer();
          },),
        actions: [
          IconButton(icon: Icon(Icons.settings),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting_Page()));
          },),
          SizedBox(width: 10,)
        ],
      ),

      drawer:drawerOpen(),

      //Body Style Part
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20,),
            cetagory(),

            Container(
              margin: EdgeInsets.only(right: 10,left: 10,top: 15),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Carousel(
                    animationDuration: Duration(milliseconds: 1000),
                    animationCurve: Curves.fastOutSlowIn,
                    dotBgColor: Colors.transparent,
                    dotSize: 5,
                    dotColor: Colors.amber,
                    dotIncreasedColor: Colors.red,
                    images: [
                    NetworkImage('https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
                    NetworkImage('https://images.unsplash.com/photo-1526947425960-945c6e72858f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),

                    NetworkImage('https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
                    NetworkImage('https://images.unsplash.com/photo-1513116476489-7635e79feb27?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=684&q=80'),

                    NetworkImage('https://images.unsplash.com/photo-1509695507497-903c140c43b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80'),
                    NetworkImage('https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=708&q=80'),

                  ],)),
            ),
            Container(
              margin: EdgeInsets.only(right: 10,left: 10,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Top Sell",style: TextStyle(fontSize: 16,color: Colors.white),),
                Text("See More",style: TextStyle(fontSize: 16,color: Colors.white),),
              ],),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.network("https://images.unsplash.com/photo-1578021046026-483fa99ffad2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",fit: BoxFit.cover,)),
                        ),
                        Positioned(
                          bottom:- 50,
                            top: 30,
                            right: 20,
                            left: 20,
                            child:Text("Shoes",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),))
                      ],
                    ),
                    SizedBox(width: 5,),

                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.network("https://images.unsplash.com/photo-1542153492-3864a9da8737?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",fit: BoxFit.cover,)),
                        ),
                        Positioned(
                            bottom:- 50,
                            top: 30,
                            right: 20,
                            left: 20,
                            child:Text("Gadget",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),))
                      ],
                    ),
                    SizedBox(width: 5,),

                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.network("https://images.unsplash.com/photo-1566492625401-af879a7559f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1575&q=80",fit: BoxFit.cover,)),
                        ),
                        Positioned(
                            bottom:- 50,
                            top: 20,
                            right: 20,
                            left: 20,
                            child:Text("Mobile Phone",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),))
                      ],
                    ),
                    SizedBox(width: 5,),

                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.network("https://images.unsplash.com/photo-1586495777744-4413f21062fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=358&q=80",fit: BoxFit.cover,)),
                        ),
                        Positioned(
                            bottom:- 50,
                            top: 20,
                            right: 20,
                            left: 20,
                            child:Text("Nail Polish",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),))
                      ],
                    ),
                    SizedBox(width: 5,),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


  drawerOpen(){
    return Drawer(
      child:ListView(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.blue),
            child: Carousel(
              animationDuration: Duration(milliseconds: 1000),
              animationCurve: Curves.fastOutSlowIn,
              dotBgColor: Colors.transparent,
              dotSize: 5,
              dotColor: Colors.amber,
              dotIncreasedColor: Colors.red,
              images: [
                NetworkImage('https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
                NetworkImage('https://images.unsplash.com/photo-1526947425960-945c6e72858f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),

                NetworkImage('https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
                NetworkImage('https://images.unsplash.com/photo-1513116476489-7635e79feb27?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=684&q=80'),

                NetworkImage('https://images.unsplash.com/photo-1509695507497-903c140c43b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80'),
                NetworkImage('https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=708&q=80'),

              ],),
          )
        ],
      ),
    );
  }

}

//Catagory List Item
class cetagory extends StatefulWidget {
  @override
  _cetagoryState createState() => _cetagoryState();
}

class _cetagoryState extends State<cetagory> {

  List<String>list=['T-Shirts',"Man's Shirts",'Panjabi','Polo-Shirts',"Man's Pant","Man's Jeans","Man's Shoes","Man's Balt"];
  int selectes=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectes=index;
                });
              },
              child: Container(
                alignment: AlignmentDirectional.center,
                margin: EdgeInsets.symmetric(horizontal: 7,vertical: 7),
                padding: EdgeInsets.symmetric(horizontal: 7,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                    color: index==selectes?Colors.white54:Colors.transparent),
                child: Text(list[index],style:TextStyle(color: index==selectes?Colors.white:Colors.white,fontSize: 15,
                    fontWeight: FontWeight.w500),),),
            );
          }),
    );
  }

}





