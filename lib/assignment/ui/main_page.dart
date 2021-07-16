import 'package:flutter/material.dart';
import 'package:shared_pref/assignment/data/data_source.dart';
import 'package:shared_pref/assignment/models/product.dart';
import 'package:shared_pref/assignment/ui/pages/favourite_page.dart';
import 'package:shared_pref/assignment/ui/pages/home_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  toggleProduct(Product product) {
    setState(() {
      int index = products.indexOf(product);
      products[index].isFavourite = !products[index].isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Ecommerce App'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(
                    Icons.favorite,
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [HomePage(toggleProduct), FavouritePage(toggleProduct)],
          ),
        ));
  }
}
