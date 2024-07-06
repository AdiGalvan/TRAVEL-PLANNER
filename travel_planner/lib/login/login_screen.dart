import 'package:flutter/material.dart';
import '../Registro/Registro.dart';
import '../Home/Home.dart'; // Asegúrate de tener una pantalla de inicio creada en el archivo Home.dart

class LoginScreen extends StatelessWidget {
  // A key for the form to identify and validate it.
  final _formKey = GlobalKey<FormState>();

  // Function to navigate to the registration screen when the register button is pressed.
  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationScreen()),
    );
  }

  // Function to navigate to the home screen.
  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              HomeScreen()), // Asegúrate de que HomeScreen sea el nombre correcto de la pantalla de inicio
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The main container of the screen with a gradient background.
      body: Container(
        decoration: BoxDecoration(
          // Define a vertical gradient background from white to blue.
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            // Form widget to manage the form state and validation.
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo at the top of the form.
                  Image.asset(
                    'assets/logo.png',
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 30),
                  // TextFormField for entering the name.
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    // Validator to check if the name field is not empty.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  // TextFormField for entering the password.
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    // Validator to check if the password field is not empty.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  // ElevatedButton to handle login action.
                  /** ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        _navigateToHome(
                            context); // Navegar a la pantalla de inicio si la validación es exitosa
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),*/
                  //Navegar a la pantalla de inicio sin realizar la validación
                  ElevatedButton(
                    onPressed: () {
                      _navigateToHome(context);
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),
                  // TextButton to navigate to the registration screen.
                  TextButton(
                    onPressed: () => _navigateToRegister(context),
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '¿No tienes cuenta?, ',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'regístrate aquí.',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Color.fromARGB(255, 230, 230, 230),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  // ElevatedButton for Google login.
                  ElevatedButton(
                    onPressed: () {
                      // Handle Google login logic here.
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Google logo.
                        Image.asset(
                          'assets/googlel.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 10),
                        Text('Google'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  // Text displaying terms of service and privacy policy notice.
                  Text(
                    'By clicking continue, you agree to our Terms of Service\nand Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
