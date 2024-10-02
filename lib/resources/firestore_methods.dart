import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingHistory => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('meetingHistory')
      .snapshots();

  void addToMeetingHistory(String meetingName) async {
    try {
      // Access the 'users' collection, then the current user's document,
      // and add the meeting data to a 'meetingHistory' subcollection
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetingHistory')  // Corrected the collection name
          .add({                          // Use .add() to add a new document
        'meetingName': meetingName,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      print('Error adding to meeting history: $e');
    }
  }
}