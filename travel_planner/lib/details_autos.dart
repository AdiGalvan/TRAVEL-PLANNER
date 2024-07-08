import 'package:flutter/material.dart';

import 'reservation.dart';

class DetailAuto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Auto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  'assets/autos/auto1.jpg',
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
                        'Modelo',
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
                      Text('Sedán'),
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
                        'Kilometraje',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Capacidad',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.speed, size: 20),
                          SizedBox(width: 4.0),
                          Text('30,000 km'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.person, size: 20),
                          SizedBox(width: 4.0),
                          Text('4 personas'),
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
                        'Puertas',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Aire Acondicionado',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.directions_car, size: 20),
                          SizedBox(width: 4.0),
                          Text('4 puertas'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.ac_unit, size: 20),
                          SizedBox(width: 4.0),
                          Text('Sí'),
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
                    child: Text('Reservar Auto'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 116, 144, 214),
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
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
