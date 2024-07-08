import 'package:flutter/material.dart';

import 'details_vuelos.dart';

class PageVuelo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vuelos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Conoce los mejores vuelos para tu siguiente viaje',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  _buildFlightCard(
                    context,
                    'assets/vuelos/vuelo3.jpg',
                    'Vuelo a París',
                    'Viva Aeroméxico',
                    '\$499',
                    '',
                  ),
                  SizedBox(height: 15.0),
                  _buildFlightCard(
                    context,
                    'assets/vuelos/vuelo1.jpg',
                    'Vuelo a Nueva York',
                    'Volaris',
                    '\$399',
                    '',
                  ),
                  SizedBox(height: 15.0),
                  _buildFlightCard(
                    context,
                    'assets/vuelos/vuelo4.jpg',
                    'Vuelo a Tokio',
                    'Aeroméxico',
                    '\$599',
                    '',
                  ),
                  SizedBox(height: 15.0),
                  _buildFlightCard(
                    context,
                    'assets/vuelos/vuelo2.jpg',
                    'Vuelo a Canadá',
                    'Avianca',
                    '\$699',
                    '',
                  ),
                  SizedBox(height: 15.0),
                  _buildFlightCard(
                    context,
                    'assets/vuelos/vuelo4.jpg',
                    'Vuelo a México',
                    'Aeroméxico',
                    '\$799',
                    '',
                  ),
                  SizedBox(height: 15.0),
                  _buildFlightCard(
                    context,
                    'assets/vuelos/vuelo1.jpg',
                    'Vuelo a Brasil',
                    'Volaris',
                    '\$899',
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

  Widget _buildFlightCard(BuildContext context, String imagePath, String flightName, String airline, String price, String additionalText) {
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
                        flightName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Aerolínea: $airline',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8),
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
                      Text(additionalText),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailVuelo()),
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
