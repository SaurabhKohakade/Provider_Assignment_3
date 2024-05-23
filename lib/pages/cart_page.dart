import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managament_tutorial_yt/providers/cart_provider.dart';

import '../consts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        "Cart",
      ),
    );
  }

  Widget _buildUI() {
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.80,
              child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  Product product = provider.items[index];
                  return ListTile(
                    title: Text(
                      product.name,
                    ),
                    subtitle: Text(product.price.toString()),
                    leading: Image.network(product.image),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                      ),
                      child: Text('Remove',style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        provider.remove(product);
                      },),
                    
                  );
                },
              ),
            ),
            Text("Total Price : \ ${provider.getCartTotal()}")
          ],
        );
      },
    );
  }
}
