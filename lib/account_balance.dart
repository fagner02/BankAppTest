import 'package:flutter/material.dart';
import 'info_card.dart';
import 'title_bar.dart';
import 'theme.dart';
import 'data.dart';

class AccountBalanceRoute extends PageRouteBuilder {
  AccountBalanceRoute()
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const AccountBalance(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1, 0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}

class AccountBalance extends StatelessWidget {
  const AccountBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataStorage.currentBalance -= 1;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleBar(
            text: 'Account',
            startButton: IconButton(
              iconSize: 25,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppTheme.titleColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            card: InfoCard(
              padding: const EdgeInsets.all(30),
              text: 'Balance',
              fontSize: 25,
              child: Text('R\$${DataStorage.currentBalance}',
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          InfoCard(
            horizontalAlign: CrossAxisAlignment.center,
            padding: const EdgeInsets.all(0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.2, vertical: 0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      tooltip: "pay",
                      icon: const Icon(Icons.payment)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code)),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      child: Column(
                        children: [
                          const Center(child: HistoryCard()),
                          const Center(child: HistoryCard()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HistoryCard extends StatefulWidget {
  const HistoryCard({Key? key}) : super(key: key);

  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
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
            ]),
      ),
      const Divider(
        height: 2,
        color: Colors.grey,
      ),
    ]);
  }
}
