import 'dart:convert';

import 'package:crud_aesthetic/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart';

import 'add_new_product_screen.dart';

// TODO - add a refresh button on actions button in appbar

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    print('call the api');
    getProducts();
  }

  void getProducts() async {
    // https://crud.teamrabbil.com/api/v1/ReadProduct
    // call - GET
    // URI - Universal Resource Identifier
    inProgress = true;
    setState(() {});
    Response response =
        await get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));
    print(response.body);
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
      for (var e in decodedResponse['data']) {
        products.add(Product.toJson(e));
      }
    }
    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: const Text(
              'CRUD',
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.deepPurple,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddNewProductScreen()));
            },
            label: const Icon(FontAwesomeIcons.cartShopping)),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF701ebd),
                    Color(0xFF873bcc),
                    Color(0xFFfe4a97),
                    Color(0xFFe17763),
                    Color(0xFF68998c),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: inProgress
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    titlePadding:
                                        const EdgeInsets.only(left: 16),
                                    contentPadding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    title: Row(
                                      children: [
                                        const Text('Choose an action'),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.close),
                                        )
                                      ],
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          onTap: () {},
                                          leading: const Icon(Icons.edit),
                                          title: const Text('Edit'),
                                        ),
                                        const Divider(
                                          height: 0,
                                        ),
                                        ListTile(
                                          onTap: () {},
                                          leading: const Icon(
                                              Icons.delete_forever_outlined),
                                          title: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          title: Text(products[index].productName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Product code: ${products[index].productCode}'),
                              Text(
                                  'Total price: ${products[index].totalPrice}'),
                              Text(
                                  'Available units: ${products[index].quantity}'),
                            ],
                          ),
                          leading:
                              Image.network(products[index].image, width: 50,
                                  errorBuilder: (context, obj, stackTrace) {
                            return const Icon(
                              Icons.image,
                              size: 32,
                            );
                          }),
                          trailing: Text('${products[index].unitPrice}/p'),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
            ),
          ],
        ));
  }
}
