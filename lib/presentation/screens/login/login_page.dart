import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_wise/application/auth/auth_cubit.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';
import 'package:money_wise/core/mutable_object.dart';
import 'package:money_wise/presentation/router/app_router.dart';
import 'package:money_wise/presentation/screens/login/widgets/pin_input.dart';
import 'package:money_wise/presentation/widgets/button.dart';
import 'package:money_wise/presentation/widgets/snackbar.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _mPin = MutableObject("");

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          return;
        }
        if (state.failureOption.isSome()) {
          showFailedSnackbar(
              context: context,
              message: state.failureOption.getOrCrash().message);
          return;
        }
        if (state.userOption.isSome()) {
          context.router.replaceAll([const HomeRoute()]);
        }
      },
      child: Scaffold(
          body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const VGap(gap: 20),
                Image.asset(
                  "assets/images/logo/logo.png",
                  width: 100,
                ),
                const VGap(gap: 50),
                const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/user/user.png")),
                const VGap(gap: 20),
                TextLarge(
                  "John Doe",
                  color: theme.primaryColorDark,
                  bold: true,
                ),
                const VGap(gap: 40),
                TextRegular(
                  "Enter your PIN",
                  thin: true,
                  color: theme.primaryColorDark,
                ),
                const VGap(gap: 40),
                PinInput(onPinChange: (pin) => _mPin.value = pin),
                const VGap(gap: 40),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return GradientButton(
                        text: "Login",
                        onPressed: () =>
                            context.read<AuthCubit>().logIn(_mPin.value));
                  },
                ),
                const VGap(gap: 40),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
