// import 'package:flutter/material.dart';
// import 'package:nfc_manager/nfc_manager.dart';
//
// class NfcPage extends StatefulWidget {
//   @override
//   _NfcPageState createState() => _NfcPageState();
// }
//
// class _NfcPageState extends State<NfcPage> {
//   String _phoneNumber = '';
//
//   Future<void> _startNFC() async {
//     try {
//       await NfcManager.instance.startSession(
//         onDiscovered: (NfcTag tag) async {
//           if (tag.type == NfcTagType.iso7816) {
//             // Handle the tag data here
//             final ndef = tag.ndef;
//             if (ndef != null) {
//               final record = NdefRecord.createUri('tel:$_phoneNumber');
//               await ndef.write(record);
//             }
//           }
//         },
//       );
//     } on Exception catch (ex) {
//       print('Error: $ex');
//     }
//   }
//
//   @override
//   void dispose() {
//     NfcManager.instance.stopSession();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Send phone number via NFC'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Enter your phone number:',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 hintText: 'Phone number',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (value) => setState(() => _phoneNumber = value),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () => _startNFC(),
//               child: Text('Send via NFC'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
