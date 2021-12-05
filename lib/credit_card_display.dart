import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'data.dart';
import 'theme.dart';

class CreditCardDisplay extends StatelessWidget {
  final String? cardNumber;
  final String? expiryDate;
  final String? name;
  const CreditCardDisplay(
      {Key? key, this.cardNumber, this.expiryDate, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 0),
      height: size.width * 0.8 * 0.64,
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            width: size.width * 0.8,
            height: size.width * 0.8 * 0.64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppTheme.creditCardColor,
            ),
            child: Column(children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.8 * 0.188,
                      left: size.width * 0.8 * 0.084),
                  child: SvgPicture.string(DataStorage.cardDetail2,
                      width: size.width * 0.8 * 0.176),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, right: 20),
                        alignment: Alignment.topRight,
                        child: SvgPicture.string(DataStorage.cardDetail1,
                            width: size.width * 0.8 * 0.212),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(
                            top: size.width * 0.8 * 0.096,
                            right: size.width * 0.8 * 0.16),
                        child: (expiryDate == null)
                            ? Container()
                            : Text(
                                expiryDate ?? '',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ]),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                    top: size.width * 0.8 * 0.040,
                    left: size.width * 0.8 * 0.08),
                child: (cardNumber == null)
                    ? Container(
                        height: size.width * 0.8 * 0.08,
                        width: size.width * 0.8 * 0.75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                      )
                    : Text(
                        cardNumber ?? '',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                    top: size.width * 0.8 * 0.044,
                    left: size.width * 0.8 * 0.08),
                child: (name == null)
                    ? Container(
                        height: size.width * 0.8 * 0.08,
                        width: size.width * 0.8 * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                      )
                    : Text(
                        name ?? '',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
