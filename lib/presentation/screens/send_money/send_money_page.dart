import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SendMoneyPage extends StatelessWidget {
  const SendMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SendMoney Page"),
      ),
    );
  }
}
