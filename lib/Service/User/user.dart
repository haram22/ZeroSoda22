import 'package:cloud_firestore/cloud_firestore.dart';

class UsersName { //파이어 스토에서 정보 읽기 위해 가져오기 
  late String Calendar;
  late String CalendarPrice;
  late String timestamp;
  late String email;
  late String id;
  late String profileName;
  late String serverAuthCode;
  late String url;

  UsersName({
    required this.Calendar,
    required this.CalendarPrice,
    required this.timestamp,
    required this.email,
    required this.id,
    required this.profileName,
    required this.serverAuthCode,
    required this.url,
  });
  
  UsersName.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    Calendar = data['Calendar'];
    CalendarPrice = data['CalendarPrice'];
    timestamp = data['timestamp'];
    email = data['email'];
    profileName = data['profileName'];
    serverAuthCode = data['serverAuthCode'];
    url = data['url'];
  }
}


