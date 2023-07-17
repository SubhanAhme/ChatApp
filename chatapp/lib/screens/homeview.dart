import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'addFriend.dart';



class HomeView extends StatelessWidget {
  HomeView({super.key});
 
  CollectionReference UserDetails =
      FirebaseFirestore.instance.collection("UserDetails");

  getAllProducts() async {
    return UserDetails.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'ChatApp',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(width: 10,),
           Image(image: AssetImage("assets/image/logo.png"),height: 40,width: 40,)
          ],
        ),
        actions: [
           IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera),
            color: Colors.black87,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black87,
          ),
          IconButton(
            onPressed: () {
           
            },
            icon: const Icon(Icons.more_vert),
            color: Colors.black87,
          ),
          SizedBox(
            width: 1,
          )
        ],
      ),
      body: Center(
        child: FutureBuilder(
            future: getAllProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var did =snapshot.data.docs;
                return ListView.builder(
                  
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(backgroundImage: NetworkImage(snapshot.data.docs[index]['profileImage'])),
                        title: Text(snapshot.data.docs[index]['name']),
                        // subtitle: Text(snapshot.data.docs[index]['profileImage']),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }),
            
            
      ),
       floatingActionButton: CircleAvatar(
        child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addfriends(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black87,
            )),)
    );
  }
}










