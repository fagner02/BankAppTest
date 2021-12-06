import 'package:flutter/material.dart';
import 'package:testflutter/credit_card_display.dart';
import 'package:testflutter/home_page.dart';
import 'package:testflutter/info_card.dart';

class CreditCardRoute extends PageRouteBuilder {
  CreditCardRoute()
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const CreditCard(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.elasticOut)),
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

class InfoColumn extends StatelessWidget {
  final String title;
  final String value;
  final double titleSize;
  const InfoColumn(
      {Key? key, this.title = '', this.value = '', this.titleSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            title,
            style: TextStyle(
                fontSize: titleSize * .75,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.6)),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            value,
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context, CreditCardPopRoute());
        //Navigator.pushReplacement(context, CreditCardPopRoute());
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                  child: Row(
                    children: [
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            CreditCardPopRoute(),
                          );
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                      ),
                      const Text(
                        'Credit Card',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const CreditCardDisplay(
                  cardNumber: '1234 5678 9012 3456',
                  name: 'JOHN DOE',
                  expiryDate: '12/20',
                ),
                InfoCard(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(bottom: 30, left: 30, top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      InfoColumn(
                        titleSize: 25,
                        title: 'NAME',
                        value: 'JOHN DOE',
                      ),
                      InfoColumn(
                        title: 'EXPIRY DATE',
                        value: '12/20',
                      ),
                      InfoColumn(
                        title: 'CVV',
                        value: '432',
                      ),
                      InfoColumn(
                        title: 'FUNCTION',
                        value: 'CREDIT/DEBIT',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
