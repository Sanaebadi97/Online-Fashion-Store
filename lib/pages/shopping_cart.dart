import 'package:Sana_Shop/componets/cart_products.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.pinkAccent,
        title: Text('Shopping Cart', style: TextStyle(fontFamily: 'Raleway')),
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

      /*================== Card Products ============*/
      body: CartProducts(),

      /*================== Card Products ============*/

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Total:',
                          style: TextStyle(fontFamily: 'Raleway')),
                      subtitle: Text('\$230',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontFamily: 'Raleway',
                              fontSize: 18)),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Check out',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Raleway'),
                    ),
                    color: Colors.pink,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
