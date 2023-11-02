import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventory List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 146, 0, 0),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Hery Music Store Inventory',
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

class ButtonItem {
  final String name;
  final IconData icon;
  final Color color;

  ButtonItem(this.name, this.icon, this.color);
}

final List<ButtonItem> items = [
  ButtonItem("Lihat Item", Icons.format_list_bulleted,
      const Color.fromARGB(255, 146, 0, 0)),
  ButtonItem("Tambah Item", Icons.add_shopping_cart,
      const Color.fromARGB(255, 90, 0, 0)),
  ButtonItem("Logout", Icons.logout, const Color.fromARGB(255, 26, 14, 0)),
];

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
