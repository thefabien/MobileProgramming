import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _error = '';

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      // Perform sign-in logic (non-Firebase example)
      if (_email == 'test@test.com' && _password == 'password') {
        // Simulate a successful sign-in
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signed in successfully')),
        );
        // Navigate to home screen or perform other actions
      } else {
        setState(() {
          _error = 'Failed to sign in. Please check your email and password.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() => _email = value.trim());
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() => _password = value.trim());
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                child: Text('Sign In'),
                onPressed: _signIn,
              ),
              SizedBox(height: 12.0),
              Text(
                _error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
