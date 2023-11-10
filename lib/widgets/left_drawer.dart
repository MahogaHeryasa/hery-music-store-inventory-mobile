import 'package:flutter/material.dart';
import 'package:hery_music_store_inventory/screens/item_page.dart';
import 'package:hery_music_store_inventory/screens/menu.dart';
import 'package:hery_music_store_inventory/screens/item_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 146, 0, 0),
            ),
            child: Column(
              children: [
                Text(
                  'Hery Music Store Inventory',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  "Manage your music store inventory here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemFormPage(),
                  ));
            },
          ),
          //BONUS
          ListTile(
            leading: const Icon(Icons.format_list_bulleted),
            title: const Text('Lihat Item'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
