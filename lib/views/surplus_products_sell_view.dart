import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustainify_hub/models/sell_item.dart';
import 'package:sustainify_hub/providers/products_provider.dart';

class SurplusProductsSellView extends StatefulWidget {
  const SurplusProductsSellView({super.key});

  @override
  State<SurplusProductsSellView> createState() =>
      _SurplusProductsSellViewState();
}

class _SurplusProductsSellViewState extends State<SurplusProductsSellView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sell your items"),
      ),
      body: ListView(
        children: [
          _SellForm(),
          _SellingList(),
        ],
      ),
      floatingActionButton: Consumer<ProductsProvider>(
        builder: (context, productsProvider, child) {
          return productsProvider.myproducts.isNotEmpty
              ? FloatingActionButton.extended(
                  onPressed: () {
                    productsProvider.sellProduct();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Successfully added items"),
                      ),
                    );
                  },
                  label: Text('Sell'),
                  icon: Icon(Icons.sell_rounded),
                )
              : Container();
        },
      ),
    );
  }
}

class _SellForm extends StatefulWidget {
  const _SellForm({super.key});

  @override
  State<_SellForm> createState() => _SellFormState();
}

class _SellFormState extends State<_SellForm> {
  String amountOption = 'kg';
  bool isFoodMaterial = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _expiryController = TextEditingController();

  void clearForm() {
    _nameController.clear();
    _amountController.clear();
    _expiryController.clear();
    _quantityController.clear();
    isFoodMaterial = false;
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return ListView(
      padding: EdgeInsets.all(18),
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            label: Text("Name"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Quantity"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: DropdownButton<String>(
                value: amountOption,
                items: [
                  DropdownMenuItem(
                    child: Text("Kg"),
                    value: 'kg',
                  ),
                  DropdownMenuItem(
                    child: Text("Lit"),
                    value: 'lit',
                  )
                ],
                onChanged: (val) {
                  setState(() {
                    amountOption = val!;
                  });
                },
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _expiryController,
                enabled: isFoodMaterial,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Expiry If needed(in hours)"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Checkbox(
              value: isFoodMaterial,
              onChanged: (val) {
                setState(() {
                  isFoodMaterial = val!;
                });
              },
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            label: Text("Amount"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: () {
                final item = SurplusProduct(
                    // id: productsProvider.products.length,
                    name: _nameController.text,
                    quantity: int.parse(_quantityController.text),
                    amountUnit: amountOption,
                    expiryDetails:
                        isFoodMaterial ? _expiryController.text : null,
                    isFood: isFoodMaterial,
                    amount: int.parse(_amountController.text));
                productsProvider.addMyProducts(item);
                clearForm();
              },
              child: Text("Add"),
            ),
          ),
        ),
      ],
    );
  }
}

class _SellingList extends StatelessWidget {
  const _SellingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, provider, child) {
        final products = context.read<ProductsProvider>().myproducts;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                child: Text(
                  "My List",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                alignment: Alignment.centerLeft,
              ),
              ListView.builder(
                // padding: EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, i) => Card(
                  child: ListTile(
                    title: Text("${products[i].name}"),
                    subtitle: Text(
                        "${products[i].quantity} ${products[i].amountUnit}"),
                    trailing: products[i].expiryDetails != null
                        ? Text("Expires in ${products[i].expiryDetails}hr")
                        : null,
                  ),
                ),
                itemCount: products.length,
              )
            ],
          ),
        );
      },
    );
  }
}
