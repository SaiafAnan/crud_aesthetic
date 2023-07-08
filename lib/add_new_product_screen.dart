import 'package:crud_aesthetic/widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  var formKey = GlobalKey<FormState>();
  var mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('CRUD'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.all(
                            Radius.circular(60),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Colors.black26,
                              offset: Offset(0, -3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                          child: Column(
                            children: [
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    custom_textfield(
                                      mobileController: mobileController,
                                      icon: FontAwesomeIcons.productHunt,
                                      text: 'Product name',
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    custom_textfield(
                                      mobileController: mobileController,
                                      icon: FontAwesomeIcons.code,
                                      text: 'Product code',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    custom_textfield(
                                      mobileController: mobileController,
                                      icon: FontAwesomeIcons.dollarSign,
                                      text: 'Price',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    custom_textfield(
                                      mobileController: mobileController,
                                      icon: FontAwesomeIcons.sackXmark,
                                      text: 'Quantity',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    custom_textfield(
                                      mobileController: mobileController,
                                      icon: FontAwesomeIcons.sackDollar,
                                      text: 'Total Price',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    custom_textfield(
                                      mobileController: mobileController,
                                      icon: FontAwesomeIcons.image,
                                      text: 'Image',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(5),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(2),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 60,
                          ),
                          child: Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
