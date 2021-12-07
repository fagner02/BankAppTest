import 'package:flutter/material.dart';
import 'account_balance.dart';

class AccountBalanceRoute extends PageRouteBuilder {
  AccountBalanceRoute()
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const AccountBalance(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1, 0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
