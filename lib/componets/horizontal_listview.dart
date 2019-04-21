import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/*****************HORIZONTAL LIST FOR CATEGORY*********************************8*/

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/images/categories/tshirt.png',
            image_caption: 'shirt',
          ),
          Category(
            image_location: 'assets/images/categories/dress.png',
            image_caption: 'dress',
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
          Category(
            image_location: 'assets/images/categories/accessories.png',
            image_caption: 'accessories',
          ),
          Category(
            image_location: 'assets/images/categories/shoe.png',
            image_caption: 'shoe',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  const Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
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
              width: 80,
              height: 75,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  image_caption,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'Raleway'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
