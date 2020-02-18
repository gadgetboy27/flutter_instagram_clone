import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  static final String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  _submit() {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(_password);
      //Login the user
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Instagram',
              style: TextStyle(
                fontFamily: 'Billabong', 
                fontSize: 50.0
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (input) => !input.contains('@') ? 'Valid email required' : null,
                      onSaved: (input) => _email = input,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (input) => input.length < 6 
                      ? 'Must be at least 6 characters'
                      : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20.0,),
              // End of login section
                  Container(
                    width: 250.0,
                    child: FlatButton(
                      onPressed: _submit,
                      color: Colors.blueAccent, 
                        padding: EdgeInsets.all(10.0),
                        child: Text('Login', 
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
              // Start of Signup section
                  Container(
                    width: 250.0,
                    child: FlatButton(
                      onPressed: () => Navigator.pushNamed(context, _signupScreen),
                      color: Colors.blueAccent, 
                        padding: EdgeInsets.all(10.0),
                        child: Text('Login', 
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('_email', _email));
    properties.add(StringProperty('_password', _password));
  }
}