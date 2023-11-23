import 'package:dot/services/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String email;
  final String uid;
  const ChatScreen({super.key, required this.email, required this.uid});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageKey = GlobalKey<FormFieldState>();
  final messageController = TextEditingController();
  final messageFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();


  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     // _scrollController.addListener(() {
  //     //   if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
  //     //     // You have reached the end of the list, load more items or perform any action
  //     //   }
  //     // });
  //     _scrollController.animateTo(
  //       _scrollController.position.maxScrollExtent,
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeOut,
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.email),
          backgroundColor: Theme.of(context).primaryColorLight),
      body: Column(
        children: [
          Expanded(child: StreamBuilder(
              stream: ChatService.receiveMessage(widget.uid),
              builder: (context, snapshot) {
                if(snapshot.hasError) {
                  return const Center(child: Text('Error!'),);
                }
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text('Loading'),);
                }
                if(snapshot.hasData) {
                  return ListView.builder(
                    reverse: true,
                    controller: _scrollController ,
                    padding: const EdgeInsets.all(10.0),
                    itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        String userId = FirebaseAuth.instance.currentUser!.uid;
                      var data = snapshot.data!.docs[index].data();
                    return messageContainer(data['message'], itsMe: userId == data['senderId']);
                  });
                }
                return Container();
              })),
          messageTextField()
        ],
      ),
    );
  }

  Widget messageContainer(String message, {bool itsMe = false}) {
    return Align(
      alignment: itsMe? Alignment.centerRight: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: itsMe? const Color(0xff65e8b4): const Color(0xffa9e37c),
          borderRadius: BorderRadius.circular(10.0)
        ),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
        child: Text(message, style: const TextStyle(fontSize: 16.0),),
      ),
    );
  }

  Widget messageTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              key: messageKey,
              focusNode: messageFocusNode,
              controller: messageController,
              autofocus: true,
              // onTapOutside: (event) {
              //   messageFocusNode.unfocus();
              // },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
                hintText: 'Type message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  )),
            ),
          ),
          IconButton(onPressed: () {
            ChatService.sendMessage(widget.uid, messageController.text);
            messageController.clear();
            // _scrollController.animateTo(
            //   _scrollController.position.maxScrollExtent,
            //   duration: const Duration(milliseconds: 300),
            //   curve: Curves.easeOut,
            // );
          }, icon: const Icon(Icons.send, size: 35.0))
        ],
      ),
    );
  }
}
