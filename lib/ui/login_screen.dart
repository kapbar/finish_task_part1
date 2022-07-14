import 'package:finish_task_part1/constants/app_assets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String? login;
  String? password;

  register() {
    final isValidated = formKey.currentState?.validate() ?? false;

    if (isValidated) {
      FocusScope.of(context).unfocus();
      formKey.currentState?.save();
      if (login == 'qwerty' && password == '123456ab') {
        Navigator.pushReplacementNamed(context, '/products');
      } else {
        return showAlertDialog(context);
      }
    }
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(AppAssets.images.logo),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Login',
                      filled: true,
                      fillColor: Color.fromARGB(255, 210, 210, 210),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSaved: (value) {
                      login = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Color.fromARGB(255, 210, 210, 210),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSaved: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () => register(),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 17.0,
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Sign in',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
