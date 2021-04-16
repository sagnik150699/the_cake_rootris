import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:the_cake_rootris/Mobile/mobile.dart';
import 'package:the_cake_rootris/Mobile/register.dart';
import 'package:the_cake_rootris/services/auth.dart';
import 'file:///C:/Users/Sagnik%20Bhattacharya/Documents/Workspace/the_cake_rootris/lib/services/variable.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  Authentication _authentication = new Authentication();
  Variable _variable = new Variable();

  @override
  Widget build(BuildContext context) {
    final Authentication authentication = Provider.of<Authentication>(context);
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height;
    final double categoryWidth = size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xffE9D5ED),
                  const Color(0xffE9D5ED),
                  const Color(0xffDBF3FF),
                ],
              ),
            ),
          ),
          ListView(
            children: [
              //Image
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0, top: 30),
                child: CircleAvatar(
                  child: Image(
                    image: AssetImage('images/logo.png'),
                  ),
                  radius: 100.0,
                ),
              ),
              //Email Input
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  controller: _emailField,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.pinkAccent,
                      ),
                      hintText: "Email",
                      hintStyle: GoogleFonts.tajawal()),
                ),
              ),
              SizedBox(height: 20),
              //Password Input
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _passwordField,
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pinkAccent),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      prefixIcon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.pinkAccent,
                      ),
                      hintText: "Password",
                      hintStyle: GoogleFonts.tajawal()),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              //Login+Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Register
                  Container(
                    height: categoryHeight / 13,
                    width: categoryWidth / 2.5,
                    child: MaterialButton(
                      child: Text("Register",
                          style: GoogleFonts.abel(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      onPressed: () async {
                        final entry = await _authentication.emailRegister(
                            _emailField.text, _passwordField.text);
                        if (authentication.error == null) {
                          final snackBar = SnackBar(
                            content: Text('Success'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                        if (entry == true) {
                          final snackBar = SnackBar(
                            content: Text(authentication.error),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                        }
                      },

                      splashColor: Colors.pinkAccent,
                      // color: Colors.pink[300],
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.pinkAccent),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  //Login
                  Container(
                    height: categoryHeight / 13,
                    width: categoryWidth / 2.5,
                    child: MaterialButton(
                      child: Text(
                        "Login",
                        style: GoogleFonts.abel(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        final userLogin = await _authentication.emailLogin(
                            _emailField.text, _passwordField.text);
                        if (userLogin == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Mobile()),
                          );
                        }
                      },
                      splashColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.pinkAccent,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //Google Sign In button
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: SignInButton(
                  Buttons.Google,
                  onPressed: () async {
                    var a = await _authentication.googleSigning();
                    if (a == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mobile()),
                      );
                    } else
                      print("Cannot Log In");
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0)),
                  padding: EdgeInsets.all(12.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
