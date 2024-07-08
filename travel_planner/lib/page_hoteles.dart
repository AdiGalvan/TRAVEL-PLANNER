import 'package:flutter/material.dart';

import 'details_hoteles.dart';

class PageHotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoteles'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Conoce los mejores hoteles para tu siguiente viaje',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  _buildHotelCard(
                    context,
                    'assets/hoteles/hotel1.jpg',
                    'Hotel Paris',
                    '4 estrellas',
                    '\$199',
                    'Cancelación gratis.',
                  ),
                  SizedBox(height: 15.0),
                  _buildHotelCard(
                    context,
                    'assets/hoteles/hotel2.jpg',
                    'Hotel New York',
                    '5 estrellas',
                    '\$299',
                    'Desayuno incluido.',
                  ),
                  SizedBox(height: 15.0),
                  _buildHotelCard(
                    context,
                    'assets/hoteles/hotel3.jpg',
                    'Hotel Tokyo',
                    '3 estrellas',
                    '\$399',
                    'Cerca del centro.',
                  ),
                  SizedBox(height: 15.0),
                  _buildHotelCard(
                    context,
                    'assets/hoteles/hotel4.jpg',
                    'Hotel London',
                    '4 estrellas',
                    '\$499',
                    'Vistas al río.',
                  ),
                  SizedBox(height: 15.0),
                  _buildHotelCard(
                    context,
                    'assets/hoteles/hotel2.jpg',
                    'Hotel Rome',
                    '5 estrellas',
                    '\$599',
                    'Desayuno incluido.',
                  ),
                  SizedBox(height: 15.0),
                  _buildHotelCard(
                    context,
                    'assets/hoteles/hotel1.jpg',
                    'Hotel Sydney',
                    '4 estrellas',
                    '\$699',
                    '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHotelCard(BuildContext context, String imagePath,
      String hotelName, String rating, String price, String additionalText) {
    return Card(
      elevation: 5,
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 150, // Altura fija para la imagen
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotelName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 16),
                          SizedBox(width: 4),
                          Text(rating),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(additionalText),
                      Divider(),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text('Más información sobre el hotel.'),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailHotel()),
                          );
                        },
                        child: Text('Ver especificaciones'),
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
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                // Acción al tocar el ícono de favoritos
              },
            ),
          ),
        ],
      ),
    );
  }
}
