import 'package:cnas_dashboard/controllers/d_carte_controller.dart';
import 'package:cnas_dashboard/pages/d_carte_details.dart';
import 'package:cnas_dashboard/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemandeCartesPage extends StatelessWidget {
  final DemandesController demandesController = Get.find<DemandesController>();
  DemandeCartesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des demandes des cartes"),
      ),
      body: GetBuilder(
          init: demandesController,
          builder: (_) {
            return Center(
              child: ListView.builder(
                itemCount: demandesController.d_carte_responces.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(
                      onPressed: () async {
                        await demandesController.getDemandeCard(
                            demandesController.d_carte_responces[index].id);
                        Get.to(() => DemandCardDetailsPage());
                      },
                      text:
                          demandesController.d_carte_responces[index].numAssure,
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
