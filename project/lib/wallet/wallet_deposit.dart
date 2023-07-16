import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/style.dart';

class WalletDeposit extends StatefulWidget {
  const WalletDeposit({super.key});

  @override
  State<WalletDeposit> createState() => _WalletDepositState();
}

class _WalletDepositState extends State<WalletDeposit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appstyle.backgroundColor,
        body: SafeArea(
          child: Column(


      children: const [
          Center(child: Text('Wallet Deposit', style: TextStyle(color: Colors.white, fontSize: 20),)),
      ],
    ),
        ));
  }
}
