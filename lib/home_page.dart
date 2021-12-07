import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/credit_card_page/credit_card_display.dart';
import 'package:testflutter/data.dart';
import 'account_balance_page/account_balance_route.dart';
import 'credit_card_page/card_route.dart';
import 'theme.dart';
import 'info_card.dart';
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

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white));
    return Scaffold(
      backgroundColor: AppTheme.backColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        anchor: 0,
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            onStretchTrigger: () async {
              debugPrint('stretchTriggerOffset');
            },
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
            expandedHeight: 0,
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
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
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
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    CreditCardRoute(),
                  );
                  Future.delayed(const Duration(milliseconds: 180), () {
                    SystemChrome.setSystemUIOverlayStyle(
                      const SystemUiOverlayStyle(
                          systemNavigationBarColor: Colors.purple),
                    );
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purple,
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1, vertical: 10),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const CreditCardDisplay(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 23),
                        alignment: Alignment.topLeft,
                        child: const Text(
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
              )
            ]),
          ),
        ],
      ),
    );
  }
}
