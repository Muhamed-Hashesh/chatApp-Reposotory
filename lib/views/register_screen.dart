import 'dart:developer';

import 'package:chat_application/helper/bars.dart';
import 'package:chat_application/helper/extensions.dart';
import 'package:chat_application/helper/snackbar.dart';
import 'package:chat_application/widgets/custom_button.dart';
import 'package:chat_application/widgets/custom_text_field.dart';
import 'package:chat_application/widgets/or_line_row.dart';
import 'package:chat_application/widgets/rich_text_spans.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size.height;
    var notifySize = MediaQuery.of(context).padding.top;
    var appBarSize = appBar.preferredSize.height;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: pageSize - (appBarSize + notifySize),
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  25.height,
                  const WelcomeMess(
                    toptext: 'Registration',
                    bottomText: 'please register down below',
                  ),
                  48.height,
                  const CustomTextField(
                    hintText: 'name',
                    icon: EneftyIcons.profile_outline,
                  ),
                  16.height,
                  CustomTextField(
                    onChange: (value) {
                      email = value;
                    },
                    hintText: 'email',
                    icon: EneftyIcons.message_outline,
                  ),
                  16.height,
                  CustomTextField(
                    onChange: (value) {
                      password = value;
                    },
                    hintText: 'password',
                    icon: EneftyIcons.lock_outline,
                    isPassword: true,
                  ),
                  16.height,
                  const CustomTextField(
                    hintText: 'Number',
                    icon: EneftyIcons.call_outline,
                  ),
                  32.height,
                  CustomButton(
                    title: 'Register',
                    color: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        isloading = true;
                        setState(() {});
                        try {
                          await registerUser();
                        } on FirebaseAuthException catch (e) {
                          customScaffold(context, text: e.message!);
                        } catch (e) {
                          // customScaffold(context, text: e.toString());
                          log(e.toString());
                        }
                        setState(() {
                          isloading = false;
                        });
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
                  Expanded(child: Container()),
                  40.height,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AuthPagesSwapping(
                      text1: 'Already have an account? ',
                      text2: 'Login',
                      onTap: () => Navigator.pushNamedAndRemoveUntil(context,
                          '/LoginPage', (Route<dynamic> route) => false),
                    ),
                  ),
                  8.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    final credential = FirebaseAuth.instance;
    await credential.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
