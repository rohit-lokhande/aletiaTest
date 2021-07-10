import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/constants/routes.dart';
import 'package:test_app/ui/widget/app_button.dart';
import 'package:test_app/util/widget_utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _loginIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          child: Center(
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: WidgetUtility.spreadWidgets(
                      [
                        TextFormField(
                          controller: _loginIdController,
                          decoration: InputDecoration(labelText: 'LoginId'),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please enter login id';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(labelText: 'password'),
                          obscureText: true,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                        AppButton(
                          onPressed: _onLoginPressed,
                          title: 'Login',
                        )
                      ],
                      interItemSpace: 12,
                      flowHorizontal: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      if (_loginIdController.text == 'Admin' &&
          _passwordController.text == '12345') {
        Navigator.restorablePushNamed(context, Routes.Dashboard);
      } else {
        Fluttertoast.showToast(msg: 'Please check LoginId and Password');
      }
    }
  }
}
