import 'package:flutter/material.dart';
import '../animated_dialog.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({Key? key}) : super(key: key);

  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            routeSettings: const RouteSettings(name: 'dialog'),
            barrierColor: Colors.transparent,
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const DialogCard();
            });
      },
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: const Icon(Icons.payments),
                        ),
                        const Text("Payment",
                            style: TextStyle(fontSize: 16, color: Colors.red)),
                      ]),
                ),
                const Text("\$0.00", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
