// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class BitGoWalletBalance extends StatefulWidget {
//   @override
//   _BitGoWalletBalanceState createState() => _BitGoWalletBalanceState();
// }
//
// class _BitGoWalletBalanceState extends State<BitGoWalletBalance> {
//   String _balance = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _getBalance();
//   }
//
//   Future<void> _getBalance() async {
//     final response = await http.get(
//       Uri.parse('https://test.bitgo.com/api/v2/wallet/<63fa8d51f5068700078c59d56608415e>/balance'),
//       headers: {
//         'Authorization': 'Bearer <v2x60c4f548b2ac12cee80fdbd4b2bd0f4fe392924acc0f90a1fae132bc55a31fc3>',
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final jsonResponse = jsonDecode(response.body);
//       final balance = jsonResponse['balance'].toString();
//       setState(() {
//         print(response.body);
//         _balance = balance;
//       });
//     } else {
//       print('Failed to load balance: ${response.statusCode}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('BitGo Wallet Balance'),
//       ),
//       body: Center(
//         child: Text(
//
//           'Balance: $_balance',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
