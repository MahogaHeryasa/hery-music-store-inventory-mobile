// BONUS
import 'package:flutter/material.dart';
import 'package:hery_music_store_inventory/models/item_model.dart';
import 'package:hery_music_store_inventory/widgets/item_card.dart';
import 'package:hery_music_store_inventory/widgets/left_drawer.dart';

class ItemPageBonus extends StatelessWidget {
  const ItemPageBonus({super.key});

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
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 1,
                shrinkWrap: true,
                children: ItemBonus.items.map((ItemBonus item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
