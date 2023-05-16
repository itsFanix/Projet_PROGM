import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'musicModel.dart';


class MusicApi {

  static Future<List<Music>> getMusictracks() async {

  final httpsUri = Uri.https('spotify81.p.rapidapi.com', '/top_200_tracks', { });

  final response = await http.get(httpsUri, headers: {"X-Rapidapi-Key": "2c64779b45msh9678488572c5e4fp131716jsn600dda2890e9", 
  "X-Rapidapi-Host": "spotify81.p.rapidapi.com ", 
  "Host": "spotify81.p.rapidapi.com" });

  print(response.statusCode);

  if(response.statusCode==200){

    var data = jsonDecode(response.body);



    print(data);
     return List.empty();
      // return List<Music>.from(data.map((data) => Music.fromJson(data)));


  }
  else {
     throw Exception('Failed to load Music');
  }
}


// static Future<List<Music>> getMusictracks() async {

//   final httpsUri = Uri.https('spotify23.p.rapidapi.com', '/playlist_tracks/', {'id' : '37i9dQZF1DX4Wsb4d7NKfP','offset':'0', 'limit': '100'});

//   final response = await http.get(httpsUri, headers: {"X-Rapidapi-Key": "2c64779b45msh9678488572c5e4fp131716jsn600dda2890e9", 
//   "X-Rapidapi-Host": "spotify23.p.rapidapi.com", 
//   "Host": "spotify23.p.rapidapi.com" });

//   print(response.statusCode);

//   if(response.statusCode==200){

//     var data = jsonDecode(response.body);

// var items = data['items'];
    

//     print(items);
//     // return List.empty();
//      return List<Music>.from(items.map((data) => Music.fromJson(data)));


//   }
//   else {
//      throw Exception('Failed to load Music');
//   }
// }
 }