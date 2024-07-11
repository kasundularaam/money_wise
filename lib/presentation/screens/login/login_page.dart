// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:money_wise/application/auth/auth_cubit.dart';
import 'package:money_wise/application/cubit/login_cubit.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';
import 'package:money_wise/core/mutable_object.dart';
import 'package:money_wise/domain/user/user.dart';
import 'package:money_wise/injection.dart';
import 'package:money_wise/presentation/router/app_router.dart';
import 'package:money_wise/presentation/screens/login/widgets/pin_input.dart';
import 'package:money_wise/presentation/widgets/button.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';
import 'package:money_wise/presentation/widgets/toast.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _mPin = MutableObject("");

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          return;
        }
        if (state.failureOption.isSome()) {
          showFailedToast(context, state.failureOption.getOrCrash().message);
          return;
        }
        if (state.isAuthenticated) {
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
                  height: 200,
                ),
                const VGap(gap: 20),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.userOption.isSome()) {
                      return LoginForm(
                          user: state.userOption.getOrCrash(),
                          pin: _mPin.value,
                          onPinChange: (pin) => _mPin.value = pin);
                    }
                    return const TextRegular("No user found");
                  },
                ),
                const VGap(gap: 20),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class LoginForm extends StatelessWidget {
  final User user;
  final String pin;
  final Function(String) onPinChange;

  const LoginForm({
    super.key,
    required this.user,
    required this.pin,
    required this.onPinChange,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          state.maybeWhen(
              failed: (failure) => showFailedToast(context, failure.message),
              orElse: () {});
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.primaryColorDark,
                theme.primaryColor,
              ],
            ),
          ),
          child: Column(
            children: [
              Material(
                shape: const CircleBorder(
                    side: BorderSide(color: Colors.white, width: 1)),
                child: CircleAvatar(
                    radius: 40, backgroundImage: AssetImage(user.imageUrl)),
              ),
              const VGap(gap: 20),
              TextLarge(
                user.name,
                color: theme.primaryColorLight,
                bold: true,
              ),
              const VGap(gap: 40),
              const TextRegular(
                "Enter your PIN",
                thin: true,
                color: Colors.white,
              ),
              const VGap(gap: 20),
              PinInput(onPinChange: onPinChange),
              const VGap(gap: 40),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return state.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      orElse: () => GlassButton(
                          text: "Login",
                          onPressed: () =>
                              context.read<LoginCubit>().logIn(pin)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
