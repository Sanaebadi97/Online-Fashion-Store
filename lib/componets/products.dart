import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 78,
      "price": 67
    },
    {
      "name": "Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 45,
      "price": 89
    },
    {
      "name": "Dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 23,
      "price": 78
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "old_price": 34,
      "price": 67
    },
    {
      "name": "Dress",
      "picture": "images/products/hills2.jpeg",
      "old_price": 98,
      "price": 34
    },
    {
      "name": "Dress",
      "picture": "images/products/hills2.jpeg",
      "old_price": 98,
      "price": 45
    },
    {
      "name": "Pants",
      "picture": "images/products/pants1.jpg",
      "old_price": 67,
      "price": 45
    },
    {
      "name": "Pants",
      "picture": "images/products/pants2.jpeg",
      "old_price": 34,
      "price": 23
    },
    {
      "name": "Shoe",
      "picture": "images/products/shoe1.jpg",
      "old_price": 400,
      "price": 389
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 67,
      "price": 56
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt2.jpeg",
      "old_price": 55,
      "price": 34
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products_list.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleProd(
          prod_name: products_list[index]['name'],
          prod_pics: products_list[index]['picture'],
          prod_old_price: products_list[index]['old_price'],
          prod_price: products_list[index]['price'],
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
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      prod_name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "\$$prod_price",
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text("\$$prod_old_price",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                        decoration: TextDecoration.lineThrough)),
                  ),
                ),
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
