import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cake_rootris/Mobile/login.dart';
import 'package:the_cake_rootris/Mobile/mobile.dart';
import 'package:the_cake_rootris/Web/web.dart';
import 'package:the_cake_rootris/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Authentication _authentication = new Authentication();
  bool entry = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Authentication>.value(
      value: Authentication(),
      child: MaterialApp(
        home: Scaffold(
          body: FutureBuilder(
              future: _authentication.isSigned(),
              builder: (BuildContext context, snapshot) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 800)
                      return Web();
                    else if (snapshot.data == true) {
                      return Mobile();
                    } else
                      return LoginScreen();
                  },
                );
              }),
        ),
      ),
    );
  }
}
