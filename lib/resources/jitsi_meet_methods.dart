import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'auth_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();

  Future<void> createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      // Initialize Jitsi Meet SDK instance
      var jitsiMeet = JitsiMeet();

      // Determine the display name to be shown in the meeting
      String displayName = username.isEmpty ? _authMethods.user.displayName! : username;

      // Create options for the meeting using JitsiMeetConferenceOptions
      var options = JitsiMeetConferenceOptions(
        serverURL: "https://meet.jit.si",  // Specify the server (Jitsi's public server here)
        room: roomName,                    // Unique room name for the meeting
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,    // Whether audio should be muted at start
          "startWithVideoMuted": isVideoMuted,    // Whether video should be muted at start
        },
        featureFlags: {
          "unsaferoomwarning.enabled": false,  // Disable warning for unsafe room names
          "welcomePageEnabled": false,         // Disable the welcome page
        },
        userInfo: JitsiMeetUserInfo(
          displayName: displayName,   // Set the display name
          email: _authMethods.user.email,   // Set user email
        ),
      );

      // Join the meeting with the specified options
      await jitsiMeet.join(options);

    } catch (error) {
      print("Error joining meeting: $error");
    }
  }
}
