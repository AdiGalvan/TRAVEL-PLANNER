import 'package:flutter/material.dart';
import 'home_vuelos.dart';
import 'home_hoteles.dart';
import 'home_autos.dart';

class TemplateBotones extends StatelessWidget {
  final String currentView;

  TemplateBotones({required this.currentView});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildButton(
          context,
          icon: Icons.flight,
          label: 'Vuelos',
          isSelected: currentView == 'vuelos',
          onPressed: () {
            if (currentView != 'vuelos') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeVuelo()),
              );
            }
          },
        ),
        SizedBox(width: 20), // Espacio entre botones
        buildButton(
          context,
          icon: Icons.hotel,
          label: 'Hoteles',
          isSelected: currentView == 'hoteles',
          onPressed: () {
            if (currentView != 'hoteles') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeHotel()),
              );
            }
          },
        ),
        SizedBox(width: 20), // Espacio entre botones
        buildButton(
          context,
          icon: Icons.directions_car,
          label: 'Autos',
          isSelected: currentView == 'autos',
          onPressed: () {
            if (currentView != 'autos') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeAuto()),
              );
            }
          },
        ),
      ],
    );
  }

  Widget buildButton(BuildContext context, {
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onPressed
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? Colors.blue: Colors.black),
          SizedBox(width: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.blue: Colors.black,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color.fromARGB(255, 198, 202, 205) : Color.fromARGB(255, 236, 236, 236),
        foregroundColor: isSelected ? Color.fromARGB(255, 46, 46, 50) : Colors.black,
        minimumSize: Size(110, 70), // Tamaño fijo
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 10, // Añade sombra
        shadowColor: Colors.grey, // Color de la sombra
      ),
    );
  }
}
