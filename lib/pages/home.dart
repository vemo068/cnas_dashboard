import 'package:cnas_dashboard/controllers/d_carte_controller.dart';
import 'package:cnas_dashboard/pages/d_cartess_page.dart';
import 'package:cnas_dashboard/pages/d_reno_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final DemandesController demandesController = Get.find<DemandesController>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Les Demandes'),
        centerTitle: true,
      ),
      body: Center(
        child: GetBuilder(
            init: demandesController,
            builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    text: "Demandes des Cartes",
                    onPressed: () async {
                      await demandesController.getAllDCarteResponces();
                      Get.to(() => DemandeCartesPage());
                    },
                  ),
                  MyButton(
                    text: "Demandes de renouvellement",
                    onPressed: () async {
                      await demandesController.getAllRenoResponces();
                      Get.to(() => DemandeRenosPage());
                    },
                  ),
                ],
              );
            }),
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
