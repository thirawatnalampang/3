import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'validators.dart';

class FormBodyInfoPage extends StatefulWidget {
  const FormBodyInfoPage({Key? key}) : super(key: key);

  @override
  State<FormBodyInfoPage> createState() => _FormBodyInfoPageState();
}

class _FormBodyInfoPageState extends State<FormBodyInfoPage> {
  double _weight = 0, _height = 0;
  final _formKey = GlobalKey<FormState>();

  void _calculateBMI() {
    if (_formKey.currentState!.validate()) {
      double bmi = _weight / ((_height / 100) * (_height / 100));
      String result = '';
// Display result in a dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Your BMI Result'),
          content: Text('Your BMI is ${bmi.toStringAsFixed(2)}\nWeight Status: $result'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Body Information'),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Center(
                child: Image.asset(
                  'images/bmi.png', // 
                  width: 400, // 
                  height: 150,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(22, 20, 20, 0),
              alignment: Alignment.topLeft,
              child: const Text('Your Weight (Kg.)'),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9.-]')),
                ],
                decoration: InputDecoration(
                  labelText: 'Weight (Kg.)',
                  hintText: 'Input your weight to calculate BMI',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  _weight = double.tryParse(value) ?? 0;
                },
                validator: Validators.compose([
                  Validators.required('Required number [0-9]'),
                  Validators.min(0, 'Required number more than zero!'),
                ]),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(22, 20, 20, 0),
              alignment: Alignment.topLeft,
              child: const Text('Your Height (Cm.)'),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9.-]')),
                ],
                decoration: InputDecoration(
                  labelText: 'Height (Cm.)',
                  hintText: 'Input your height in centimeters',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  _height = double.tryParse(value) ?? 0;
                },
                validator: Validators.compose([
                  Validators.required('Required number [0-9]'),
                  Validators.min(100, 'Required number more than 100 CM!'),
                ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: _calculateBMI,
                      child: const Text('Submit'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
