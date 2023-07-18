import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/model.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String walletAddress = '';

  Future<void> fetchWalletAddress() async {
    const apiUrl = 'https://projectx-anf9.onrender.com/api/addresses/createaddress/3';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final welcome = Welcome.fromJson(decodedResponse);
        setState(() {
          walletAddress = welcome.data.address;
        });
      } else {
        setState(() {
          walletAddress = 'Failed to fetch address.';
        });
      }
    } catch (e) {
      setState(() {
        walletAddress = 'Error: $e';
      });
    }
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Address copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: fetchWalletAddress,
              child: const Text('Fetch Wallet Address'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Wallet Address:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            GestureDetector( // Use GestureDetector for selectable and copyable text
              onTap: () => copyToClipboard(walletAddress),
              child: SelectableText( // Use SelectableText instead of Text
                walletAddress,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ... Existing classes for Welcome and Data ...
