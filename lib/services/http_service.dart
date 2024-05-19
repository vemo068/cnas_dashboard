import 'dart:convert';
import 'package:cnas_dashboard/models/d_reno_responce.dart';
import 'package:cnas_dashboard/models/demand_card.dart';
import 'package:cnas_dashboard/models/demand_reno.dart';
import 'package:http/http.dart' as http;
import 'package:cnas_dashboard/models/d_carte_responce.dart';
import 'package:cnas_dashboard/services/links.dart';

class HttpService {
  Future<List<DCarteResponce>> getAllDemandesDeCarte() async {
    final response = await http.get(Uri.parse(getCardDemandesResponcesUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      List<dynamic> jsonList = json.decode(response.body);
      List<DCarteResponce> demandes = [];
      for (var json in jsonList) {
        demandes.add(DCarteResponce.fromJson(json));
      }
      return demandes;
    } else {
      // If the server returns an error response, throw an exception
      throw Exception('Failed to load demandes de carte');
    }
  }

  Future<DemandeCard> fetchDemandeCarteById(int id) async {
    final response = await http.get(Uri.parse('$getDemandeCardUrl$id'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return DemandeCard.fromJson(jsonDecode(response.body));
    } else {
      // If the server returns an error response, throw an exception
      throw Exception('Failed to load demandeCarte');
    }
  }

  Future<DemandeDeRenouvellement> fetchDemandeRenoById(int id) async {
    final response = await http.get(Uri.parse('$getDemandeRenoUrl$id'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return DemandeDeRenouvellement.fromJson(jsonDecode(response.body));
    } else {
      // If the server returns an error response, throw an exception
      throw Exception('Failed to load demande reno');
    }
  }

  Future<List<DRenoResponce>> getAllDemandesDeReno() async {
    final response = await http.get(Uri.parse(getRenoDemandesResponcesUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      List<dynamic> jsonList = json.decode(response.body);
      List<DRenoResponce> demandes = [];
      for (var json in jsonList) {
        demandes.add(DRenoResponce.fromJson(json));
      }
      return demandes;
    } else {
      // If the server returns an error response, throw an exception
      throw Exception('Failed to load demandes de reno');
    }
  }

  Future<String> activateCardByIds(int demandeId) async {
    final response = await http
        .get(Uri.parse('${baseUrl}ActivateCard${demandeId}'));

    if (response.statusCode == 200) {
      return 'ok';
    } else {
      throw Exception('Failed to activate card');
    }
  }



Future<String> refuseDemandeCard(int demandeId, String reason) async {
    final response = await http.post(
      Uri.parse(refuseDemandeCardUrl),
      body: {
        'demandeid': demandeId.toString(),
        'reason': reason,
      },
    );

    if (response.statusCode == 200) {
      return 'ok';
    } else {
      throw Exception('Failed to refuse demande card');
    }
  }


Future<String> refuseDemandeReno(int demandeId, String reason) async {
    final response = await http.post(
      Uri.parse(refuseDemandeRenoUrl),
      body: {
        'demandeid': demandeId.toString(),
        'reason': reason,
      },
    );

    if (response.statusCode == 200) {
      return 'ok';
    } else {
      throw Exception('Failed to refuse demande reno');
    }
  }



Future<String> updateDateFinDroit(String dateFinDroit, int demandeId) async {
    final response = await http.post(
      Uri.parse(updateDateFinDroitUrl),
      body: {
        'dateFinDroit': dateFinDroit,
        'demandeid': demandeId.toString(),
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to update date fin droit');
    }
  }



}
