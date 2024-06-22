import 'dart:convert';
import 'package:flutter/material.dart';

// Definición del modelo de usuario
class UserModel {
  String uid;
  String nombre;
  String apellido;
  String email;
  String edad;

  // Constructor del modelo de usuario
  UserModel({
    required this.uid,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.edad,
  });

  // Método factory para crear una instancia de UserModel desde JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        edad: json["edad"],
      );

  // Método para convertir UserModel a JSON
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "edad": edad,
      };
}

// Función para convertir JSON a UserModel
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// Función para convertir UserModel a JSON
String userModelToJson(UserModel data) => json.encode(data.toJson());

// Pantalla de registro de usuario
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Clave global para manejar el estado del formulario
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _apellidoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _edadController = TextEditingController();

  // Estado para manejar la carga del botón de registro
  bool _isDoingRequest = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Color del AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0), // Espaciado interior
            child: Form(
              key: _formKey, // Asignación de la clave global al formulario
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    'assets/logotra.png',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 30),
                  // Campo de texto para el nombre
                  TextFormField(
                    controller: _nombreController,
                    decoration: InputDecoration(
                      hintText: 'Nombre', // Etiqueta del campo de nombre
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name'; // Mensaje si el campo está vacío
                      }
                      return null; // Retorna null si la validación es exitosa
                    },
                  ),
                  SizedBox(height: 20.0), // Espacio entre campos
                  // Campo de texto para el apellido
                  TextFormField(
                    controller: _apellidoController,
                    decoration: InputDecoration(
                      hintText: 'Apellido', // Etiqueta del campo de apellido
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name'; // Mensaje si el campo está vacío
                      }
                      return null; // Retorna null si la validación es exitosa
                    },
                  ),
                  SizedBox(height: 20.0), // Espacio entre campos
                  // Campo de texto para el email
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email', // Etiqueta del campo de email
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email'; // Mensaje si el campo está vacío
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email address'; // Mensaje si el email no es válido
                      }
                      return null; // Retorna null si la validación es exitosa
                    },
                  ),
                  SizedBox(height: 20.0), // Espacio entre campos
                  // Campo de texto para la edad
                  TextFormField(
                    controller: _edadController,
                    decoration: InputDecoration(
                      hintText: 'Edad', // Etiqueta del campo de edad
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age'; // Mensaje si el campo está vacío
                      }
                      return null; // Retorna null si la validación es exitosa
                    },
                  ),
                  SizedBox(height: 30.0), // Espacio entre campos
                  // Botón de registro
                  ElevatedButton(
                    onPressed: _isDoingRequest ? null : _register,
                    child: _isDoingRequest
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text('Register'), // Texto del botón de registro
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Función para manejar el registro
  void _register() {
    if (_formKey.currentState!.validate()) {
      // Valida el formulario usando la clave global del formulario
      setState(() {
        _isDoingRequest =
            true; // Cambia el estado para mostrar el indicador de carga
      });

      // Crear un objeto UserModel con los datos del formulario
      UserModel newUser = UserModel(
        uid: 'unique_id_generated_here', // Generar un ID único aquí
        nombre: _nombreController.text,
        apellido: _apellidoController.text,
        email: _emailController.text,
        edad: _edadController.text,
      );

      // Convertir UserModel a JSON
      String jsonUser = userModelToJson(newUser);

      // Simular un proceso de registro (puede ser una llamada a API real)
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isDoingRequest =
              false; // Cambia el estado para ocultar el indicador de carga
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Registration Successful')), // Muestra un mensaje de registro exitoso
        );
        // Aquí puedes enviar `jsonUser` a una API o hacer cualquier otra operación necesaria
        // por ejemplo, guardar en la base de datos local o remota.
      });
    }
  }
}
