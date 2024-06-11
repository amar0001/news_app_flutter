
import 'package:flutter/material.dart';
import 'package:news_app_flutter/view/dashboard.dart';
import 'package:news_app_flutter/view/forgot_password.dart';
import 'package:news_app_flutter/view/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});


  final String title;

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                         Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Dashboard(title: 'Dashboard')),
                );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
              ),

               Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUp(title: 'SignUp')),
                );
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
              ),
             Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPassword(title: 'Forgot Password')),
                );
                    },
                    child: const Text('Forgot Password'),
                  ),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}