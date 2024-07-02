import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'home_hoteles.dart';
import 'home_autos.dart';

class HomeVuelo extends StatelessWidget {
  final List<String> img = [
    'assets/vuelos/vuelo1.jpg',
    'assets/vuelos/vuelo2.jpg',
    'assets/vuelos/vuelo3.jpg',
    'assets/vuelos/vuelo4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vuelos'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                  height: 20), // Añade un espacio entre el texto y los botones
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // boton vuelos
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeVuelo()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.flight),
                        SizedBox(width: 5), 
                        Text(
                          'Vuelos',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 236, 236, 236),
                      foregroundColor: Colors.black,
                      minimumSize: Size(110, 70), // Tamaño fijo
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 10, // Añade sombra
                      shadowColor: Colors.grey, // Color de la sombra
                    ),
                  ),
                  SizedBox(width: 20), // Espacio entre botones
                  // boton hoteles
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeHotel()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.hotel),
                        SizedBox(width: 5), 
                        Text(
                          'Hoteles',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 236, 236, 236),
                      foregroundColor: Colors.black,
                      minimumSize: Size(110, 70), // Tamaño fijo
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 10, // Añade sombra
                      shadowColor: Colors.grey, // Color de la sombra
                    ),
                  ),
                  SizedBox(width: 20), // Espacio entre botones
                  // boton autos
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeAuto()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.directions_car),  // Icono que se muestra a la izquierda del texto
                        SizedBox(width: 5),  // Espacio entre el icono y el texto
                        Text(
                          'Autos',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 236, 236, 236),
                      foregroundColor: Colors.black,
                      minimumSize: Size(110, 70), // Tamaño fijo
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 10, // Añade sombra
                      shadowColor: Colors.grey, // Color de la sombra
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height:
                      40), // Espacio entre los botones y la barra de búsqueda
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        25.0), // Ajusta el padding según tus necesidades
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vuelos',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Descubre el mejor vuelo para tu destino',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),

              SizedBox(
                  height: 20), // Espacio entre la descripción y el contenido
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              color: Color(
                  0xE7E7E7E7), // Aquí estableces el color de fondo usando un valor hexadecimal
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  autoPlay: false, // Opcional: Para reproducción automática
                  // enlargeCenterPage: true, // Opcional: Para ampliar el centro de la página
                  scrollPhysics: BouncingScrollPhysics(),
                ),
                items: img.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: Image.asset(imagePath, fit: BoxFit.cover),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
