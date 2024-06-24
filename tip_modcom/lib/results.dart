// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  const Results({
    Key? key,
    required this.bills,
    required this.perPersonShare,
  }) : super(key: key);
  final double bills;
  final double perPersonShare;

  @override
  Widget build(BuildContext context) {
    Person x = Person();
    return Scaffold(
      appBar: AppBar(),
      body: Center( // intl - pub.dev
        child: Text(
            "The Total Bill for ${x.name} is : ${bills.toStringAsFixed(0)}, Per person Sharing Bill is $perPersonShare "),
      ),
    );
  }
}

class Person {
  var name = 'David'; // property

  eats() {
    // property
  }
}
