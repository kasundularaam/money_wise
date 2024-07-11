import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GetSupportPage extends StatelessWidget {
  const GetSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Get Support Page"),
      ),
    );
  }
}
