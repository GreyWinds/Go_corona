import 'package:covid19/firstpage.dart';
import 'package:covid19/sympton.dart';
import 'package:flutter/material.dart';
import 'report.dart';
import 'country.dart';
import 'prev.dart';

void main()=> runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      initialRoute: '/',
      routes: {
         '/': (context) => FirstPage(),
         '/greports': (context) => ReportsPage(),
         '/country': (context) => CountryPage(),
         '/sympton': (context) =>  SymptomsItems(),
        '/prev' : (context) => SymptomsItems2(),
  }
    );
  }
}