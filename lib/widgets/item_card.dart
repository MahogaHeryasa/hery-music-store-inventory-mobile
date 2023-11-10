import 'package:flutter/material.dart';
import 'package:hery_music_store_inventory/models/item_model.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 146, 0, 0),
      child: InkWell(
        child: SizedBox(
          height: 100, // Set the height of the SizedBox
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  'Description: ${item.description}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Amount: ${item.amount}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Price: ${item.price}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      // child: Container(
      //   padding: const EdgeInsets.all(8),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         item.name,
      //         style: const TextStyle(color: Colors.white, fontSize: 25),
      //       ),
      //       Text(
      //         'Description: ${item.description}',
      //         style: const TextStyle(color: Colors.white),
      //       ),
      //       Text(
      //         'Amount: ${item.amount}',
      //         style: const TextStyle(color: Colors.white),
      //       ),
      //       Text(
      //         'Price: ${item.price}',
      //         style: const TextStyle(color: Colors.white),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
