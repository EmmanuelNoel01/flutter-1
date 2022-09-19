import 'package:firebase_core/firebase_coare.dart';
import 'package:flutter/material.dart';
import 'package:school/pages/forums.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'school',
      theme: ThemeData(
        scaffoldBackgroundColor: KBackgroundColor,
        primaryColor: KPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: KTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.green,
      ),
      home: MyStatefulWidget(),
    );
  }
}
