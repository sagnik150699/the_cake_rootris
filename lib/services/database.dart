import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_cake_rootris/services/variable.dart';

class Database {
  Variable variable = new Variable();
  final _firebase = FirebaseFirestore.instance;
  final CollectionReference dish =
      FirebaseFirestore.instance.collection('dish');
  final CollectionReference price =
      FirebaseFirestore.instance.collection('price');
  final CollectionReference linkPic =
      FirebaseFirestore.instance.collection('linkPic');
  List<String> dishName;
  List<String> priceDish;
  List<String> picLink;

  Future returnDish() async {
    // await FirebaseFirestore.instance
    //     .collection('dish')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     print(doc['$data']);
    //     dishName.add(doc['$data']);
    //   });
    // });
    Map ss1;
    final messages=await FirebaseFirestore.instance.collection('dish').get();
    for(var message in messages.docs){
     // print(message.data());
      ss1=message.data();
    }
    dishName=ss1.entries.map((e) => "${e.value}").toList();

    return dishName;
  }
  Future test()async{
    List ss =[];
    Map ss1;
  final messages=await FirebaseFirestore.instance.collection('dish').get();
  for(var message in messages.docs){
    print(message.data());
   ss1=message.data();
  }
  ss=ss1.entries.map((e) => "${e.value}").toList();
  for(var swag in ss){
    print(swag);
  }
  }

  Future returnPrice() async {
    Map ss1;
    final messages=await FirebaseFirestore.instance.collection('price').get();
    for(var message in messages.docs){
    //  print(message.data());
      ss1=message.data();
    }
    priceDish=ss1.entries.map((e) => "${e.value}").toList();

    return priceDish;
  }

  Future returnLinks() async {
    Map ss1;
    final messages=await FirebaseFirestore.instance.collection('linkPic').get();
    for(var message in messages.docs){
     // print(message.data());
      ss1=message.data();
    }
    picLink=ss1.entries.map((e) => "${e.value}").toList();


    return picLink;
  }



  Future returnContainer<Stack>() async {
    // final List D = await returnDish();
    // final List P = await returnPrice();
    // final List L = await returnLinks();
    // var stacks;
    //
    // for (var i = 0; i < 5; i++) {
    //   stacks = variable.stack(
    //       Color(0xFFE0BD81), Color(0xffFFD897), L[i], D[i], P[i]);
    // }
    // return stacks;
  }

}
