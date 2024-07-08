import 'dart:convert';

class UserModel {
  String uid;
  String nombre;
  String apellido;
  String email;
  String? password; // Puede ser opcional

  UserModel({
    required this.uid,
    required this.nombre,
    required this.apellido,
    required this.email,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        password: json["password"], // Puede ser null si es opcional
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "password": password, // Puede ser null si es opcional
      };
}

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
