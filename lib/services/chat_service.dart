import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dot/model/message.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  // SEND MESSAGE
  static sendMessage(String receiverId, String message) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    Timestamp timestamp = Timestamp.now();
    Message messageObj = Message(
        senderId: userId,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);
    List<String> idLists = [userId, receiverId];
    idLists.sort();
    String chatRoomId = idLists.join('_');
    await FirebaseFirestore.instance
        .collection('chat-rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(messageObj.toMap());
  }

  // RECEIVE MESSAGE
  static receiveMessage(String userId, String receiverId) {
    List<String> idLists = [userId, receiverId];
    idLists.sort();
    String chatRoomId = idLists.join('_');
    return FirebaseFirestore.instance
        .collection('chat-rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
