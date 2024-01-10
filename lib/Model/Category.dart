
import 'dart:convert';

List<Category> CategoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String CategoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category{

  Category({
    this.id,
    this.name,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  String? id;
  String? name;
  bool? active;
  int? createdAt;
  int? updatedAt;
  String? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    active: json["active"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "active": active,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "image": image,
  };

}