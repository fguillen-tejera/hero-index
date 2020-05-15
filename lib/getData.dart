import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';

import 'package:http/http.dart' as http;

class GetData {
  String id = '';
  http.Response response;
  final String baseUrl = 'https://superheroapi.com/api/2653479064687249/';

  Future getDataRandom(String num) async {
    id = num;
    try {
      response = await http.get(baseUrl + id);
      if (jsonDecode(response.body)['response'] != 'error') {
        return jsonDecode(response.body);
      }
    } on SocketException catch (_) {
      return 'no internet';
    }
    return 'no internet';
  }

  Future getDataByName(String name) async {
    id = 'search/$name';
    try {
      http.Response response = await http.get(baseUrl + id);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } on SocketException catch (_) {
      return 'no internet';
    }
    return 'no internet';
  }

  Future getDataByID(String name) async {
    id = name;
    try {
      http.Response response = await http.get(baseUrl + id);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } on SocketException catch (_) {
      return 'no internet';
    }
    //return 'unable to connecto to the internet';
  }
}
