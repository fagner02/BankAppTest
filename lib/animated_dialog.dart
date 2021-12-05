import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  const InfoRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                value,
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DialogCard extends StatefulWidget {
  const DialogCard({Key? key}) : super(key: key);

  @override
  _DialogCardState createState() => _DialogCardState();
}

class _DialogCardState extends State<DialogCard> with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController cardUp;
  late Animation<double> scaleAnimation;
  late Animation<double> cardUpAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 100),
    );

    cardUp = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
      reverseCurve: Curves.bounceOut,
    );

    cardUpAnimation = CurvedAnimation(
      parent: cardUp,
      curve: Curves.easeOut,
    );

    controller.addListener(() {
      setState(() {});
      if (controller.isDismissed) {
        Navigator.of(context).pop();
      }
      if (controller.value > 0.6) {
        cardUp.forward();
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      contentPadding: const EdgeInsets.all(0),
      insetPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      content: ScaleTransition(
        scale: scaleAnimation,

        /// Card
        child: Container(
          height: 400,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 0),
                blurRadius: 10,
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Text(
                      "Payment",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            controller.reverse();
                          },
                          icon: const Icon(
                            Icons.close,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SlideTransition(
                  position: cardUpAnimation.drive(
                    Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: const Offset(0, 0),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 0,
                    ),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  InfoRow(title: "To: ", value: "John Doe"),
                                  InfoRow(
                                    title: "Vulue: ",
                                    value: "R\$50,00",
                                  ),
                                ],
                              ),
                            ),
                            const Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Date: 12/11/2021",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
