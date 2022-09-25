import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  static const routeName = '/startScreen';

  @override
  State<StatefulWidget> createState() {
    return _StartState();
  }
}

class _StartState extends State<StartScreen> {
  late _Controller con;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: const Text('Start Screen'),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
            child: Column(
      children: [
        const Text('Floricapture', style: TextStyle(
          fontFamily: 'Unica',
          fontSize: 40.0,
        )),
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Enter email',
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: con.validateEmail,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.key),
                  hintText: 'Enter password',
                ),
                obscureText: true,
                autocorrect: false,
                validator: con.validatePassword, 
              ),
              ElevatedButton(
                onPressed: con.signin,
                child: Text('Sign In', style: Theme.of(context).textTheme.button,),
                ),
            ],
          ),
        ),
      ],
    )));
  }
}

class _Controller {
  // private controller for start screen
  late _StartState state;
  _Controller(this.state);

  void signin() {
    FormState? currentState = state.formKey.currentState;
    if (currentState == null) return; 
    if (!currentState.validate()) return; 
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'No email provided';
    } else if (!(value.contains('@') && value.contains('.'))) {
      return 'Not valid email address';
    } else {
      return null; 
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty){
      return 'No password provided';
    } else if (value.length < 6) {
      return 'Password too short';
    } else {
      return null; 
    }
  }
}
