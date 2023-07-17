import 'package:chatapp/screens/homeview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Addfriends extends StatelessWidget {
  Addfriends({super.key});

  TextEditingController FullName = TextEditingController();
  TextEditingController PhoneNo = TextEditingController();


  void clearText() {
    FullName.clear();
    PhoneNo.clear();
  
  }
  addProduct() {
    CollectionReference FriendsDetail =
        FirebaseFirestore.instance.collection("FriendsDetail");
        
    FriendsDetail
        .add({
          "name": FullName.text,
          "price": PhoneNo.text,
          "isRead":false,
        
         
        })
        .then((value) => print("Product Adder"))
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.blue[400],
     
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Container(
              padding: EdgeInsets.only(top:60,left:MediaQuery.of(context).size.width*0.4,right:MediaQuery.of(context).size.width*0.4),
              
          child: Image(image: AssetImage("assets/image/logo.png")),
        
            ),
            SizedBox(height: 30,),
              SizedBox(
                  width: 300,
                child: TextField(
                  maxLength: 20,
                  controller: FullName,
                  decoration: InputDecoration(
                      fillColor: Colors.white30,
                      filled: true,
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 300,
                child: TextField(
                  controller: PhoneNo,
                  decoration: InputDecoration(
                      fillColor: Colors.white30,
                      filled: true,
                      hintText: "Phone No",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  addProduct();
                  clearText();
                },
                child: const Text("Add to Contact"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  )
                },
                child: const Text("Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}