import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/account_balance.dart';
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            Container(
              width: size.width,
              constraints: BoxConstraints(minHeight: size.height),
              padding: const EdgeInsets.only(bottom: 50.0),
              color: AppTheme.backColor,
              child: Column(
                children: [
                  TitleBar(
                    text: 'Home',
                    startButton: IconButton(
                      icon: Icon(Icons.account_circle_rounded,
                          color: AppTheme.titleColor),
                      onPressed: () {},
                    ),
                    endButton: IconButton(
                      icon:
                          Icon(Icons.menu_rounded, color: AppTheme.titleColor),
                      onPressed: () {},
                    ),
                    card: InfoCard(
                      text: "Welcome",
                      child: Text(DataStorage.userName,
                          style: TextStyle(
                              fontSize: 26, color: AppTheme.cardTextColor)),
                    ),
                  ),
                  GestureDetector(
                    onPanDown: (_) {
                      setState(() {
                        DataStorage.currentBalance += 4;
                      });
                      Navigator.push(context, AccountBalanceRoute());
                    },
                    child: InfoCard(
                      text: "Balance",
                      child: Text(
                          "R\$${DataStorage.currentBalance.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              // child: Stack(
              //   alignment: Alignment.topCenter,
              //   children: <Widget>[
              //     Container(
              //       margin: const EdgeInsets.only(top: 0),
              //       alignment: Alignment.topLeft,
              //       padding: const EdgeInsets.only(
              //           left: 30.0, bottom: 70, right: 30),
              //       height: size.height * 0.2,
              //       width: size.width,
              //       decoration: AppTheme.titleBarDecoration,
              //       child: Row(
              //         children: [
              //           const Padding(
              //             padding: EdgeInsets.only(right: 8.0),
              //             child: Icon(
              //               Icons.account_circle_rounded,
              //               color: Colors.white,
              //               size: 30,
              //             ),
              //           ),
              //           Container(
              //             padding: const EdgeInsets.all(0),
              //             child: const Text(
              //               "Home",
              //               style: TextStyle(color: Colors.white, fontSize: 20),
              //             ),
              //           ),
              //           const Expanded(
              //             child: Align(
              //               alignment: Alignment.centerRight,
              //               child: Icon(
              //                 Icons.menu,
              //                 color: Colors.white,
              //                 size: 30,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Flex(
              //       direction: Axis.vertical,
              //       clipBehavior: Clip.none,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Container(
              //           margin: const EdgeInsets.only(top: 100),
              //           width: size.width * 0.8,
              //           height: 200,
              //           decoration: const BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.all(Radius.circular(20)),
              //               boxShadow: [
              //                 BoxShadow(
              //                     color: Colors.black12,
              //                     offset: Offset(0, 0),
              //                     blurRadius: 10,
              //                     spreadRadius: 1)
              //               ]),
              //         ),
              //         GestureDetector(
              //           onPanDown: (_) {
              //             Navigator.push(context, AccountBalanceRoute());
              //           },
              //           child: InfoCard(
              //             text: "Balance",
              //             child: Text("R\$${currentBalance.toStringAsFixed(2)}",
              //                 style: const TextStyle(
              //                     fontSize: 23, fontWeight: FontWeight.bold)),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
