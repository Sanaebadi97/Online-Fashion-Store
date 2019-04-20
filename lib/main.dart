import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*my own imports*/
import 'package:flutter_wp/componets/horizontal_listview.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.pinkAccent, // navigation bar color
    statusBarColor: Colors.pinkAccent, // status bar color
  ));

  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
//carousel_pro
    Widget image_carousel = new Container(
      height: 200,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/pic1.jpg'),
          AssetImage('images/pic2.jpeg'),
          AssetImage('images/pic4.jpeg'),
          AssetImage('images/pic5.jpeg'),
          AssetImage('images/pic6.jpeg'),
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
        title: Text('SanaShop'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
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
              accountEmail: Text('sebadi@gmail.com'),
              accountName: Text('Sana Ebadi'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://sanaebadi.info/Resume/sana_profile.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              decoration: BoxDecoration(color: Colors.pinkAccent),
            ),

            //body of Drawer Layout
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(
                  Icons.person,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(
                  Icons.dashboard,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
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
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //image carousel begins here
          image_carousel,

          //Padding widget
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Categories'),
          ),
          //Horizontal list view begins here
          HorizontalList(),
          //padding widget
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Recent products'),
          ),
        ],
      ),
    );
  }
}
