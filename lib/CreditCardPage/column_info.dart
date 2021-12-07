import 'package:flutter/material.dart';

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
