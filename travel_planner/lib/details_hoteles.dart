import 'package:flutter/material.dart';

import 'reservation.dart';

class DetailHotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Hotel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  'assets/hoteles/hotel1.jpg',
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
                      Row(
                        children: [
                          Text(
                            'Nombre del Hotel',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8.0),
                          Icon(Icons.star, color: Colors.yellow, size: 16.0),
                          Icon(Icons.star, color: Colors.yellow, size: 16.0),
                          Icon(Icons.star, color: Colors.yellow, size: 16.0),
                          Icon(Icons.star, color: Colors.yellow, size: 16.0),
                          Icon(Icons.star_border, size: 16.0),
                        ],
                      ),
                      Text(
                        'Precio por noche',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hotel Paradise'),
                      Text(
                        '\$199',
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
                  Text(
                    'Ubicación',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 20),
                      SizedBox(width: 4.0),
                      Text('Centro de la ciudad'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Divider(), // Línea divisoria
                  SizedBox(height: 16.0),
                  Text(
                    'Servicios',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.room_service, size: 20),
                      SizedBox(width: 4.0),
                      Text('Wi-Fi gratuito'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.pool, size: 20),
                      SizedBox(width: 4.0),
                      Text('Piscina'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.local_parking, size: 20),
                      SizedBox(width: 4.0),
                      Text('Estacionamiento'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.air, size: 20),
                      SizedBox(width: 4.0),
                      Text('Aire acondicionado'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.coffee_maker, size: 20),
                      SizedBox(width: 4.0),
                      Text('Cafetera'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Divider(), // Línea divisoria
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReservacionView()),
                      );
                    },
                    child: Text('Reservar Hotel'),
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
