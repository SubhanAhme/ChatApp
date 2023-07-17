
import 'package:chatapp/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homeview.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});

   TextEditingController email_control = TextEditingController();
  TextEditingController pass_control = TextEditingController();

  @override
    login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email_control.text,
          password: pass_control.text);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>  HomeView(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Scaffold(
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
                height: 350,
                decoration: BoxDecoration(
                 
                  
                  borderRadius: BorderRadius.circular(20),
                
                ),
                
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    SizedBox(width: 300,
                      child: TextField(
                          controller: email_control,
                       
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
                    SizedBox(width: 300,
                      child: TextField(
                          controller: pass_control,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () => {
                           
                          
                            },
                          child: Text(
                            "Sign IN",
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
                           login(context),
            
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                           
                        
                           onPressed: () => {
                           
                            Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUPView()),)
            
                            },
            
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 17,
                              
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "forgot password",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 17,
                              
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}