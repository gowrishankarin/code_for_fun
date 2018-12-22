import 'package:flutter/material.dart';

import './auth.dart';

// https://www.didierboelens.com/2018/04/facebook-oauth-login-with-flutter---solution/
class IvyLocalSignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IvyLocalSignInState();
  }
}

class _IvyLocalSignInState extends State<IvyLocalSignIn> {
  final Map<String, dynamic> _formData = {'email': null, 'password': null};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ivy Sign In'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildEmailTextField(),
              _buildPasswordTextField(),
              FlatButton(
                child: Text('Sign In'),
                onPressed: () {
                  _submitForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Email is required and valid';
        }
      },
      onSaved: (String value) {
        //setState(() {
        _formData['email'] = value;
        //});
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      //controller: _passwordTextController,
      validator: (String value) {
        if (value.isEmpty || value.length < 4) {
          return 'Password is required and should be 3+ characters long';
        }
      },
      onSaved: (String value) {
        //setState(() {
        _formData['password'] = value;
        //});
      },
    );
  }

  void _submitForm() async {
    IvyAuth ivyAuth = IvyAuth();
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Map<String, dynamic> successInformation =
        await ivyAuth.authenticate(_formData['email'], _formData['password']);

    print(successInformation);

    if (successInformation['success'] == 'SUCCESS') {
      // Navigator.pushReplacementNamed(context, '/');
      // 'api/manufacturers'
      IvyAPIs ivyAPIs = IvyAPIs();
      final response = await ivyAPIs.callIvyAPIs(
        'api/manufacturers',
        successInformation['payload']['token'],
        successInformation['payload']['role'],
      );
      print(response);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('An Error Occurred!'),
              content: Text(successInformation['message']),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}
