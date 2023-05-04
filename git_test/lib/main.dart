import 'package:flutter/material.dart';

void main()=>runApp(new MaterialApp(
  home:  new MyApp(),

));
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          icon: Icon(Icons.menu), onPressed: () {  },
        ),

        title: Text('git test'),
      ),
    );
  }
}




