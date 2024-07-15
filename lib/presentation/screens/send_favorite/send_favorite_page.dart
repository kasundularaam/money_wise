import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SendFavoritePage extends StatelessWidget {
  const SendFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Send Favorite Page"),
      ),
    );
  }
}
