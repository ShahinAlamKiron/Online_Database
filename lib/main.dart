import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Pages/HomePage.dart';
import 'Pages/LogIn_Page.dart';
import 'Services/Provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) =>provides(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Offline Database',
        theme: ThemeData(
        ),
        home: LogIn_Page(),
      ),
    );
  }
}
