import 'package:flutter/material.dart';
import 'package:hery_music_store_inventory/models/item.dart';
import 'package:hery_music_store_inventory/screens/list_item.dart';
import 'package:hery_music_store_inventory/widgets/left_drawer.dart';

class ItemDetails extends StatelessWidget {
  final Item item;
  const ItemDetails(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Item Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 146, 0, 0),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  item.fields.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text("Description: ${item.fields.description}"),
                const SizedBox(height: 10),
                Text("Amount: ${item.fields.amount.toString()}"),
                const SizedBox(height: 10),
                Text("Price: ${item.fields.price.toString()}"),
                const SizedBox(height: 10),
                Text("Date Added: ${item.fields.dateAdded.toString()}"),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 146, 0, 0)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ItemPage()));
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
