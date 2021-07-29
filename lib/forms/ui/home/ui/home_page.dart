import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_pref/forms/globals.dart';
import 'package:shared_pref/forms/helpers/db_helper.dart';
import 'package:shared_pref/forms/helpers/file_helper.dart';
import 'package:shared_pref/forms/helpers/shared_pref.dart';
import 'package:shared_pref/forms/models/category.dart';
import 'package:shared_pref/forms/models/product.dart';
import 'package:shared_pref/forms/ui/register/main_register_screen.dart';

class HomePage extends StatelessWidget {
  String name;
  HomePage(this.name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(this.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(Globals.globals.formUser.userType == UserType.customer
              ? 'hi i am customer, my email is ${Globals.globals.formUser.email} and my password is ${Globals.globals.formUser.password}'
              : 'hi i am mershant, my shop name is ${Globals.globals.formUser.shopName}, and its place in ${Globals.globals.formUser.shopAddress}, ${Globals.globals.formUser.bio}'),
          ElevatedButton(
            child: Text('SignOut'),
            onPressed: () async{
              GetIt.I.get<DbHelper>().insetCategory(Category(name: 'Medicines'));
              GetIt.I.get<DbHelper>().insetProduct(Product(name: 'TV', catId: 1));
              List<Product>products=await  GetIt.I.get<DbHelper>().getAllProduct();
              print(products.length);
              // DbHelper.dbHelper.getAllTasks();
              // SpHelper.spHelper.signOut();
              // FileHelper.fileHelper.writeInFile('gsg');
              // FileHelper.fileHelper.readFromFile('gsg');
            },
          ),
        ],
      ),
    );
  }
}
