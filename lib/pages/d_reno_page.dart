import 'package:cnas_dashboard/components/my_button1.dart';
import 'package:cnas_dashboard/controllers/d_carte_controller.dart';
import 'package:cnas_dashboard/pages/d_carte_details.dart';
import 'package:cnas_dashboard/pages/d_reno_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemandeRenosPage extends StatelessWidget {
  final DemandesController demandesController = Get.find<DemandesController>();
  DemandeRenosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des demandes des renouvellement"),
      ),
      body: GetBuilder(
          init: demandesController,
          builder: (_) {
            return Center(
              child: ListView.builder(
                itemCount: demandesController.d_reno_responces.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(
                      onPressed: () async {
                        await demandesController.getDemandeReno(
                            demandesController.d_reno_responces[index].id);
                        Get.to(() => DemandRenoDetailsPage());
                      },
                      text:
                          demandesController.d_reno_responces[index].numAssure,
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
