import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'page_vuelos.dart';

class SearchVuelo extends StatefulWidget {
  @override
  _SearchVueloState createState() => _SearchVueloState();
}

enum TipoVuelo { idaVuelta, soloIda }

class _SearchVueloState extends State<SearchVuelo> {
  String _departure = '';
  String _arrival = '';
  String _dateRange = '';
  String _singleDate = '';
  TipoVuelo _selectedType = TipoVuelo.idaVuelta;

  Future<void> _selectDates(BuildContext context) async {
    DateTimeRange? pickedRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedRange != null) {
      setState(() {
        _dateRange =
            '${DateFormat('yyyy-MM-dd').format(pickedRange.start)} - ${DateFormat('yyyy-MM-dd').format(pickedRange.end)}';
      });
    }
  }

  Future<void> _selectSingleDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate != null) {
      setState(() {
        _singleDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  InputDecoration _buildInputDecoration(String labelText, IconData prefixIcon) {
    return InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(prefixIcon),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _buildOption(String label, TipoVuelo tipo) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedType = tipo;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _selectedType == tipo ? Colors.blue : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: _selectedType == tipo ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselItem(IconData icon, String text) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 25, color: Colors.blue),
          SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedFlight(String from, String to, String date) {
    return ListTile(
      leading: Icon(Icons.flight, color: Colors.blue),
      title: Text('$from a $to'),
      subtitle: Text(date),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Lógica al seleccionar un vuelo sugerido
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vuelos'),
      ),
      backgroundColor: const Color.fromARGB(255, 213, 213, 213),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child:
                            _buildOption('Ida y vuelta', TipoVuelo.idaVuelta),
                      ),
                      Expanded(
                        child: _buildOption('Solo ida', TipoVuelo.soloIda),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: _buildInputDecoration(
                        'Lugar de despegue', Icons.flight_takeoff),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: _buildInputDecoration(
                        'Lugar de aterrizaje', Icons.flight_land),
                  ),
                  SizedBox(height: 16.0),
                  if (_selectedType == TipoVuelo.idaVuelta)
                    TextField(
                      readOnly: true,
                      onTap: () => _selectDates(context),
                      decoration: _buildInputDecoration(
                        'Fechas del vuelo',
                        Icons.date_range,
                      ).copyWith(
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      controller: TextEditingController(text: _dateRange),
                    ),
                  if (_selectedType == TipoVuelo.soloIda)
                    TextField(
                      readOnly: true,
                      onTap: () => _selectSingleDate(context),
                      decoration: _buildInputDecoration(
                        'Fecha del vuelo',
                        Icons.date_range,
                      ).copyWith(
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      controller: TextEditingController(text: _singleDate),
                    ),
                  SizedBox(height: 40.0),
                  Text(
                    'Cualquier lugar.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCarouselItem(Icons.beach_access, 'Caribe'),
                        _buildCarouselItem(
                            Icons.photo_camera_outlined, 'Europa'),
                        _buildCarouselItem(Icons.directions_car, 'Canadá'),
                        _buildCarouselItem(Icons.travel_explore, 'Asia'),
                        _buildCarouselItem(Icons.headphones, 'España'),
                        _buildCarouselItem(
                            Icons.airline_seat_recline_extra, 'Portugal'),
                      ],
                    ),
                  ),
                  Divider(thickness: 2.0),
                  Text(
                    'Vuelos sugeridos:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildSuggestedFlight('Lima', 'Buenos Aires', '2024-07-15'),
                _buildSuggestedFlight('Nueva York', 'Londres', '2024-08-20'),
                _buildSuggestedFlight('Madrid', 'París', '2024-09-05'),
                _buildSuggestedFlight('Tokio', 'Seúl', '2024-10-10'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageVuelo()),
                  );
                },
                child: Text('Buscar'),
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
            ),
          ],
        ),
      ),
    );
  }
}
