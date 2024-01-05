import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustainify_hub/providers/products_provider.dart';

class SurplusProductsBuyView extends StatelessWidget {
  const SurplusProductsBuyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProductsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Search Commodities",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                provider.searchProducts(value);
              },
            ),
            SizedBox(
              height: 18,
            ),
            Consumer<ProductsProvider>(
              builder: (context, provider, child) {
                final products = provider.products;
                return ListView.builder(
                  padding: EdgeInsets.all(6),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, i) => Card(
                    child: ListTile(
                      title: Text(
                        "${products[i].name}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${products[i].quantity} ${products[i].amountUnit}",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Expires in ${products[i].expiryDetails ?? ""} hours",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₹${products[i].amount}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Add functionality for Buy button
                                },
                                child: Text("Buy"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        // Add functionality for ListTile tap if needed
                      },
                    ),
                  ),
                  itemCount: products.length,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
