import 'package:flutter/material.dart';
import 'package:the_cake_rootris/services/auth.dart';
import 'file:///C:/Users/Sagnik%20Bhattacharya/Documents/Workspace/the_cake_rootris/lib/services/variable.dart';
import 'package:the_cake_rootris/services/database.dart';

class Mobile extends StatefulWidget {
  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  Authentication _authentication = new Authentication();
  //TextEditingController search= TextEditingController();
  String search1=Authentication().search;
  Database _database = new Database();
  Variable variable = new Variable();
  List<Stack> stacks=[];

  Future getList<Stack>() async {
    // // stacks = await _database.returnContainer();
    List<String> D=[];
    List<String> P=[];
    List<String> L=[];


      D = await _database.returnDish();
      P = await _database.returnPrice();
      L = await _database.returnLinks();
      stacks.add(variable.widthBig());
      for (var i =0;i<D.length;i++){
        stacks.add(variable.stack(
            Color(0xffF082AC),
            Color(0xff90A8E8), "https://firebasestorage.googleapis.com/v0/b/the-cake-rootris-21ead.appspot.com/o/donut.png?alt=media&token=98a08b40-ad2b-41b8-aafb-7637eabd8cb4", D[i], P[i]));
        stacks.add(variable.widthStack());
      }


    return stacks;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height;
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xffE9D5ED),
                    const Color(0xffDBF3FF),
                    const Color(0xffE9D5ED),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Container(
                height: categoryHeight,
                child: ListView(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      //Hi Name
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, bottom: 0.0),
                            child: FutureBuilder(
                                //AsyncSnapshot<String>
                                future: _authentication.requestName(),
                                builder: (BuildContext context, snapshot) {
                                  return variable.text("Hi ${snapshot.data}!",
                                      18.0, Colors.black, FontWeight.w400);
                                }),
                          ),
                          //Image.network('https://picsum.photos/250?image=9'),
                        ],
                      ),
                      //What would you
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: variable.text("What would you", 30.0,
                            Colors.black, FontWeight.bold),
                      ),
                      //like to eat
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: variable.text("like to eat?", 30.0, Colors.black,
                            FontWeight.bold),
                      ),
                      //Search bar stack with search button
                      Stack(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextField(
                              //controller: Authentication.search,
                              onChanged: (value) => Authentication().searchData(value.toString()),
                              decoration: InputDecoration(
                                  // border: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.all(Radius.circular(5.0))
                                  // ),
                                  // icon: IconButton(icon: Icon(Icons.search,) ),
                                  hintText: "or type what you're looking for"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 350.0,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    print("Helllo");
                                  });

                                },
                                icon: Icon(
                                  Icons.search,
                                  size: 35,
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      //First ListView with side options
                      Container(
                        height: 330.0,
                        child: Stack(children: [




                        

                          (search1!=null)? SizedBox():
                          FutureBuilder(
                              future: getList(),
                              builder: (context, AsyncSnapshot snapshot) {
                                print(search1);
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                    itemCount: stacks.length,
                                    itemBuilder: (context, index) {
                                      return stacks[index];
                                    });
                              }),






                          Container(
                            //color: Color(0xFFE5E7F1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0)),
                              color: Color(0xFFE5E7F1),
                            ),
                            height: 330,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: MaterialButton(
                                    highlightColor: Colors.pinkAccent.shade100,
                                    onPressed: () {},
                                    child: variable.text("Cakes", 18.0,
                                        Colors.black, FontWeight.normal),
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: MaterialButton(
                                    highlightColor: Colors.pinkAccent.shade100,
                                    onPressed: () => print("Cake"),
                                    child: variable.text("Pastry", 18.0,
                                        Colors.black, FontWeight.normal),
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: MaterialButton(
                                    highlightColor: Colors.pinkAccent.shade100,
                                    onPressed: () => print("Drinks"),
                                    child: variable.text("Cheese", 17.0,
                                        Colors.black, FontWeight.normal),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      variable.text("Explore from categories", 25.0,
                          Colors.black, FontWeight.normal),

                      //Lower stack
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            variable.bottomStack(
                                Color(0xffF6C9FF),
                                Color(0xffF6C9FF),
                                120.0,
                                130.0,
                                "images/donuts.png",
                                "New this week"),
                            SizedBox(
                              width: 20,
                            ),
                            variable.bottomStack(
                                Color(0xFFB3F4DD),
                                Color(0xFFB3F4DB),
                                120.0,
                                130.0,
                                "images/donuts.png",
                                "Best Seller"),
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
