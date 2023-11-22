// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Character> productFromJson(String str) => List<Character>.from(json.decode(str).map((x) => Character.fromJson(x)));

String productToJson(List<Character> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Character {
    String model;
    int pk;
    Fields fields;

    Character({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Character.fromJson(Map<String, dynamic> json) => Character(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int amount;
    String rarity;
    int power;
    String description;
    DateTime dateAdded;

    Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.rarity,
        required this.power,
        required this.description,
        required this.dateAdded,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        rarity: json["rarity"],
        power: json["power"],
        description: json["description"],
        dateAdded: DateTime.parse(json["date_added"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "rarity": rarity,
        "power": power,
        "description": description,
        "date_added": dateAdded.toIso8601String(),
    };
}
