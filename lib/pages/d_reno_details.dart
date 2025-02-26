import 'package:cnas_dashboard/components/d_reno_bottom_nav_bar.dart';
import 'package:cnas_dashboard/controllers/d_carte_controller.dart';
import 'package:cnas_dashboard/models/aasure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemandRenoDetailsPage extends StatelessWidget {
  final DemandesController demandesController = Get.find<DemandesController>();

  DemandRenoDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarReno(),
      appBar: AppBar(
        title: const Text('Demande Details'),
        centerTitle: true,
      ),
      body: GetBuilder(
          init: demandesController,
          builder: (_) {
            Assure assure = demandesController.selectedDemandeReno!.assure;
            return Center(
              child: Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Assure Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Numéro Assure: ${assure.numAssure}'),
                        Text('Nom: ${assure.nom}'),
                        Text('Prénom: ${assure.prenom}'),
                        Text(
                            'Date de Naissance: ${assure.dateNaissance.toString()}'),
                        Text(
                            'Date Fin Droit: ${assure.dateFinDroit.toString()}'),
                        Text('Taux: ${assure.taux}'),
                        const SizedBox(height: 16),
                        const Text(
                          'Demande Reno Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.30,
                                height:
                                    MediaQuery.of(context).size.width * 0.30,
                                child: Image.memory(demandesController
                                    .selectedDemandeReno!.attestationImg)),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.30,
                                height:
                                    MediaQuery.of(context).size.width * 0.30,
                                child: Image.memory(demandesController
                                    .selectedDemandeReno!.idImg)),
                          ],
                        )
                        // Display photo and idImg here using Image.memory(...)
                        // Example: Image.memory(demandeCard.photo),
                        // Example: Image.memory(demandeCard.idImg),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
