import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:money_wise/presentation/screens/get_support/get_support_page.dart';
import 'package:money_wise/presentation/screens/home/home_page.dart';
import 'package:money_wise/presentation/screens/login/login_page.dart';
import 'package:money_wise/presentation/screens/new_bank_transfer/new_bank_transfer_page.dart';
import 'package:money_wise/presentation/screens/pay_bills/pay_bills_page.dart';
import 'package:money_wise/presentation/screens/process_bill/process_bill_page.dart';
import 'package:money_wise/presentation/screens/send_favorite/send_favorite_page.dart';
import 'package:money_wise/presentation/screens/send_money/send_money_page.dart';
import 'package:money_wise/presentation/screens/transactions/transaction_page.dart';
import '/presentation/screens/landing/landing_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LandingRoute.page, path: "/"),
        AutoRoute(page: HomeRoute.page, path: "/home"),
        AutoRoute(page: LoginRoute.page, path: "/login"),
        AutoRoute(page: SendMoneyRoute.page, path: "/send-money"),
        AutoRoute(page: TransactionsRoute.page, path: "/transactions"),
        AutoRoute(page: PayBillsRoute.page, path: "/pay-bills"),
        AutoRoute(page: GetSupportRoute.page, path: "/get-support"),
        AutoRoute(page: NewBankTransferRoute.page, path: "/new-bank-transfer"),
        AutoRoute(page: ProcessBillRoute.page, path: "/process-bill"),
        AutoRoute(page: SendFavoriteRoute.page, path: "/send-favorite"),
      ];
}
