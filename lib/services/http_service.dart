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
      jsonList.forEach((json) {
        demandes.add(DCarteResponce.fromJson(json));
      });
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
      jsonList.forEach((json) {
        demandes.add(DRenoResponce.fromJson(json));
      });
      return demandes;
    } else {
      // If the server returns an error response, throw an exception
      throw Exception('Failed to load demandes de reno');
    }
  }
}
