import 'package:flutter/material.dart';
import 'theme.dart';

class InfoCard extends StatefulWidget {
  final String? text;
  final Widget child;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final CrossAxisAlignment? horizontalAlign;
  final double? fontSize;
  const InfoCard(
      {Key? key,
      this.text,
      this.height,
      this.child = const LimitedBox(),
      this.padding,
      this.margin,
      this.horizontalAlign,
      this.fontSize})
      : super(key: key);

  @override
  State<InfoCard> createState() => CardState();
}

class CardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    // Card Box
    return Container(
      margin: widget.margin ?? const EdgeInsets.symmetric(vertical: 10),
      padding: widget.padding ?? const EdgeInsets.all(20),
      height: widget.height,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 1)
          ]),
      // Children
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: widget.horizontalAlign ?? CrossAxisAlignment.start,
        children: [
          // Text
          if (widget.text != null)
            Text(
              widget.text ?? '',
              style: TextStyle(
                  fontSize: widget.fontSize ?? 20,
                  color: AppTheme.cardTitleColor),
            ),
          // Child parameter
          widget.child,
        ],
      ),
    );
  }
}
