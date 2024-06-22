import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Planner'),
        leading: Icon(Icons.menu),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel
              CarouselSlider(
                items: [
                  Image.asset('assets/avion.jpg'),
                  Image.asset('assets/avion.jpg'),
                  Image.asset('assets/avion.jpg'),
                ],
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    print('Page changed to index $index');
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Tu siguiente viaje',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.flight_takeoff),
                        SizedBox(width: 8),
                        Text('Vuelos'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.hotel),
                        SizedBox(width: 8),
                        Text('Hoteles'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.car_rental),
                        SizedBox(width: 8),
                        Text('Transporte'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Trip images with descriptions
              Container(
                height: 250, // Altura fija para todas las tarjetas de viaje
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TripCard(
                      image: 'assets/trip_image1.jpg',
                      title: 'Paris, Francia',
                      description: 'Explora la ciudad del amor y la luz',
                      rating: 4.5,
                      cost: '€1200',
                    ),
                    SizedBox(width: 16),
                    TripCard(
                      image: 'assets/trip_image2.jpg',
                      title: 'Roma, Italia',
                      description:
                          'Descubre la historia y la arquitectura de la ciudad eterna',
                      rating: 4.7,
                      cost: '€1100',
                    ),
                    SizedBox(width: 16),
                    TripCard(
                      image: 'assets/trip_image2.jpg',
                      title: 'Barcelona, España',
                      description: 'Disfruta de la playa y la cultura catalana',
                      rating: 4.6,
                      cost: '€1000',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Calendario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Agregar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double rating;
  final String cost;

  TripCard({
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Ancho fijo para todas las tarjetas de viaje
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                  ),
                  SizedBox(height: 8),
                  Text(
                    cost,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
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
