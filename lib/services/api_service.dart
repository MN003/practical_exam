import 'dart:convert';

import 'package:http/http.dart';

import '../model/data.dart';
import '../model/detail.dart';


class ApiService{
  final endpoint = "http://firstoffer.co.in/api/mobile/list";
  Future<List<Data>> getArticle() async {
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body= json["data"];
      List<Data> data = body.map((dynamic item) => Data.fromJson(item)).toList();
      return data;
    }
    else{
      throw ("Data has error");
    }
  }
}

class ApiService2{
  final endpoint = "http://firstoffer.co.in/api/mobile/list";
  Future<List<Details>> getArticle() async {
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body= json["data"];
      List<Details> details = body.map((dynamic item) => Details.fromJson(item)).toList();
      return details;
    }
    else{
      throw ("Data has error");
    }
  }
}