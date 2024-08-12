import 'package:onesignal_flutter/onesignal_flutter.dart';

const oneSignalAppId = "";

Future<void> initOneSignal() async {
  OneSignal.initialize('1f643336-9d73-4c65-ac00-38d499b8c462');
  OneSignal.Notifications.requestPermission(true).then((value) {
    print('signal value : $value');
  });
}

void registerOneSignalEventListener({
  required Function(OSNotificationClickEvent) onOpened,
  required Function(OSNotificationClickResult) onReceivedInForeground,
}) {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("1f643336-9d73-4c65-ac00-38d499b8c462");
  OneSignal.Notifications.requestPermission(true);
}

const tagName = "userId";

void sendUserTag(int schoolId) {
  OneSignal.User.addTagWithKey("schoolId", schoolId);

  // OneSignal.shared.sendTag(tagName, userId.toString()).then((response) {
  //   vLog("Successfully sent tags with response: $response");
  // }).catchError((error) {
  //   vLog("Encountered an error sending tags: $error");
  // });
}

void deleteUserTag() {
  OneSignal.User.removeTag("userId");
  // OneSignal.shared.deleteTag(tagName).then((response) {
  //   vLog("Successfully deleted tags with response $response");
  // }).catchError((error) {
  //   vLog("Encountered error deleting tag: $error");
  // });
}
