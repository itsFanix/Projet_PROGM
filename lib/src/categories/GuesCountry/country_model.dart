import 'package:flutter/foundation.dart';


class Country {

  late final String name;
  late final String flag;


  Country({
    required this.name,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json){
    return Country(
      name: json['name']["common"],
      flag :json['flag'],
    );
  }


  // static List<Country> countriesFromSnapshot(List snapshot) {
  //    return snapshot.map((data) => Country.fromJson(data)).toList();
  // }
}