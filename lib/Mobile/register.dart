import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_cake_rootris/Mobile/mobile.dart';
import 'package:the_cake_rootris/services/auth.dart';
import 'file:///C:/Users/Sagnik%20Bhattacharya/Documents/Workspace/the_cake_rootris/lib/services/variable.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _name = TextEditingController();
  Variable _variable = new Variable();
  final _auth = FirebaseAuth.instance;
  Authentication _authentication = new Authentication();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height;
    final double categoryWidth = size.width;
    return  MaterialApp(
      home: Scaffold(
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
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    _variable.text2(
                        "Please Enter Name", 25.0, Colors.black, FontWeight.normal),
                    SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      controller: _name,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pinkAccent),
                              borderRadius: BorderRadius.all(Radius.circular(30.0))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          hintText: "Name",
                          hintStyle: GoogleFonts.tajawal()),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: categoryHeight/13,
                      child: Padding(
                        padding:const EdgeInsets.only(left: 50.0, right: 50.0) ,
                        child: MaterialButton(
                          child: Text("Next", style: GoogleFonts.abel(fontSize: 25,fontWeight: FontWeight.bold,  ),),
                          onPressed: ()async{
                            try{
                              await _authentication.setName(_name.text);
                              final name=await _authentication.requestName();
                              print(name);
                              Navigator.push(context,
                                MaterialPageRoute
                                  (builder: (context) => Mobile()),);
                            }
                            catch(e){
                              print(e);
                            }


                          },
                          splashColor: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.pinkAccent, ),
                              borderRadius: BorderRadius.circular(10.0)),


                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
