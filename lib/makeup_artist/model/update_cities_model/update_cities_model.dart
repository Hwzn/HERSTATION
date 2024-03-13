import 'dart:convert';

class UpdateCitiesModel {
  List<Map<String, dynamic>> cities;

  UpdateCitiesModel({
    required this.cities,
  });

  Map<String, dynamic> toJson() => {"cities": json.encode(cities)};
}