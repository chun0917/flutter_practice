import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_0117/data_model.dart';

final String url = "https://data.epa.gov.tw/api/v1/aqx_p_432?format=json&offset=0&limit=100&api_key=52991566-35e5-4ec3-a8d1-b05dcc802d3d";

List<Station> parseUser(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var users = list.map((e) => Station.fromJson(e)).toList();
  return users;
}

Future<List<Station>> fetchUsers() async{
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return compute(parseUser,response.body);
  } else {
    throw Exception(response.statusCode);
  }
}