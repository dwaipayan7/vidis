import 'package:flutter/material.dart';
import 'package:vidis/utils/colors.dart';
import 'package:vidis/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;  // Moved outside of build to retain the state

  // Function to handle page changes when an item is selected
  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Meet & Status", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: backgroundColor,

      ),
      backgroundColor: backgroundColor,
      // You can add content here based on the current page index (_page)
      body: Column(
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeMeetingButton(onPressed: (){}, icon: Icons.video_call, text: 'New Meeting',),
                HomeMeetingButton(onPressed: (){}, icon: Icons.add_box_rounded, text: 'Join Meeting',),
                HomeMeetingButton(onPressed: (){}, icon: Icons.calendar_today, text: 'Scheduling',),
                HomeMeetingButton(onPressed: (){}, icon: Icons.arrow_upward, text: 'Share Screen',),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        unselectedFontSize: 14,
        selectedFontSize: 15,
        // type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: footerColor,
            icon: Icon(Icons.comment_bank),
            label: "Meet & Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: "Meeting",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
