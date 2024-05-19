import 'package:cnas_dashboard/components/my_button2.dart';
import 'package:cnas_dashboard/controllers/d_carte_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarReno extends StatelessWidget {
  BottomNavBarReno({
    super.key,
  });

  final DemandesController demandesController = Get.find<DemandesController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GetBuilder(
            init: demandesController,
            builder: (_) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: MyButton2(
                      onTap: () {
                        Get.defaultDialog(
                          content: Column(
                            children: [
                              TextField(
                                controller: demandesController.date_controller,
                                enabled: false,
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    await demandesController
                                        .updateDateFinDroit(context);
                                  },
                                  child: const Text("Update date fin droit"))
                            ],
                          ),
                          textConfirm: "Confirmer",
                          onConfirm: () async {},
                        );
                      },
                      text: "Accepter",
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: MyButton2(
                      onTap: () {
                        Get.defaultDialog(
                            onCancel: () {
                              demandesController.reason_controller.clear();
                            },
                            onConfirm: () async {
                              await demandesController.refuseDemandeCard();
                            },
                            content: TextField(
                              controller: demandesController.reason_controller,
                              decoration: const InputDecoration(
                                  hintText: "Raison de refuse"),
                            ));
                      },
                      text: "Rejeter",
                      color: Colors.red,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
