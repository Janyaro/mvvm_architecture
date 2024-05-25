import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nvvm/res/Component/round_button.dart';
import 'package:nvvm/utis/utis.dart';
import 'package:nvvm/view_model/authViewModel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecureValue = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _obsecureValue.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final authprovider = Provider.of<AuthViewProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                controller: emailController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email_rounded),
                    label: Text('Email Address')),
                onFieldSubmitted: (Value) {
                  FocusScope.of(context).requestFocus(passwordFocusNode);
                },
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecureValue,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: _obsecureValue.value,
                      focusNode: passwordFocusNode,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_outlined),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecureValue.value = !_obsecureValue.value;
                              },
                              child: Icon(_obsecureValue.value
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          label: Text('Password')),
                    );
                  }),
              SizedBox(
                height: height * .1,
              ),
              RoundBtn(
                  title: 'login',
                  loading: authprovider.loading,
                  onpress: () {
                    if (emailController.text.isEmpty &&
                        passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Please Enter email and password', context);
                    } else if (passwordController.text.length < 6) {
                      Utils.toastMessage('please Enter 6 digit password');
                    } else if (!emailController.text.contains('@')) {
                      Utils.flushBarErrorMessage(
                          'please Enter Right email address', context);
                    } else {
                      Map data = {
                        'email': emailController,
                        'password': passwordController
                      };
                      authprovider.loginScreen(data, context);
                      print('Api hit ');
                    }
                  })
            ]),
      ),
    );
  }
}
