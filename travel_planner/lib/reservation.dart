import 'package:flutter/material.dart';

import 'home_vuelos.dart';

class ReservacionView extends StatefulWidget {
  @override
  _ReservacionViewState createState() => _ReservacionViewState();
}

class _ReservacionViewState extends State<ReservacionView> {
  int _currentStep = 0;
  String _selectedPaymentMethod = 'Tarjeta de crédito';

  TextEditingController _nombreController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefonoController = TextEditingController();
  TextEditingController _numeroTarjetaController = TextEditingController();
  TextEditingController _titularController = TextEditingController();
  TextEditingController _fechaVencimientoController = TextEditingController();
  TextEditingController _codigoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _numeroTarjetaController.dispose();
    _titularController.dispose();
    _fechaVencimientoController.dispose();
    _codigoController.dispose();
    super.dispose();
  }

  List<Step> _buildSteps() {
    return [
      Step(
        title: Text('Datos de Pago'),
        isActive: _currentStep >= 0,
        state: _currentStep == 0 ? StepState.editing : StepState.complete,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selecciona el método de pago:'),
            SizedBox(height: 8.0),
            DropdownButton<String>(
              value: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'Tarjeta de crédito',
                  child: Text('Tarjeta de crédito'),
                ),
                DropdownMenuItem(
                  value: 'Tarjeta de débito',
                  child: Text('Tarjeta de débito'),
                ),
                DropdownMenuItem(
                  value: 'PayPal',
                  child: Text('PayPal'),
                ),
                DropdownMenuItem(
                  value: 'Transferencia bancaria',
                  child: Text('Transferencia bancaria'),
                ),
              ],
            ),
            if (_selectedPaymentMethod == 'Tarjeta de crédito') ...[
              SizedBox(height: 16.0),
              Text('Datos de la tarjeta:'),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _numeroTarjetaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Número de tarjeta',
                  // hintText: 'Ingrese el número de su tarjeta',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _titularController,
                decoration: InputDecoration(
                  labelText: 'Titular de la tarjeta',
                  // hintText: 'Ingrese el nombre del titular',
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _fechaVencimientoController,
                      decoration: InputDecoration(
                        labelText: 'Fecha de vencimiento',
                        // hintText: 'MM/YY',
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _codigoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Código',
                        // hintText: 'CVV',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
      Step(
        title: Text('Datos Personales'),
        isActive: _currentStep >= 1,
        state: _currentStep == 1 ? StepState.editing : StepState.indexed,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                // hintText: 'Ingrese su nombre',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                // hintText: 'Ingrese su correo electrónico',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _telefonoController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Teléfono',
                // hintText: 'Ingrese su número de teléfono',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _telefonoController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Ciudad',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _telefonoController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'País',
              ),
            ),
          ],
        ),
      ),
    ];
  }

  void _showReservacionCompletaAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¡Reservación Completada!'),
          content: Text('Tu reservación se ha realizado exitosamente.'),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeVuelo()), // Navega a HomeVuelos
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservación'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < _buildSteps().length - 1) {
            setState(() {
              _currentStep++;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        steps: _buildSteps(),
      ),
      floatingActionButton: SizedBox(
  width: MediaQuery.of(context).size.width * 0.9,
  child: ElevatedButton(
    onPressed: () {
      _showReservacionCompletaAlert(context);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check),
        SizedBox(width: 9),
        Text('Reservar'),
      ],
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 116, 144, 214),
      foregroundColor: Colors.white,
      minimumSize: Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
