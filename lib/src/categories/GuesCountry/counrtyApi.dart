import 'dart:convert';
import 'package:flutter/material.dart';

import 'country_model.dart';
import 'package:http/http.dart' as http;
class CountryApi {





   static Future<List<Country>> getCountries() async  {
   // 'X-Rapidapi-Key': '2c64779b45msh9678488572c5e4fp131716jsn600dda2890e9'

  final httpsUri = Uri.https('country-facts.p.rapidapi.com' , '/all',{}); 

  final response = await  http
    .get(httpsUri, headers:  {"X-Rapidapi-Key": "2c64779b45msh9678488572c5e4fp131716jsn600dda2890e9",
"X-Rapidapi-Host": "country-facts.p.rapidapi.com",
"Host": "country-facts.p.rapidapi.com"});


    if (response.statusCode ==200) {
   

      // Map data = jsonDecode(response.body);
      // List _tmp=[];

      // for(var e in data['feed']){
      //   _tmp.add(e['content']['details']);
      // } 
      // return Country.countriesFromSnapshot(_tmp);
    return List<Country>.from(jsonDecode(response.body).map((data) => Country.fromJson(data)));

   // return List<Country>.from(jsonDecode(response.body));
    // for (var element in results) {debugPrint(element.name);}
    //return results;
    }
  else {
    throw Exception('Failed to load Country');
  }


}
}