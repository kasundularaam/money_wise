import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:money_wise/domain/brand/brand.dart';

@RoutePage()
class ProcessBillPage extends StatelessWidget {
  final Brand brand;

  const ProcessBillPage({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Process Bill"),
      ),
      body: const Center(
        child: Text("Process Bill Page"),
      ),
    );
  }
}
