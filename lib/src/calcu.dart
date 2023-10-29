import 'package:flutter/material.dart';

//void main() {
//  runApp(CalculadoraApp());
//}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  TextEditingController numero1 = TextEditingController();
  TextEditingController numero2 = TextEditingController();
  String operacion = 'Suma';
  String resultado = '';

  void calcularResultado() {
    double num1 = double.parse(numero1.text);
    double num2 = double.parse(numero2.text);
    double igual;

    switch (operacion) {
      case 'Suma':
        igual = num1 + num2;
        break;
      case 'Resta':
        igual = num1 - num2;
        break;
      case 'Multiplicación':
        igual = num1 * num2;
        break;
      case 'División':
        igual = num1 / num2;
        break;
      default:
        igual = 0;
    }

    setState(() {
      resultado = 'Resultado: $igual';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextField(
                controller: numero1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Primer Número',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextField(
                controller: numero2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Segundo Número',
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: operacion,
                  onChanged: (String? nuevoValor) {
                    setState(() {
                      operacion = nuevoValor!;
                    });
                  },
                  items: <String>['Suma', 'Resta', 'Multiplicación', 'División']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: calcularResultado,
              icon: Icon(Icons.calculate),
              label: Text('Calcular'),
              
            ),
            
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 11, 138, 197),
                border: Border.all(),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                resultado,
                style: TextStyle(fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}