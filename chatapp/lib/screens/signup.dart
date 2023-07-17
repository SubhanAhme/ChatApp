
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginView.dart';

class SignUPView extends StatelessWidget {
   SignUPView({super.key});

  TextEditingController semail_control = TextEditingController();
  TextEditingController spass_control = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController  profileImage = TextEditingController();
  TextEditingController  PhoneNo = TextEditingController();
  signup(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(

        email: semail_control.text,
        password: spass_control.text,
      );
      print("User Addes Successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  addUser() {
    CollectionReference userDetails=
        FirebaseFirestore.instance.collection("UserDetails");
        
       
     if(name.text.isEmpty ||profileImage.text.isEmpty||PhoneNo.text.isEmpty){
      print("the values are null");
     }
     else{
         userDetails.add({
        "name": name.text,
       "profileImage":profileImage.text,
       "phoneNo":PhoneNo.text,
        })
        .then((value) => print("User Info Added"))
        .catchError((e) => print(e));
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],   
      body: Stack(
        children: [
         Container(
            padding: EdgeInsets.only(top:120,left:MediaQuery.of(context).size.width*0.4,right:MediaQuery.of(context).size.width*0.4),
            
        child: Image(image: AssetImage("assets/image/logo.png")),
      
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 300,
                right: 35,
                left: 35,
              ),
              child: Container(
                 width: 450,
               
                decoration: BoxDecoration(
                 
                  
                  borderRadius: BorderRadius.circular(20),
                
                ),
                child: Column(
                  children: [
                     SizedBox(
                      width: 300,
                      child: TextField(
                        controller: name,
                       
                        decoration: InputDecoration(
                           prefixIcon: Icon(Icons.person_3_outlined,color: Colors.grey[600],),
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
                        controller: semail_control,
                       
                        decoration: InputDecoration(
                           prefixIcon: Icon(Icons.email,color: Colors.grey[600],),
                            fillColor: Colors.white30,
                            filled: true,
                            hintText: "Email",
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
                        controller: spass_control,
                        obscureText: true,
                        decoration: InputDecoration(
                           prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.grey[600],),
                            fillColor: Colors.white30,
                            filled: true,
                            hintText: "Password",
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
                        controller: profileImage,
                       
                        decoration: InputDecoration(
                           prefixIcon: Icon(Icons.image_outlined,color: Colors.grey[600],),
                            fillColor: Colors.white30,
                            filled: true,
                            hintText: "Profile Image",
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
                           prefixIcon: Icon(Icons.image_outlined,color: Colors.grey[600],),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sign UP",
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                            
                            ),
                          ),
                        ),
                        CircleAvatar(
              
                          radius: 30,
                          
                          child: IconButton(
                           onPressed: () => {
                            signup(context),
                            addUser(),
                            Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginView()),)
              
                            },
                            icon: Icon(Icons.arrow_forward),
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
              
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
