import 'package:flutter/material.dart';

import 'results.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  // controllers
  final _billController = TextEditingController();
  final _tipController = TextEditingController();
  final _noPersController = TextEditingController();

  double bills = 0.0;
  double perPersonShare = 0.0;
  var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //     scaffold - Form - column - textfields(3) - button[navigate to results]

    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Calculator"),
      ),
      body: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                  controller: _billController,
                  validator: (value) {
                    if (value!.isEmpty || double.tryParse(value) == null) {
                      return 'Invalid';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(labelText: 'Enter Bill')),
              TextFormField(
                  controller: _tipController,
                  decoration: InputDecoration(labelText: 'Enter Tip')),
              TextFormField(
                  controller: _noPersController,
                  validator: (value) {
                    if (value!.isEmpty || int.tryParse(value) == null) {
                      return 'Invalid';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(labelText: 'Group Size')),
              ElevatedButton(
                  onPressed: () {
                    var isValid = key.currentState!.validate();
                    if (!isValid) {
                      return;
                    }

                    double bill = double.tryParse(_billController.text) ?? 0;
                    double tip = double.parse(_tipController.text);
                    int person = int.parse(_noPersController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Results(
                                  bills: total(bill, tip),
                                  perPersonShare: perpersonShare(bill, person),
                                )));
                  },
                  child: Text("Calculate")),
            ],
          )),
    );
  }

  double total(double bill, double tip) {
    // calculate total
    return (bill + (bill * tip / 100));
  }

  double perpersonShare(double bill, int noPerson) {
    return bill / noPerson;
  }
}
