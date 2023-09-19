import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_iconbutton.dart';
import 'package:onboarding_screen/component/my_textbutton.dart';
import 'package:onboarding_screen/component/my_textfield.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signInUser() async {
    if (emailController.text != "" && passwordController.text != "") {
      print("It's Ok");
    } else {
      print("Please input your email and password.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Form(
            child: Column(
              children: [
                Text(
                  "Hello, ready to get started?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Please sign in with your email and password",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: 'Please input your email',
                  obscureText: false,
                  labelText: 'Email',
                ),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Please input your password',
                  obscureText: true,
                  labelText: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                const MyTextButton(
                  labelText: "Forgot password?",
                  pageRoute: 'forgot',
                ),
                const SizedBox(
                  height: 25,
                ),
                MyButton(onTap: signInUser, hintText: 'Sign in'),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Text(
                          'Or Continue with',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                //Icon Button
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyIconButton(
                      imagePath: "assets/images/google.png",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyIconButton(
                      imagePath: "assets/images/apple.png",
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const MyTextButton(
                        labelText: "Register now",
                        pageRoute: 'register',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
