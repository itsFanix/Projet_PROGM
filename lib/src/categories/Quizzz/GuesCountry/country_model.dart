import 'package:flutter/foundation.dart';


class Country {

  late final String name;
  late final String flag;
  late final List capital;


  Country({
    required this.name,
    required this.flag,
    required this.capital
  });

  factory Country.fromJson(Map<String, dynamic> json){
    return Country(
      name: json['name']["common"],
      flag :json['flag'],
      capital:  json['capital']
    );
  }


  // static List<Country> countriesFromSnapshot(List snapshot) {
  //    return snapshot.map((data) => Country.fromJson(data)).toList();
  // }
}