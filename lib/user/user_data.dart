import 'dart:convert';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    image:
        "https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg",
    name: 'Your Name',
    birthdate: 'MM/DD/YYYY',
    bloodtype: 'A,B,O or AB - Positive or Negative ',
    weightandheight: ' 80 kg -- 180 cm ',
    cityandcountry: 'India-Delhi ',
    email: 'test.test@gmail.com',
    phone: '+919245594852',
    aboutMeDescription:
        'Tell About Yourself'
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
