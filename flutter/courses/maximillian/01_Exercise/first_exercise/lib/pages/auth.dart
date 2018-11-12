import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  setState(() {
                    _emailValue = value;
                  });
                  
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _passwordValue = value;
                  });
                  
                },
              ),
              RaisedButton(
                child: Text('LOGIN'),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: () {
                  final Map<String, String> loginCredentials = {
                    'email': _emailValue,
                    'password': _passwordValue
                  };
                  Navigator.pushReplacementNamed(context, '/products');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
