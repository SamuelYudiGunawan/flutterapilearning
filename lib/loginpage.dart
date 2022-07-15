import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:latihan1/idcard.dart';
import 'package:latihan1/shared/customtext.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final List<String> items = [
    'Semarang',
    'Depok',
    'Bekasi',
  ];
  String? selectedValue;

  @override
    Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[300],
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(text: 'Login'),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          hintText: 'Enter Your Username'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter your secure password'),
                    ),
                    const SizedBox(height: 8),
                    CustomDropdownButton2(
                      hint: 'Select Placement',
                      buttonWidth: 15000,
                      dropdownItems: items,
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (passwordController.text == "admin123" &&
                            usernameController.text == "admin123") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const IdCard()));
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Incorrect username or password'),
                          );
                          print('Incorrect username or password');

                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);

                          print(snackBar);
                        }
                      },
                      child: const Center(
                        child: Text('Login'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
