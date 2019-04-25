import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var products_on_the_cart = [
    {
      "name": "Blazer",
      "picture": "assets/images/similar_products/16.jpeg",
      "price": 85,
      "size": "M",
      "color": "Black",
      "quantity": 3,
    },
    {
      "name": "Dress",
      "picture": "assets/images/similar_products/12.jpeg",
      "price": 85,
      "size": "L",
      "color": "Red",
      "quantity": 2,
    },
    {
      "name": "Skirt",
      "picture": "assets/images/similar_products/11.jpeg",
      "price": 85,
      "size": "XL",
      "color": "Pink",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return SingleCartProduct(
          products_on_the_cart[index]['name'],
          products_on_the_cart[index]['picture'],
          products_on_the_cart[index]['price'],
          products_on_the_cart[index]['color'],
          products_on_the_cart[index]['size'],
          products_on_the_cart[index]['quantity'],
        );
      },
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_pics;
  final cart_prod_price;
  final cart_prod_color;
  final cart_prod_size;
  final cart_prod_quantity;

  const SingleCartProduct(
      this.cart_prod_name,
      this.cart_prod_pics,
      this.cart_prod_price,
      this.cart_prod_color,
      this.cart_prod_size,
      this.cart_prod_quantity);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cart_prod_pics),
        title: Text(cart_prod_name),
        subtitle: Column(
          children: <Widget>[
            /*ROW INSIDE THE COLUMN*/

            /*==============THE SECTION IS FOR THE PRODUCT PRICE=======*/
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text('\$$cart_prod_price',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
            ),

            /*============The section is for size the product=========*/
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text('Size :',
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.normal,
                          fontSize: 14)),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cart_prod_size,
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                          fontSize: 12)),
                ),

                /*============The section is for color the product=========*/
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Text('Color :',
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.normal,
                          fontSize: 14)),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cart_prod_color,
                      style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_drop_up,size: 7,),
              onPressed: () {},
            ),
            Text('$cart_prod_quantity'),
            IconButton(
              icon: Icon(Icons.arrow_drop_down,size: 10,),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
