import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For DateFormat
import 'package:vidis/resources/firestore_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // For Firebase

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FireStoreMethods().meetingHistory, // Assuming this is returning a Firestore query snapshot stream
      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        // Check if the snapshot has data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("No meeting history available."),
          );
        }

        // Build the ListView with meeting history data
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var meetingData = snapshot.data!.docs[index].data();
            var meetingName = meetingData['meetingName'] ?? 'Unknown Meeting';
            var timestamp = meetingData['createdAt'] as Timestamp;
            var formattedDate = DateFormat.yMMMd().format(timestamp.toDate());

            return ListTile(
              title: Text("Room Name: $meetingName"),
              subtitle: Text("Joined On: $formattedDate"),
            );
          },
        );
      },
    );
  }
}
