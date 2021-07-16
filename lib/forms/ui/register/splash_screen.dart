import 'package:flutter/material.dart';
import 'package:shared_pref/forms/helpers/shared_pref.dart';
import 'package:shared_pref/forms/ui/home/ui/home_page.dart';
import 'package:shared_pref/forms/ui/register/main_register_screen.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      if(SpHelper.spHelper.getUser()!=null){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
          return HomePage("");
        }));
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
          return FormUi();
        }));
      }
    });

  }

}