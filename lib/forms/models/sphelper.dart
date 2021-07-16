import 'package:shared_preferences/shared_preferences.dart';

class SpHelper{
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;
  initSharedPreferences()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
saveData(String name,String password){
    sharedPreferences.setString('name', name);
    sharedPreferences.setString('password', password);
}
}
