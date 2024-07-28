import 'dart:developer';

import 'package:chat_application/helper/bars.dart';
import 'package:chat_application/helper/extensions.dart';
import 'package:chat_application/helper/snackbar.dart';
import 'package:chat_application/views/register_screen.dart';
import 'package:chat_application/widgets/or_line_row.dart';
import 'package:chat_application/widgets/rich_text_spans.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size.height;
    var notifySize = MediaQuery.of(context).padding.top;
    var appBarSize = appBar.preferredSize.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: appBar,
      body: ModalProgressHUD(
        inAsyncCall: isloading,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: pageSize - (appBarSize + notifySize),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  25.height,
                  const WelcomeMess(
                    toptext: 'Welcome Back!',
                    bottomText: 'please enter your account here',
                  ),
                  48.height,
                  CustomTextField(
                    hintText: 'email',
                    icon: EneftyIcons.message_outline,
                    onChange: (value) {
                      email = value;
                    },
                  ),
                  16.height,
                  CustomTextField(
                    hintText: 'password',
                    icon: EneftyIcons.lock_outline,
                    isPassword: true,
                    onChange: (value) {
                      password = value;
                    },
                  ),
                  16.height,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  32.height,
                  CustomButton(
                    title: 'Login',
                    color: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        // _formKey.currentState!.save();
                        isloading = true;
                        setState(() {});
                        try {
                          await loginMethod();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            'chatScreen',
                            (route) => false,
                          );
                        } on FirebaseAuthException catch (errorMessage) {
                          customScaffold(context, text: errorMessage.message);
                        } catch (e) {
                          // customScaffold(context, text: e.toString());
                          log(e.toString());
                        }
                        isloading = false;
                        setState(() {});
                      } else {
                        customScaffold(context, text: 'Please fill all fields');
                      }
                    },
                  ),
                  const OrLine(),
                  CustomButton(
                    title: 'Facebook',
                    color: Theme.of(context).colorScheme.secondary,
                    isAuthenticationMethod: true,
                    logoSvgAsset: 'assets/logos/facebook.svg',
                    textColor: Theme.of(context).colorScheme.onSurface,
                  ),
                  8.height,
                  CustomButton(
                    title: 'Google',
                    color: Theme.of(context).colorScheme.secondary,
                    isAuthenticationMethod: true,
                    logoSvgAsset: 'assets/logos/google.svg',
                    textColor: Theme.of(context).colorScheme.onSurface,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                    child: AcceptTermsTextSnap(),
                  ),
                  Expanded(child: Container()),
                  AuthPagesSwapping(
                    text1: 'Don\'t have an account? ',
                    text2: 'Register',
                    onTap: () => Navigator.pushNamedAndRemoveUntil(context,
                        RegisterScreen.id, (Route<dynamic> route) => false),
                  ),
                  16.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginMethod() async {
    final credential = FirebaseAuth.instance;
    await credential.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
