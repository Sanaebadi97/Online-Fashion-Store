import 'package:Sana_Shop/componets/products.dart';
import 'package:Sana_Shop/pages/home.dart';
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
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text('SanaShop', style: TextStyle(fontFamily: 'Raleway'))),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            color: Colors.white,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  widget.prod_details_pic,
                  fit: BoxFit.scaleDown,
                ),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.prod_details_name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                          fontSize: 20)),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text("\$${widget.prod_details_new_price}",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Raleway'))),
                      Expanded(
                          child: Text("\$${widget.prod_details_old_price}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w800,
                                  decoration: TextDecoration.lineThrough))),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /*********************The first button **************/
          Row(
            children: <Widget>[
              /*The  size button*/

              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('size',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Raleway')),
                            content: Text('Choose the size',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Raleway')),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text('Close',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.redAccent,
                                        fontFamily: 'Raleway')),
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  elevation: 0.2,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Size'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),

              /*The  size button*/

              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text('Color',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Raleway')),
                              content: Text('Choose the color',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Raleway')),
                              actions: <Widget>[
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: Text('Close',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color: Colors.redAccent,
                                            fontFamily: 'Raleway')))
                              ]);
                        });
                  },
                  color: Colors.white,
                  elevation: 0.2,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Color'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text('Quantity',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Raleway')),
                              content: Text('Choose the quantity',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Raleway')),
                              actions: <Widget>[
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: Text('Close',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color: Colors.redAccent,
                                            fontFamily: 'Raleway')))
                              ]);
                        });
                  },
                  color: Colors.white,
                  elevation: 0.2,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Qty'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          /*==============The Second Button================*/

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.pink,
                    elevation: 0.2,
                    textColor: Colors.white,
                    child: Text('Buy Now'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart, color: Colors.pinkAccent),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.pinkAccent,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.transparent,
          ),
          ListTile(
            title: Text('Product details',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Raleway')),
            subtitle: Text(
                'Lorem Ipsum is simply dummy text of the printin and typesetting industry.. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknownprinter took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ',
                style: TextStyle(color: Colors.black87, fontFamily: 'Raleway')),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  12,
                  5,
                  5,
                  5,
                ),
                child: Text(
                  'Product name',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                      fontFamily: 'Raleway'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(widget.prod_details_name),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  12,
                  5,
                  5,
                  5,
                ),
                child: Text(
                  'Product brand',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                      fontFamily: 'Raleway'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text('Brand X'),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  12,
                  5,
                  5,
                  5,
                ),
                child: Text(
                  'Product condition',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                      fontFamily: 'Raleway'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text('NEW'),
              )
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Similar Products',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Raleway')),
          ),

          /*============== SIMILAR PRODUCT ==========*/
          Container(
            height: 360,
            child: SimilarProduct(),
          )
        ],
      ),
    );
  }
}

class SimilarProduct extends StatefulWidget {
  @override
  _SimilarProductState createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
  var products_list = [
    {
      "name": "Blazer",
      "picture": "assets/images/similar_products/1.jpeg",
      "old_price": 120,
      "price": 85
    },
    {
      "name": "Dress",
      "picture": "assets/images/similar_products/4.jpeg",
      "old_price": 45,
      "price": 89
    },
    {
      "name": "Hills",
      "picture": "assets/images/similar_products/5.jpeg",
      "old_price": 34,
      "price": 67
    },
    {
      "name": "Skirt",
      "picture": "assets/images/similar_products/8.jpeg",
      "old_price": 67,
      "price": 56
    },
    {
      "name": "Skirt1",
      "picture": "assets/images/similar_products/9.jpeg",
      "old_price": 67,
      "price": 56
    },
    {
      "name": "Skirt12",
      "picture": "assets/images/similar_products/11.jpeg",
      "old_price": 67,
      "price": 56
    },
    {
      "name": "Skirt13",
      "picture": "assets/images/similar_products/12.jpeg",
      "old_price": 67,
      "price": 56
    },
    {
      "name": "Skirt14",
      "picture": "assets/images/similar_products/13.jpeg",
      "old_price": 67,
      "price": 56
    },
    {
      "name": "Skirt14",
      "picture": "assets/images/similar_products/15.jpeg",
      "old_price": 67,
      "price": 56
    },
    {
      "name": "Skirt14",
      "picture": "assets/images/similar_products/16.jpeg",
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

class SimilarSingleProd extends StatelessWidget {
  final prod_name;
  final prod_pics;
  final prod_old_price;
  final prod_price;

  const SimilarSingleProd(
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
