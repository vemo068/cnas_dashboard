import 'package:cnas_dashboard/models/d_carte_responce.dart';
import 'package:cnas_dashboard/models/demand_card.dart';
import 'package:cnas_dashboard/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemandesController extends GetxController {
  TextEditingController reason_controller = TextEditingController();

  List<DCarteResponce> d_carte_responces = [];
  DemandeCard? selectedDemandeCard;

  Future<void> getAllDCarteResponces() async {
    d_carte_responces = await HttpService().getAllDemandesDeCarte();
    update();
  }

  Future<void> getDemandeCard(int id) async {
    selectedDemandeCard = await HttpService().fetchDemandeCarteById(id);
    update();
  }

  void updateDemandeCarte() {}
  void activateCard() {}
}
