import 'package:finish_task_part1/constants/app_assets.dart';
import 'package:finish_task_part1/generated/l10n.dart';
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
          title: Text(S.of(context).somethingWentWrongTryAgain),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(S.of(context).ok),
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
                    decoration: InputDecoration(
                      hintText: S.of(context).login,
                      filled: true,
                      fillColor: const Color.fromARGB(255, 210, 210, 210),
                      border: const OutlineInputBorder(
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
                    decoration: InputDecoration(
                      hintText: S.of(context).password,
                      filled: true,
                      fillColor: const Color.fromARGB(255, 210, 210, 210),
                      border: const OutlineInputBorder(
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
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              S.of(context).signIn,
                              style: const TextStyle(fontSize: 20.0),
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
