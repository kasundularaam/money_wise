import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_wise/application/auth/auth_cubit.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';
import 'package:money_wise/presentation/router/app_router.dart';
import 'package:money_wise/presentation/widgets/toast.dart';

@RoutePage()
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          return;
        }
        if (state.failureOption.isSome()) {
          final message = state.failureOption.getOrCrash().message;
          showFailedToast(context, message);
          return;
        }
        if (state.userOption.isSome()) {
          context.router.replaceAll([const HomeRoute()]);
          return;
        }
        context.router.replaceAll([LoginRoute()]);
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            "assets/images/logo/logo.png",
            width: 200,
          ),
        ),
      ),
    );
  }
}
