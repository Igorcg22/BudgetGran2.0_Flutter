import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("BudgetGran", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Billabong')),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail', border: OutlineInputBorder()),
                validator: (value) => value!.contains('@') ? null : 'Insira um e-mail válido',
              ),
              SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha', border: OutlineInputBorder()),
                validator: (value) => value!.length < 6 ? 'Mínimo 6 caracteres' : null,
              ),
              SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, '/feed');
                    }
                  },
                  child: Text("Entrar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}