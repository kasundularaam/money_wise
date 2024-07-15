import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewBankTransferPage extends StatelessWidget {
  const NewBankTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("NewBank Transfer Page"),
      ),
    );
  }
}
