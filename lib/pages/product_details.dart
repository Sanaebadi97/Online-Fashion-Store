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
                          child: Text("\$${widget.prod_details_old_price}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w800,
                                  decoration: TextDecoration.lineThrough))),
                      Expanded(
                          child: Text("\$${widget.prod_details_new_price}",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Raleway'))),
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
                  onPressed: () {},
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
                  onPressed: () {},
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
                  onPressed: () {},
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
        ],
      ),
    );
  }
}
