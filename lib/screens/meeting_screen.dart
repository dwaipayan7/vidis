import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vidis/resources/jitsi_meet_methods.dart';
import 'package:vidis/screens/video_call_screen.dart';

import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
   MeetingScreen({super.key});

   final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

   createdNewMeeting() async{
     var random = Random();
     String roomName = (random.nextInt(10000000) + 1000000).toString();
     _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context){
     Navigator.push(context, MaterialPageRoute(builder: (context) => VideoCallScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(onPressed: (){
              createdNewMeeting();
            },
              icon: Icons.video_call, text: 'New Meeting',),
            HomeMeetingButton(onPressed: (){
              joinMeeting(context);
            },
              icon: Icons.add_box_rounded, text: 'Join Meeting',),
            HomeMeetingButton(onPressed: (){

            },
              icon: Icons.calendar_today, text: 'Scheduling',),
            HomeMeetingButton(onPressed: (){

            },
              icon: Icons.arrow_upward, text: 'Share Screen',),
          ],
        ),
        Expanded(
            child: Center(
              child: Text("Create/Join Meetings", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),),
            )
        )
      ],
    );
  }
}
