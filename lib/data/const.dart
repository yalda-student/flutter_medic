import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

int selectedIndex = mainIndex;

const int noIndex = -1;
const int mainIndex = 0;
const int soundIndex = 1;
const int profileIndex = 2;

final advancedDrawerController = AdvancedDrawerController();

const String isFirstRun = 'first_time';
const String savedName = 'name';
const String savedEmail = 'email';
const String savedPassword = 'password';

//user info
 String name = '';
 String email = '';
 String password = '';

fetchUserData() async {
 final pref = await SharedPreferences.getInstance();
 name = pref.getString(savedName) ?? 'Yalda&';
 email = pref.getString(savedEmail) ?? 'yalda@google.com';
 password = pref.getString(savedPassword) ?? 'Yalda**';
}
