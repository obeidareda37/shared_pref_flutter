import 'dart:convert';

import 'package:shared_pref/forms/globals.dart';
import 'package:shared_pref/forms/models/form_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;

  initSharedPreferences()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  saveUser(FormUser formUser){
    sharedPreferences.setString('formUser', json.encode(
        {...formUser.toMap()}.toString()));
    Globals.globals.formUser=formUser;

  }
  getUser(){
    String user = sharedPreferences.getString('formUser');
    if (user == null){
      return null;
    }
    Map userMap = json.decode(user);
    FormUser formUser = FormUser.map(userMap);
  }

  signOut(){
    sharedPreferences.remove('formUser');
  }
}