import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dot/chatPage/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return userList();
          }
          return const Center(
            child: Text('Please Login First!'),
          );
        });
  }

  Widget userList() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Loading...'));
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                String userId = FirebaseAuth.instance.currentUser!.uid;
                var data = snapshot.data!.docs[index].data();
                return userListContainer(data, itsMe: userId == data['uid']);
              });
        });
  }

  Widget userListContainer(data, {bool itsMe = false}) {
    String uid = data['uid'];
    String email = data['email'];
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(
                      email: email.split('@').first, uid: uid,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35.0,
              child: Text(
                email[0].toUpperCase(),
                style: const TextStyle(fontSize: 28.0),
              ),
            ),
            const SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(email.split('@').first, style: const TextStyle(fontSize: 16.0),),
                if(itsMe) const Text('(Its your personal space)', style: TextStyle(fontSize: 12.0),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
