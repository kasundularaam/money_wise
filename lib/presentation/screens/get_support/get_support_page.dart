import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_wise/presentation/widgets/button.dart';
import 'package:money_wise/presentation/widgets/gradient_card.dart';
import 'package:money_wise/presentation/widgets/light_box.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';
import 'package:money_wise/presentation/widgets/text_input_field.dart';

@RoutePage()
class GetSupportPage extends StatelessWidget {
  const GetSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Support"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GradientCard(
              title: "Quick call",
              child: Column(
                children: [
                  const VGap(gap: 20),
                  LightBox(
                    child: Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextMedium(
                                "011 - 243 33 45",
                                color: Colors.white,
                                bold: true,
                              ),
                              TextRegular(
                                "Contact support agent",
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.white.withOpacity(.4),
                          shape: const CircleBorder(
                            side: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {},
                            customBorder: const CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(Icons.call,
                                  color: theme.primaryColor, size: 32),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const VGap(gap: 10),
            GradientCard(
              title: "Write to mail box",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VGap(gap: 20),
                  const TextRegular("Subject", color: Colors.white),
                  const VGap(),
                  const TextInputField(),
                  const VGap(gap: 20),
                  const TextRegular("Your email", color: Colors.white),
                  const VGap(),
                  TextInputField(
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z0-9@.]'))
                    ],
                  ),
                  const VGap(gap: 20),
                  const TextRegular("Message", color: Colors.white),
                  const VGap(),
                  const TextInputField(maxLines: 5),
                  const VGap(gap: 20),
                  GlassButton(text: "Send", onPressed: () {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
