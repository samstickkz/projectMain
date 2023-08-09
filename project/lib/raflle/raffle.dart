import 'dart:async';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import '../payment/payment_page.dart';


class SpinWheel extends StatefulWidget {
  const SpinWheel({Key? key}) : super(key: key);

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  final _confettiController = ConfettiController();



  final selected = BehaviorSubject<int>();
  int rewards = 0;
  int remainingTime = 10; // initial remaining time in seconds
  late Timer _timer;

  List<int> items = [
    100,
    200,
    500,
    1000,
    100,
    200,
    500,
    1000,
    100,
    200,
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    selected.close();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainingTime -= 1;
      });
      if (remainingTime == 0) {
        timer.cancel();
        selected.add(Fortune.randomInt(0, items.length));
        Future.delayed(const Duration(seconds: 5), () {
          remainingTime = 20; // reset remaining time
          _startTimer(); // start the timer again
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spin Wheel"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding:const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Row(
                        children: const [
                          Text(
                            'Total balance: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('\$100')
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Total Wins: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('10')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Text(
                      'Total Cash Out: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('\$100,000')
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ],
            ),
            Text(
              "Spin in $remainingTime seconds",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300,
              child: FortuneWheel(

                selected: selected.stream,
                animateFirst: false,
                items: [
                  for (int i = 0; i < items.length; i++) ...<FortuneItem>{
                    FortuneItem(child: Text(items[i].toString())),
                  },
                ],
                onAnimationEnd: () {
                  setState(() {
                    rewards = items[selected.value];
                  });
                  _confettiController.play();
                  print(rewards);

                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      content: Text(
                        "Hi sam, You just won \$$rewards!",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: const Icon(Icons.thumb_up, color: Colors.white),
                      backgroundColor: Colors.green,
                      actions: [
                        TextButton(
                          child: const Text(
                            'Close',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                          },
                        ),
                      ],
                    ),
                    // SnackBar(
                    //   content: Text("You just won $rewards Points!"),
                    // ),
                  );
                  Future.delayed(const Duration(seconds: 5), () {
                    _confettiController.stop();
                  });
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    onPressed: () {
                      //navigate to deposit page
                      Get.to(() => const PaymentPage());
                    },
                    child: const Text("Deposit"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
