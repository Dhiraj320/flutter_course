import 'package:authentication/screens/phone_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import 'login_email_password_screen.dart';
import 'signup_email_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


    
      body: SafeArea(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordSignup.routeName);
              },
              text: 'Email/Password Sign Up',
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordLogin.routeName);
              },
              text: 'Email/Password Login',
            ),
            CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, PhoneScreen.routeName);
                },
                text: 'Phone Sign In'),
            CustomButton(
              onTap: () {
                // context.read<FirebaseAuthMethods>().signInWithGoogle(context);
              },
              text: 'Google Sign In',
            ),
            CustomButton(
              onTap: () {
                // context.read<FirebaseAuthMethods>().signInWithFacebook(context);
              },
              text: 'Facebook Sign In',
            ),
            CustomButton(
              onTap: () {
                // context.read<FirebaseAuthMethods>().signInAnonymously(context);
              },
              text: 'Anonymous Sign In',
            ),
          ],
        ),
      ),
    );
  }
}
