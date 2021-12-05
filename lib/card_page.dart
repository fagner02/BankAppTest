import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testflutter/credit_card_display.dart';
import 'package:testflutter/data.dart';
import 'package:testflutter/info_card.dart';

class CreditCardRoute extends PageRouteBuilder {
  CreditCardRoute()
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const CreditCard(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
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
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              const CreditCardDisplay(
                //cardNumber: '1234 5678 9012 3456',
                name: 'JOHN DOE',
                expiryDate: '12/20',
              ),
              InfoCard(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    InfoColumn(
                      titleSize: 25,
                      title: 'NAME',
                      value: 'JOHN DOE',
                    ),
                    InfoColumn(
                      title: 'EXPIRING DATE',
                      value: '12/20',
                    ),
                    InfoColumn(
                      title: 'CVV',
                      value: '432',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
