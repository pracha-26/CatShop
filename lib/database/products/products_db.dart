// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Products {
    String pName;
    int pPrice;
    String pDescription;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;

    Products({
        required this.pName,
        required this.pPrice,
        required this.pDescription,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        pName: json["p_name"],
        pPrice: json["p_price"],
        pDescription: json["p_description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "p_name": pName,
        "p_price": pPrice,
        "p_description": pDescription,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
    };
}
