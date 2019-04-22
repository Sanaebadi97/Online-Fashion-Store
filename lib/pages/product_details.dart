import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final prod_details_name;
  final prod_details_new_price;
  final prod_details_old_price;
  final prod_details_pic;

  const ProductDetails(this.prod_details_name, this.prod_details_new_price,
      this.prod_details_old_price, this.prod_details_pic);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            color: Colors.black54,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.prod_details_pic),
              ),
            ),
          )
        ],
      ),
    );
  }
}
