import 'package:flutter/material.dart';
import 'package:flutter_auth_tut/services/auth_service.dart';
import 'package:flutter_auth_tut/shared/styled_button.dart';
import 'package:flutter_auth_tut/shared/styled_text.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorFeedback;

  @override
  Widget build(BuildContext context) {
return Padding(padding: const EdgeInsets.all(16),
    child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Intro Text 
          Center(child: const StyledBodyText('Sign In in your account')),
          const SizedBox(height: 16),

          //Email address
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email Address',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          //Password
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),

          //Error Feedback

          if(_errorFeedback != null)
            Text(_errorFeedback!,
            style: const TextStyle(color: Colors.red),),

          //Sign Up Button
          const SizedBox(height: 16),
          StyledButton(onPressed: () async{
            if(_formKey.currentState!.validate()){
              setState(() {
                _errorFeedback = null;
              });

              final email = _emailController.text.trim();
              final password = _passwordController.text.trim();

              final user = await AuthService.signIn(email, password);

              //Error Feedback
              if (user == null){
                setState(() {
                  _errorFeedback = 'Incorrect Login credentials';
                });
            }
          }
          }, child: const StyledButtonText('Sign In')),
        ],
      )
    ),);
  }
}