import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class Stations{
  String siteName = '';
  String county = '';
  String status = '';
  String importDate = '';
  String windSpeed = ''; 
  int aqi = -1;

  Stations({required this.siteName,required this.county,required this.status,required this.importDate,required this.windSpeed,});

  Stations.fromJson(Map<String, dynamic> json) {
    siteName = json['SiteName'];
    county = json['County'];
    status = json['Status'];
    importDate = json['ImportDate'];
    windSpeed = json['WIND_SPEED'];
    aqi = int.tryParse(json['AQI']) ?? -1;
  }
}
Future<List<Stations>> fetchAQI() async {
  List<Stations> stationsDetail = [];
  final response = await http.get(Uri.parse(
     'https://data.epa.gov.tw/api/v1/aqx_p_432?format=json&offset=0&limit=100&api_key=52991566-35e5-4ec3-a8d1-b05dcc802d3d'
     ));

  debugPrint('response gotten');
  if (response.statusCode == 200) {
    debugPrint('result gotten');
    var res = jsonDecode(response.body);
    List<dynamic> stationsInJson = res['records'];
    for (var station in stationsInJson) {
      debugPrint(station['SiteName']);
      stationsDetail.add(Stations.fromJson(station));
    }
    debugPrint('${stationsDetail.length} stations gotten');
  } else {
    debugPrint('status code:${response.statusCode}');
  }
  return stationsDetail;
}
