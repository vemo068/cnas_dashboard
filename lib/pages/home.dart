import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Les Demandes'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyButton(
              text: "Demandes des Cartes",
              onPressed: () {},
            ),
            MyButton(
              text: "Demandes de renouvellement",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  const MyButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Colors.blue.shade900,
      onPressed: () {
        onPressed();
      },
      child: Row(
        children: [
          Text(text),
          const SizedBox(width: 5),
          const Icon(CupertinoIcons.forward),
        ],
      ),
    );
  }
}
