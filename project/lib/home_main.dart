import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('images/sam.JPG'),
          Text('Welcome${user.email!}'),
          MaterialButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          },
          color: Colors.blueAccent,
            child: const Text('Sign Out'),
          )
        ],
      ),
    );
  }
}
