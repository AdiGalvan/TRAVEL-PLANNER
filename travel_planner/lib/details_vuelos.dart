import 'package:flutter/material.dart';

import 'reservation.dart';

class DetailVuelo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Vuelo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  'assets/vuelos/vuelo3.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      // Acción al tocar el ícono de favoritos
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Duración del Vuelo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.timer, size: 20),
                          SizedBox(width: 4.0),
                          Text('2h 30m'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Horario de Salida'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.flight_takeoff, size: 20),
                          SizedBox(width: 4.0),
                          Text('10:00 AM'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Horario de Llegada'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.flight_land, size: 20),
                          SizedBox(width: 4.0),
                          Text('12:30 PM'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Divider(), // Línea divisoria
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Aerolínea',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Precio',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('American Airlines'),
                      Text(
                        '\$499',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Divider(), // Línea divisoria
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tipo de Vuelo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Incluye',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Económico'),
                      Row(
                        children: [
                          Icon(Icons.luggage, size: 20),
                          SizedBox(width: 4.0),
                          Text('Equipaje de mano'),
                          SizedBox(width: 16.0),
                          Icon(Icons.local_dining, size: 20),
                          SizedBox(width: 4.0),
                          Text('Comida incluida'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReservacionView()),
                      );
                    },
                    child: Text('Reservar Vuelo'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 116, 144, 214),
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 10,
                      shadowColor: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
