import 'package:flutter/material.dart';
import 'package:hery_music_store_inventory/widgets/button_card.dart';
import 'package:hery_music_store_inventory/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ButtonItem> items = [
    ButtonItem("Lihat Item", Icons.format_list_bulleted,
        const Color.fromARGB(255, 146, 0, 0)),
    ButtonItem("Tambah Item", Icons.add_shopping_cart,
        const Color.fromARGB(255, 90, 0, 0)),
    ButtonItem("Logout", Icons.logout, const Color.fromARGB(255, 26, 14, 0)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hery Music Store Inventory',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 146, 0, 0),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Home Page',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ButtonItem item) {
                  return ButtonCard(item, cardColor: item.color);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
