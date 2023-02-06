import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/models/NewsDataResponce.dart';
import 'package:news/models/SourceResponce.dart';

class ApiManager {
  static const String BASEURL = 'newsapi.org';
  static Future<SourceResponce> getResource() async {
    var uri = Uri.https('newsapi.org', '/v2/top-headlines/sources',
        {"apiKey": "908f43d8d663478c9c880f5b71314f62"});
    var responce;
    try {
      responce = await http.get(uri);
    } catch (error) {
      print('${error}');
    }

    var json = jsonDecode(responce.body);
    SourceResponce sourceResponce = SourceResponce.fromJson(json);
    return sourceResponce;
  }

  static Future<NewsDataResponce> getNewsData(String sourceId) async {
    var uri = Uri.https(BASEURL, "/v2/everything",
        {"apiKey": "908f43d8d663478c9c880f5b71314f62", "sources": sourceId});
    http.Response? responce;

    try {
      responce = await http.get(uri);
    } catch (error) {
      print("${error}");
    }

    var json = jsonDecode(responce!.body);
    NewsDataResponce sourceResponce = NewsDataResponce.fromJson(json);
    return sourceResponce;
  }
}
