import 'package:cnas_dashboard/models/d_carte_responce.dart';
import 'package:cnas_dashboard/models/d_reno_responce.dart';
import 'package:cnas_dashboard/models/demand_card.dart';
import 'package:cnas_dashboard/models/demand_reno.dart';
import 'package:cnas_dashboard/pages/d_cartess_page.dart';
import 'package:cnas_dashboard/pages/d_reno_page.dart';
import 'package:cnas_dashboard/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DemandesController extends GetxController {
  TextEditingController reason_controller = TextEditingController();
  DateTime? selectedDateFinDroit;
  TextEditingController date_controller = TextEditingController();
  String? selectedReason;
  List<DCarteResponce> d_carte_responces = [];
  List<DRenoResponce> d_reno_responces = [];

  DemandeDeRenouvellement? selectedDemandeReno;
  DemandeCard? selectedDemandeCard;

  Future<void> getAllDCarteResponces() async {
    d_carte_responces = await HttpService().getAllDemandesDeCarte();
    update();
  }

  Future<void> getDemandeCard(int id) async {
    selectedDemandeCard = await HttpService().fetchDemandeCarteById(id);
    update();
  }

  Future<void> getAllRenoResponces() async {
    d_reno_responces = await HttpService().getAllDemandesDeReno();
    update();
  }

  Future<void> getDemandeReno(int id) async {
    selectedDemandeReno = await HttpService().fetchDemandeRenoById(id);
    update();
  }

  Future<void> activateCard() async {
    await HttpService().activateCardByIds(selectedDemandeCard!.id!);
    await getAllDCarteResponces();
    Get.off(() => DemandeCartesPage());
    Get.snackbar(
      "Succé",
      "la Carte est activé",
    );
    update();
  }

  Future<void> refuseDemandeCard() async {
    await HttpService()
        .refuseDemandeCard(selectedDemandeCard!.id!, reason_controller.text);
    await getAllDCarteResponces();
    Get.back();
    reason_controller.clear();
    update();
  }

  Future<void> refuseDemandeReno() async {
    await HttpService()
        .refuseDemandeReno(selectedDemandeCard!.id!, reason_controller.text);
    await getAllRenoResponces();
    Get.back();
    reason_controller.clear();
    update();
  }

  Future<void> chooseDateFinDroit(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDemandeReno!.assure.dateFinDroit,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );

    if (picked != null && picked != selectedDateFinDroit) {
      selectedDateFinDroit = picked;
      date_controller.text = selectedDateFinDroit.toString();
      update();
    }
  }

  Future<void> updateDateFinDroit() async {
    String res = await HttpService().updateDateFinDroit(
        selectedDateFinDroit!.toIso8601String(), selectedDemandeReno!.id!);
    if (res == "200") {
      Get.snackbar(
        "Succé",
        "la nouvelle date fin droit est enregistré",
      );
      getAllRenoResponces();
      Get.off(() => DemandeRenosPage());
      selectedDateFinDroit = null;
      update();
    }
  }
}
