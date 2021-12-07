import 'package:flutter/material.dart';
import '../info_card.dart';
import '../title_bar.dart';
import '../theme.dart';
import '../data.dart';
import 'account_balance_route.dart';
import 'history_card.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataStorage.currentBalance -= 1;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 0,
      ),
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
                Navigator.pop(context, AccountBalanceRoute());
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
                        children: const [
                          HistoryCard(),
                          HistoryCard(),
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
