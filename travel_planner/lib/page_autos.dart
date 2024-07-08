import 'package:flutter/material.dart';

import 'details_autos.dart';

class PageAuto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Conoce los mejores autos para tu siguiente viaje',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  _buildAutoCard(
                    context,
                    'assets/autos/auto1.jpg',
                    'Sedán',
                    4,
                    '\$499',
                    'Cancelación gratis.',
                  ),
                  SizedBox(height: 15.0),
                  _buildAutoCard(
                    context,
                    'assets/autos/auto2.jpg',
                    'SUV',
                    7,
                    '\$399',
                    'Cancelación gratis.',
                  ),
                  SizedBox(height: 15.0),
                  _buildAutoCard(
                    context,
                    'assets/autos/auto4.jpg',
                    'Deportivo',
                    2,
                    '\$599',
                    'Cancelación gratis.',
                  ),
                  SizedBox(height: 15.0),
                  _buildAutoCard(
                    context,
                    'assets/autos/auto3.jpg',
                    'Camioneta',
                    5,
                    '\$699',
                    'Cancelación gratis.',
                  ),
                  SizedBox(height: 15.0),
                  _buildAutoCard(
                    context,
                    'assets/autos/auto1.jpg',
                    'Convertible',
                    2,
                    '\$799',
                    'Cancelación gratis.',
                  ),
                  SizedBox(height: 15.0),
                  _buildAutoCard(
                    context,
                    'assets/autos/auto4.jpg',
                    'Camioneta',
                    5,
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

  Widget _buildAutoCard(BuildContext context, String imagePath, String carName, int capacity, String price, String additionalText) {
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
                        carName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.person, size: 16),
                          SizedBox(width: 4),
                          Text('$capacity personas'),
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
                      Text('Más información sobre el auto.'),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailAuto()),
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
