import 'package:flutter/material.dart';
import 'package:testflutter/account_balance.dart';
import 'package:testflutter/card_page.dart';
import 'package:testflutter/credit_card_display.dart';
import 'package:testflutter/data.dart';
import 'theme.dart';
import 'info_card.dart';
import 'account_balance.dart';
import 'title_bar.dart';
import 'data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.backColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 0.1,
            backgroundColor: AppTheme.primaryColor,
            elevation: 0,
            flexibleSpace: Container(
              color: AppTheme.primaryColor,
              height: size.height,
              width: size.width,
            ),
            pinned: true,
            stretch: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              TitleBar(
                text: 'Home',
                card: InfoCard(
                  text: 'Welcome',
                  fontSize: 25,
                  child: Text(
                    DataStorage.userName,
                    style: const TextStyle(fontSize: 27),
                  ),
                ),
              ),
              InfoCard(
                onTap: () {
                  setState(() {
                    DataStorage.currentBalance += 4;
                  });
                  Navigator.push(context, AccountBalanceRoute());
                },
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1, vertical: 10),
                text: "Balance",
                child: Text(
                    "R\$${DataStorage.currentBalance.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold)),
              ),
              InfoCard(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                padding: const EdgeInsets.all(0),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, CreditCardRoute());
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: size.height * 0.1,
                        margin: const EdgeInsets.only(top: 170),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Colors.purple,
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 15.0, left: 26),
                              child: Text(
                                "CARDS",
                                style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 3,
                                  fontFamily: "fifteen",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, CreditCardRoute());
                        },
                        child: const CreditCardDisplay(),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
