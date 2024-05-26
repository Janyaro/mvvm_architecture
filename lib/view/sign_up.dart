import 'package:flutter/material.dart';
import 'package:nvvm/res/Component/round_button.dart';
import 'package:nvvm/utis/Route/RoutesNames.dart';
import 'package:nvvm/utis/utis.dart';
import 'package:nvvm/view_model/authViewModel.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocu = FocusNode();
  ValueNotifier<bool> obsecureValue = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    final auth_provider = Provider.of<AuthViewProvider>(context);
    final media = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign up ',
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              focusNode: emailFocus,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email_rounded)),
              onFieldSubmitted: (value) {
                Utils.changeFocussNode(context, emailFocus, passwordFocu);
              },
            ),
            SizedBox(
              height: media * 0.01,
            ),
            ValueListenableBuilder(
                valueListenable: obsecureValue,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: passwordFocu,
                    obscureText: obsecureValue.value,
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: 'password',
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: InkWell(
                            onTap: () {
                              obsecureValue.value = !obsecureValue.value;
                            },
                            child: Icon(obsecureValue.value
                                ? Icons.visibility_off
                                : Icons.visibility))),
                  );
                }),
            SizedBox(
              height: media * 0.03,
            ),
            RoundBtn(
                title: 'Sign Up',
                loading: auth_provider.signUpLoading,
                onpress: () {
                  if (emailController.text.isEmpty &&
                      passwordController.text.isEmpty) {
                    Utils.toastMessage('Please Enter email and password');
                  } else if (passwordController.text.length < 2) {
                    Utils.flushBarErrorMessage(
                        'Please Enter 8 dight password', context);
                  }
                  Map data = {
                    'email': emailController.text.toString(),
                    'password': passwordController.text.toString()
                  };
                  auth_provider.SignUpApi(data, context);
                  Utils.SnackBar('signUp Successfully', context);
                }),
            SizedBox(height: media * 0.01),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text('You already have an account Login In'))
          ],
        ),
      ),
    );
  }
}
