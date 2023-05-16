import 'package:flutter/foundation.dart';


class Music {

  late final String name;
  late final String trackUri;


  Music({
    required this.name,
    required this.trackUri,
  });

  factory Music.fromJson(Map<String, dynamic> json){
    return Music(
      name: json['trackMetada']['trackName'],
      trackUri :json['trackMetada']['trackUri'],
    );
  }


  // static List<Country> countriesFromSnapshot(List snapshot) {
  //    return snapshot.map((data) => Country.fromJson(data)).toList();
  // }
}