import 'package:flutter/material.dart';
import 'package:hery_music_store_inventory/screens/item_form.dart';
import 'package:hery_music_store_inventory/screens/item_page.dart';

class ButtonItem {
  final String name;
  final IconData icon;
  final Color color;

  ButtonItem(this.name, this.icon, this.color);
}

class ButtonCard extends StatelessWidget {
  final ButtonItem item;
  final Color cardColor;

  const ButtonCard(this.item, {required this.cardColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: cardColor,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemFormPage(),
                ));
          }

          //BONUS
          if (item.name == "Lihat Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ItemPage()));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
