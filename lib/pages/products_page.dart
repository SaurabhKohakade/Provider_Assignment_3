import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managament_tutorial_yt/providers/cart_provider.dart';

import '../consts.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Products",
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/cart");
          },
          icon: const Icon(
            Icons.shopping_cart,
          ),
          
        ),
        Container(width: 40,)
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return ListView.builder(
      itemCount: PRODUCTS.length,
      itemBuilder: (context, index) {
        Product product = PRODUCTS[index];
        return ListTile(
          leading: Container(
            height: 75,
            width: 75,
           child: Image.network(product.image),
          ),
          title: Text(
            product.name,
          ),
          subtitle: Text(product.price.toString()),
          trailing:
          Column(children: [

            Text('Add to cart'),
           Checkbox( 
            value: cartProvider.items.contains(product),
            onChanged: (value) {
              if (value == true) {
                cartProvider.add(product);
              } else {
                cartProvider.remove(product);
              }
            },
          ),
          ],)
        );
      },
    );
  }
}
