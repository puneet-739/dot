import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String email;
  final String uid;
  const ChatScreen({super.key, required this.email, required this.uid});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.email),
          backgroundColor: Theme.of(context).primaryColorLight),
      body: const Text('hello'),
    );
  }
}
