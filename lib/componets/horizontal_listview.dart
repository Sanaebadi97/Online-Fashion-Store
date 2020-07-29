import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/*****************HORIZONTAL LIST FOR CATEGORY*********************************8*/

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/images/categories/shoe.png',
            image_caption: 'shoe',
          ),
          Category(
            image_location: 'assets/images/categories/pendant.png',
            image_caption: 'accessories',
          ),
          Category(
            image_location: 'assets/images/categories/dress.png',
            image_caption: 'dress',
          ),
          Category(
            image_location: 'assets/images/categories/shirt.png',
            image_caption: 'shirt',
          ),
          Category(
            image_location: 'assets/images/categories/jeans.png',
            image_caption: 'pants',
          ),
          Category(
            image_location: 'assets/images/categories/formal.png',
            image_caption: 'formal',
          ),
          Category(
            image_location: 'assets/images/categories/informal.png',
            image_caption: 'informal',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String image_location;
  // ignore: non_constant_identifier_names
  final String image_caption;

  // ignore: non_constant_identifier_names
  const Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(
              image_location,
              color: Colors.redAccent,
              width: 80,
              height: 75,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  image_caption,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
