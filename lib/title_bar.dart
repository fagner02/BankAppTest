import 'package:flutter/material.dart';
import 'theme.dart';

class TitleBar extends StatelessWidget {
  final String text;
  final Widget? startButton;
  final Widget? endButton;
  final Widget? card;
  const TitleBar(
      {Key? key, this.text = "", this.startButton, this.endButton, this.card})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
            height: size.height * 0.2,
            width: size.width,
            decoration: AppTheme.titleBarDecoration,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 20, bottom: 70.0, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                startButton ?? Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(text,
                      style: TextStyle(
                        fontSize: 22,
                        color: AppTheme.titleColor,
                      )),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: endButton ?? Container(),
                  ),
                ),
              ],
            )),
        Container(
          padding: const EdgeInsets.only(top: 70),
          alignment: Alignment.topCenter,
          child: card ?? Container(),
        ),
      ],
    );
  }
}
