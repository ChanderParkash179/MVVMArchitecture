import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/Resources/components/roundButton.dart';
import 'package:mvvm/Utils/routeNames.dart';
import 'package:mvvm/Utils/utils.dart';
import 'package:mvvm/ViewModel/authViewModel.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();

    _obsecurePassword.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _authViewMode = Provider.of<AuthViewModel>(context);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'SIGNUP',
              style: TextStyle(letterSpacing: 1),
            ),
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter your Email',
                    prefixIcon: Icon(CupertinoIcons.mail_solid),
                    labelText: 'Email',
                  ),
                  onFieldSubmitted: ((value) {
                    Utils().focusOnSubmit(
                        context, emailFocusNode, passwordFocusNode);
                  }),
                ),
                Utils().verticalSpace(20),
                ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: _obsecurePassword.value,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Please Enter your Password',
                          prefixIcon:
                              const Icon(CupertinoIcons.lock_circle_fill),
                          labelText: 'Password',
                          suffixIcon: InkWell(
                            onTap: (() => _obsecurePassword.value =
                                !_obsecurePassword.value),
                            child: _obsecurePassword.value
                                ? const Icon(CupertinoIcons.eye_slash_fill)
                                : const Icon(CupertinoIcons.eye_fill),
                          ),
                        ),
                        onFieldSubmitted: ((value) {
                          Utils().focusOnSubmit(
                              context, passwordFocusNode, emailFocusNode);
                        }),
                      );
                    }),
                Utils().verticalSpace(30),
                RoundedButton(
                    title: 'Signup',
                    onPress: () {
                      if (emailController.text.isEmpty) {
                        Utils().flushbarErrorMessage(
                            'Please Enter Email', context);
                      } else if (passwordController.text.isEmpty) {
                        Utils().snakebar('Please Enter Password', context);
                      } else {
                        Map data = {
                          "email": emailController.text.toString(),
                          "password": passwordController.text.toString()
                        };
                        _authViewMode.signupApi(data, context);
                        Utils().toastMessage(
                            '${emailController.text.toString()} is SignedUp Now!');
                      }
                    }),
                Utils().verticalSpace(35),
                InkWell(
                  onTap: () {
                    Utils().toastMessage('Going to ${RouteNames.loginRoute}');
                    Navigator.pushNamed(context, RouteNames.loginRoute);
                  },
                  child: const Text(
                    'Already have an account! Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
