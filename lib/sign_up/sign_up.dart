// ignore_for_file: library_private_types_in_public_api, curly_braces_in_flow_control_structures, unnecessary_null_comparison, unused_local_variable

import 'package:flutter/material.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmEmailController = TextEditingController();
  final dobController = TextEditingController();
  String selectedGender = 'Male'; // Default value
  DateTime? selectedDate; // Store the selected date

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
  }

  void signUpUser() {
    // Implement your sign-up logic here
    // You can access the field values using the controller values
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmEmail = confirmEmailController.text;
    final dob = dobController.text;
    final gender = selectedGender;

    // Validate and process the user registration
    if (username.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmEmail.isNotEmpty &&
        dob.isNotEmpty) {
      if (email == confirmEmail) {
        // Perform user registration here
        print('User registered successfully!');
      } else {
        print('Emails do not match.');
      }
    } else {
      print('Please fill in all the required fields.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  labelText: 'Username',
                  obscureText: true,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  labelText: 'Email',
                  obscureText: false,
                ),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  labelText: 'Password',
                  obscureText: true,
                ),
                MyTextField(
                  controller: confirmEmailController,
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                  obscureText: false,
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: MyTextField(
                      controller: dobController,
                      hintText: 'Date of Birth',
                      labelText: 'Date of Birth',
                      obscureText: false,
                    ),
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  onChanged: (newValue) {
                    setState(() {
                      selectedGender = newValue!;
                    });
                  },
                  items: ['Male', 'Female', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                  ),
                ),
                const SizedBox(height: 20),
                MyButton(onTap: signUpUser, hintText: 'Sign Up'),
                const SizedBox(height: 50), // Added spacing below the button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
