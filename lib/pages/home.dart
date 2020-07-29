import 'package:Sana_Shop/componets/horizontal_listview.dart';
import 'package:Sana_Shop/componets/products.dart';
import 'package:Sana_Shop/pages/shopping_cart.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
//carousel_pro
    // ignore: non_constant_identifier_names
    Widget image_carousel = new Container(
      height: 200,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/slider/2.jpeg'),
          AssetImage('assets/images/slider/3.jpeg'),
          AssetImage('assets/images/slider/6.jpeg'),
          AssetImage('assets/images/slider/7.jpeg'),
          AssetImage('assets/images/slider/10.jpeg'),
          AssetImage('assets/images/slider/14.jpeg'),
        ],
        autoplay: true,
        dotSize: 6,
        indicatorBgPadding: 10,
        dotColor: Colors.white,
        dotBgColor: Colors.transparent,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(microseconds: 1000),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.pinkAccent,
          title: Text('SanaShop', style: TextStyle(fontFamily: 'Raleway')),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShoppingCart()));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              //header View For Drawer layout
              UserAccountsDrawerHeader(
                accountEmail: Text('sebadi@gmail.com',
                    style: TextStyle(fontFamily: 'Raleway')),
                accountName:
                    Text('Sana Ebadi', style: TextStyle(fontFamily: 'Raleway')),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        AssetImage('assets/images/sana_profile.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                decoration: BoxDecoration(color: Colors.pinkAccent),
              ),

              //body of Drawer Layout
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Home Page',
                      style: TextStyle(fontFamily: 'Raleway')),
                  leading: Icon(
                    Icons.home,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My Account',
                      style: TextStyle(fontFamily: 'Raleway')),
                  leading: Icon(
                    Icons.person,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My Orders',
                      style: TextStyle(fontFamily: 'Raleway')),
                  leading: Icon(
                    Icons.shopping_basket,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShoppingCart()));
                },
                child: ListTile(
                  title: Text('Shopping Cart',
                      style: TextStyle(fontFamily: 'Raleway')),
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Favourites',
                      style: TextStyle(fontFamily: 'Raleway')),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  ),
                ),
              ),

              Divider(),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title:
                      Text('Settings', style: TextStyle(fontFamily: 'Raleway')),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('About', style: TextStyle(fontFamily: 'Raleway')),
                  leading: Icon(
                    Icons.help,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              image_carousel,

              //Padding widget
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Categories',
                      style: TextStyle(fontFamily: 'Raleway')),
                ),
              ),

              /************ Horizontal list view begins here ************/
              HorizontalList(),

              /**********padding widget *************/
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text('Recent products',
                      style: TextStyle(fontFamily: 'Raleway')),
                ),
              ),
              Expanded(child: Products())
            ],
          ),
        ));
  }
}
