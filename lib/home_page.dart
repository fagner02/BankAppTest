import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/account_balance.dart';
import 'package:testflutter/data.dart';
import 'theme.dart';
import 'info_card.dart';
import 'account_balance.dart';
import 'title_bar.dart';
import 'data.dart';
import 'package:flutter_svg/svg.dart';

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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
            floating: true,
            snap: true,
            pinned: true,
            shadowColor: Colors.transparent,
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
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(20)),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: AppTheme.backColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Credit cards",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50,
                      child: SvgPicture.asset(
                        'assets/credit_card.svg',
                        width: size.width * 0.8,
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
