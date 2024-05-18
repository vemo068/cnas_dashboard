import 'package:cnas_dashboard/models/d_carte_responce.dart';
import 'package:cnas_dashboard/pages/home.dart';
import 'package:flutter/material.dart';

class DemandeCartesPage extends StatelessWidget {
  const DemandeCartesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des demandes des cartes"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: responseDCartesList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(
                onPressed: () {
                  // Define your onPressed functionality here
                  print(
                      'Button pressed: ${responseDCartesList[index].numAssure}');
                },
                text: responseDCartesList[index].numAssure,
              ),
            );
          },
        ),
      ),
    );
  }
}
