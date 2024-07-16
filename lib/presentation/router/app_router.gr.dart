// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    GetSupportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GetSupportPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LandingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(key: args.key),
      );
    },
    NewBankTransferRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewBankTransferPage(),
      );
    },
    PayBillsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const PayBillsPage()),
      );
    },
    ProcessBillRoute.name: (routeData) {
      final args = routeData.argsAs<ProcessBillRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProcessBillPage(
          key: args.key,
          brand: args.brand,
        ),
      );
    },
    SendFavoriteRoute.name: (routeData) {
      final args = routeData.argsAs<SendFavoriteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SendFavoritePage(
          key: args.key,
          favoriteUser: args.favoriteUser,
        ),
      );
    },
    SendMoneyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SendMoneyPage(),
      );
    },
    TransactionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TransactionsPage(),
      );
    },
  };
}

/// generated route for
/// [GetSupportPage]
class GetSupportRoute extends PageRouteInfo<void> {
  const GetSupportRoute({List<PageRouteInfo>? children})
      : super(
          GetSupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'GetSupportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LandingPage]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute({List<PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [NewBankTransferPage]
class NewBankTransferRoute extends PageRouteInfo<void> {
  const NewBankTransferRoute({List<PageRouteInfo>? children})
      : super(
          NewBankTransferRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewBankTransferRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PayBillsPage]
class PayBillsRoute extends PageRouteInfo<void> {
  const PayBillsRoute({List<PageRouteInfo>? children})
      : super(
          PayBillsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PayBillsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProcessBillPage]
class ProcessBillRoute extends PageRouteInfo<ProcessBillRouteArgs> {
  ProcessBillRoute({
    Key? key,
    required Brand brand,
    List<PageRouteInfo>? children,
  }) : super(
          ProcessBillRoute.name,
          args: ProcessBillRouteArgs(
            key: key,
            brand: brand,
          ),
          initialChildren: children,
        );

  static const String name = 'ProcessBillRoute';

  static const PageInfo<ProcessBillRouteArgs> page =
      PageInfo<ProcessBillRouteArgs>(name);
}

class ProcessBillRouteArgs {
  const ProcessBillRouteArgs({
    this.key,
    required this.brand,
  });

  final Key? key;

  final Brand brand;

  @override
  String toString() {
    return 'ProcessBillRouteArgs{key: $key, brand: $brand}';
  }
}

/// generated route for
/// [SendFavoritePage]
class SendFavoriteRoute extends PageRouteInfo<SendFavoriteRouteArgs> {
  SendFavoriteRoute({
    Key? key,
    required User favoriteUser,
    List<PageRouteInfo>? children,
  }) : super(
          SendFavoriteRoute.name,
          args: SendFavoriteRouteArgs(
            key: key,
            favoriteUser: favoriteUser,
          ),
          initialChildren: children,
        );

  static const String name = 'SendFavoriteRoute';

  static const PageInfo<SendFavoriteRouteArgs> page =
      PageInfo<SendFavoriteRouteArgs>(name);
}

class SendFavoriteRouteArgs {
  const SendFavoriteRouteArgs({
    this.key,
    required this.favoriteUser,
  });

  final Key? key;

  final User favoriteUser;

  @override
  String toString() {
    return 'SendFavoriteRouteArgs{key: $key, favoriteUser: $favoriteUser}';
  }
}

/// generated route for
/// [SendMoneyPage]
class SendMoneyRoute extends PageRouteInfo<void> {
  const SendMoneyRoute({List<PageRouteInfo>? children})
      : super(
          SendMoneyRoute.name,
          initialChildren: children,
        );

  static const String name = 'SendMoneyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransactionsPage]
class TransactionsRoute extends PageRouteInfo<void> {
  const TransactionsRoute({List<PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
