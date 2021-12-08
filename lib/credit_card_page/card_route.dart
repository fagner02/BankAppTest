import '../home_page.dart';
import 'card_page.dart';
import 'package:flutter/material.dart';

class CreditCardRoute extends PageRouteBuilder {
  CreditCardRoute()
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const CreditCard(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: CurvedAnimation(
                parent: animation,
                curve: Curves.elasticOut,
              ),
              child: child,
            );
          },
          reverseTransitionDuration: const Duration(milliseconds: 0),
        );
}

class CreditCardPopRoute extends PageRouteBuilder {
  CreditCardPopRoute()
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MyHomePage(title: 'Home'),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            if (child is CreditCard) {
              debugPrint("HomePage");
            }
            return SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.ease)),
              ),
              child: child,
            );
          },
          reverseTransitionDuration: const Duration(milliseconds: 0),
        );
}
