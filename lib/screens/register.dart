import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:poke_co/screens/login.dart';
import 'dart:convert' as convert;


void main() {
    runApp(const RegisterApp());
}

class RegisterApp extends StatelessWidget {
const RegisterApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Register Account',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const RegisterPage(),
    );
    }
}

class RegisterPage extends StatefulWidget {
    const RegisterPage({super.key});

    @override
    _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _passwordConfirmationController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Register'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        TextField(
                            controller: _passwordConfirmationController,
                            decoration: const InputDecoration(
                                labelText: 'Confirm Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;
                                String confirmPassword = _passwordConfirmationController.text;

                                // Cek kredensial
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.postJson(
                                  "http://127.0.0.1:8000/auth/register/", 
                                  convert.jsonEncode(<String, String>{
                                    'username': username,
                                    'password1': password,
                                    'password2': confirmPassword
                                  })
                                );
                    
                                if (response['status'] == 'success') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "Account has been successfully registered!"),
                                  ));
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "An error occured, please try again."),
                                  ));
                                }
                            },
                            child: const Text('Register'),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text('Login'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                    ],
                ),
            ),
        );
    }
}