import 'package:flutter_auth_tut/screens/welcome/sign_in.dart';
import 'package:flutter_auth_tut/screens/welcome/sign_up.dart';
import 'package:flutter_auth_tut/services/auth_service.dart';
import 'package:flutter_auth_tut/shared/styled_text.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  bool _isSignUpForm = true;

  void _handleGoogleSignIn() async {
    try {
      await AuthService().signInWithGoogle();
    } catch (e) {
     print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledAppBarText('Flutter Auth'),
        backgroundColor: Colors.blue[500],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StyledHeading('Welcome.'), 


              if(_isSignUpForm)
                Column(children: [
                  const SignUp(),
                  const StyledBodyText("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isSignUpForm = false;
                      });
                    },
                    child: const StyledBodyText('Sign In'),
                  ),
                ],),


              if(!_isSignUpForm)
                Column(
                  children: [
                    const SignIn(),
                    const StyledBodyText("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isSignUpForm = true;
                        });
                      },
                      child: const StyledBodyText('Sign Up'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(color: Colors.grey),
                const SizedBox(height: 16),
                const StyledBodyText('Or'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                const Text("Sign in with Google"),
                IconButton(onPressed: _handleGoogleSignIn
                , icon: Image.network('https://img.icons8.com/color/452/google-logo.png', width: 30))
            ]
          )
        ],
        ),
      ),
    ),
    );
  }
}