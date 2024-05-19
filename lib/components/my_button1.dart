


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            const SizedBox(width: 5),
            const Icon(CupertinoIcons.forward),
          ],
        ),
      ),
    );
  }
}
