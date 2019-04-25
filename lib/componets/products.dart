import 'package:Sana_Shop/pages/product_details.dart';
import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/*****************RECENT PRODUCT CLASS*********************************8*/

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products_list = [
    {
      "name": "Blazer",
      "picture": "assets/images/recent_products/17.jpeg",
      "old_price": 120,
      "price": 85
    },
    {
      "name": "Dress",
      "picture": "assets/images/recent_products/18.jpeg",
      "old_price": 45,
      "price": 89
    },
    {
      "name": "Hills",
      "picture": "assets/images/recent_products/19.jpeg",
      "old_price": 34,
      "price": 67
    },
    {
      "name": "Pants",
      "picture": "assets/images/recent_products/20.jpeg",
      "old_price": 67,
      "price": 45
    },
    {
      "name": "Shoe",
      "picture": "assets/images/recent_products/21.jpeg",
      "old_price": 400,
      "price": 389
    },
    {
      "name": "Skirt",
      "picture": "assets/images/recent_products/22.jpeg",
      "old_price": 67,
      "price": 56
    },
    {
      "name": "Skirt1",
      "picture": "assets/images/recent_products/23.jpeg",
      "old_price": 67,
      "price": 56
    },
    {
      "name": "Skirt12",
      "picture": "assets/images/recent_products/24.jpeg",
      "old_price": 67,
      "price": 56
    },
    {
      "name": "Skirt13",
      "picture": "assets/images/recent_products/25.jpeg",
      "old_price": 67,
      "price": 56
    },
    {
      "name": "Skirt14",
      "picture": "assets/images/recent_products/26.jpeg",
      "old_price": 67,
      "price": 56
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products_list.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: SingleProd(
            prod_name: products_list[index]['name'],
            prod_pics: products_list[index]['picture'],
            prod_old_price: products_list[index]['old_price'],
            prod_price: products_list[index]['price'],
          ),
        );
      },
    );
  }
}

class SingleProd extends StatelessWidget {
  final prod_name;
  final prod_pics;
  final prod_old_price;
  final prod_price;

  const SingleProd(
      {this.prod_name, this.prod_pics, this.prod_old_price, this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Hero(
          tag: Text('Hero 1'),
          child: Material(
            child: InkWell(
              /*Passing the value from Product to product details*/

              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                      prod_name, prod_price, prod_old_price, prod_pics))),
              child: GridTile(
                footer: Container(
                    color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(prod_name,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16)),
                          ),
                          Text(
                            "\$${prod_price}",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w800,
                                fontSize: 16),
                          )
                        ],
                      ),
                    )),
                child: Image.asset(
                  prod_pics,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
