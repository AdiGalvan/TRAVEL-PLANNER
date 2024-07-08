import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'template_botones.dart';
import 'home_hoteles.dart';
import 'home_autos.dart';
import 'page_vuelos.dart';

import 'search_vuelo.dart';

class HomeVuelo extends StatelessWidget {
  final List<String> img = [
    'assets/vuelos/vuelo1.jpg',
    'assets/vuelos/vuelo2.jpg',
    'assets/vuelos/vuelo3.jpg',
    'assets/vuelos/vuelo4.jpg',
  ];

  final List<String> img2 = [
    'assets/vuelos/vuelo3.jpg',
    'assets/vuelos/vuelo4.jpg',
    'assets/vuelos/vuelo2.jpg',
    'assets/vuelos/vuelo1.jpg',
  ];

  final List<String> names = [
    'Vuelo a París \nDescubre la ciudad del amor',
    'Vuelo a Nueva York \nExplora la Gran Manzana',
    'Vuelo a Londres \nViaja a la capital británica',
    'Vuelo a Roma \nVisita la ciudad eterna',
  ];

  final List<List<IconData>> iconsForNames = [
    [Icons.flight, Icons.location_city],
    [Icons.flight, Icons.location_city],
    [Icons.flight, Icons.location_city],
    [Icons.flight, Icons.location_city],
  ];

  @override
  Widget build(BuildContext context) {
    // Ajusta el ancho máximo del contenedor del carrusel
    double carouselContainerWidth = MediaQuery.of(context).size.width - 20;

    return Scaffold(
      appBar: AppBar(
        title: Text('Vuelos'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 20), // Añade un espacio entre el texto y los botones
              TemplateBotones(currentView: 'vuelos'),
              SizedBox(height: 40), // Espacio entre los botones y la barra de búsqueda
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchVuelo()),
                    );
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar un vuelo...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0), // Ajusta el padding según tus necesidades
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Directo sin escalas',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1),
                    Text(
                      'Evita las escalas y vuela directo a estos destinos',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: buildCarousel(context, img, names, iconsForNames, carouselContainerWidth, false),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 20), // Añade un espacio entre el texto y los botones
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0), // Ajusta el padding según tus necesidades
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Encuentra los vuelos más buscados del momento',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1), // Espacio entre la descripción y el contenido
            ]),
          ),
          SliverToBoxAdapter(
            child: buildCarousel(context, img2, names.reversed.toList(), iconsForNames.reversed.toList(), carouselContainerWidth, true), // Ajusta el margen del segundo carrusel aquí
          ),
        ],
      ),
    );
  }

  Widget buildCarousel(BuildContext context, List<String> images, List<String> names, List<List<IconData>> iconsForNames, double containerWidth, bool showStars) {
    // Ajusta el ancho máximo de las imágenes dentro del carrusel
    double imageWidth = containerWidth - 10;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      // Ajusta el ancho máximo del contenedor del carrusel
      width: containerWidth,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 300.0, // Ajusta la altura del carrusel según tus necesidades
          autoPlay: false,
          scrollPhysics: BouncingScrollPhysics(),
        ),
        items: images.asMap().entries.map((entry) {
          int index = entry.key;
          String imagePath = entry.value;
          String name = names[index];
          List<IconData> icons = iconsForNames[index];
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  navigateToPage(context, imagePath); // Navega a la página correspondiente al tocar la imagen
                },
                child: Column(
                  children: [
                    Container(
                      width: imageWidth,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 235, 235, 235),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7.0),
                            child: Image.asset(imagePath, fit: BoxFit.cover, width: imageWidth, height: 200), // Ajusta el tamaño de la imagen aquí
                          ),
                          SizedBox(height: 8), // Espacio entre la imagen y el texto de calificación
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: name.split('\n').asMap().entries.map((entry) {
                                int lineIndex = entry.key;
                                String line = entry.value;
                                IconData icon = icons[lineIndex];
                                return Row(
                                  children: [
                                    Icon(icon, color: const Color.fromARGB(255, 4, 63, 111), size: 20),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        line,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 4), // Espacio entre el nombre y la calificación
                          if (showStars) // Mostrar estrellas solo si showStars es true
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star, color: Colors.yellow, size: 20),
                                Icon(Icons.star, color: Colors.yellow, size: 20),
                                Icon(Icons.star, color: Colors.yellow, size: 20),
                                Icon(Icons.star, color: Colors.yellow, size: 20),
                                Icon(Icons.star_border, color: Colors.yellow, size: 20),
                              ],
                            ),
                          SizedBox(height: 8), // Espacio adicional al final
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  void navigateToPage(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        if (imagePath.contains('vuelo1.jpg')) {
          return PageVuelo();
        } else if (imagePath.contains('vuelo2.jpg')) {
          return PageVuelo();
        } else if (imagePath.contains('vuelo3.jpg')) {
          return PageVuelo();
        } else if (imagePath.contains('vuelo4.jpg')) {
          return PageVuelo();
        } else {
          return HomeVuelo(); // Cambia a la vista deseada por defecto
        }
      }),
    );
  }
}
