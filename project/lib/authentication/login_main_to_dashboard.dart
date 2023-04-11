import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:project/authentication/register.dart';
import 'package:project/authentication/services.dart';
import '../screens/nav.dart';
import 'login_register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = 'we are trying to sign you in baby';
    });

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NavPage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _errorMessage = 'Egbon, goan create an app joh.';
      } else if (e.code == 'wrong-password') {
        _errorMessage = 'shey you no know your password ni ?';
      } else {
        _errorMessage = e.message!;
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('16171A'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Container(
                        height: 41,
                        width: 41,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: HexColor('E8ECF4'))),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome Boss! Glad',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        Text(
                          'to see you, Again!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Email',
                          hintText: 'Enter your email',
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Email is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Password',
                          hintText: 'Enter your password',
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {}
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      if (_isLoading)
                        const CircularProgressIndicator()
                      else
                        ElevatedButton(
                          onPressed: () {

                            if (_formKey.currentState?.validate() ?? false) {
                              _login();
                            }
                          },
                          child: const Text('Login'),
                        ),
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            _errorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  // onTap: signIn,
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            HexColor('6262D9'),
                            HexColor('9D62D9'),
                          ]),

                      // color: HexColor('1E232C'),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                      child: const Text(
                        'Resgister',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  // onTap: signIn,
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            HexColor('6262D9'),
                            HexColor('9D62D9'),
                          ]),

                      // color: HexColor('1E232C'),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: GestureDetector(
                          onTap: (){
                            // AuthService().singInWithGoogle();
                          },
                          child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Image.asset(
                            'images/Google.png',
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'SignUp in Google ',
                            style: TextStyle(color: Colors.white),
                          ),
                      ],
                    ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 180,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'click here to register ?',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../screens/main_wallet_dashbaord.dart';
// import '../wallet/main_onboarding.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false;
//   String _errorMessage = '';
//
//   Future<void> _login() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = 'we are trying to sign you in baby';
//     });
//
//     try {
//       UserCredential userCredential =
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );
//
//       // user is logged in
//       print('User ${userCredential.user?.email} is logged in');
//
//       // Navigate to the home page
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => SecondRoute()),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         _errorMessage = 'Egbon, goan create an app joh.';
//       } else if (e.code == 'wrong-password') {
//         _errorMessage = 'shey you no know your password ni ?';
//       } else {
//         _errorMessage = e.message!;
//       }
//     } catch (e) {
//       _errorMessage = e.toString();
//     }
//
//     setState(() {
//       _isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body:
//       Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child:
//           Form(
//             key: _formKey,
//             child:
//
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 TextFormField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     hintText: 'Enter your email',
//                   ),
//                   validator: (value) {
//                     if (value?.isEmpty ?? true) {
//                       return 'Email is required';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     hintText: 'Enter your password',
//                   ),
//                   validator: (value) {
//                     if (value?.isEmpty ?? true) {
//
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 if (_isLoading)
//                   CircularProgressIndicator()
//                 else
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState?.validate() ?? false) {
//                         _login();
//                       }
//                     },
//                     child: Text('Login'),
//                   ),
//                 if (_errorMessage != null)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     child: Text(
//                       _errorMessage,
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
