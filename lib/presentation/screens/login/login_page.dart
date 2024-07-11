// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:money_wise/application/auth/auth_cubit.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';
import 'package:money_wise/core/mutable_object.dart';
import 'package:money_wise/presentation/router/app_router.dart';
import 'package:money_wise/presentation/screens/login/widgets/login_form.dart';
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
