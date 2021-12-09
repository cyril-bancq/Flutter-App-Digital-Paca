import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/providers/auth_provider.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/utility/widgets.dart';
import 'package:provider/provider.dart';
import 'domain/user.dart';
import 'main.dart';

const digital_blue = Color(0xFF03A9F4);
const digital_blueb = Color(0xFF143D52);
const digital_green = Color(0xFF3FC25C);
const digital_yellow = Color(0xFFF2C94C);
const digital_grey = Color(0xFFBDBDBD);


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 150),
        width: 500,
        color: digital_blue,
        child: Column(
          children: [
            LoginSection(),
          ],
        ),
      ),
      ),
  );
}

class LoginSection extends StatelessWidget {
  final logoImage = "assets/images/DigitalPACA-Logo_Round_poulpe-en-haut.png";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 125,
          height: 125,
          alignment: Alignment.center,
          child: Image.asset(
              logoImage,
              width: 80,
              height: 100,
          ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        ),
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Text(
            'Se connecter:',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Container(
          child: Login(),
        )
      ],
    );
  }
}

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var  _email, _password;

  @override
  Widget build(BuildContext context) {

    AuthProvider auth = Provider.of<AuthProvider>(context);

    var doLogin = () {

      final form = _formKey.currentState;

      if(form!.validate()) {

        form.save();

        final Future<Map<String,dynamic>> respose = auth.login(_email,_password);

        respose.then((response) {
            if(response['status']) {

              User user = response['user'];

              Provider.of<UserProvider>(context, listen: false).setUser(user);
              Navigator.pushReplacementNamed(context, '/main');
            }
        });

      } else {
        Flushbar(
          title: 'Données invalides',
          message: 'Veuillez entrer des données valides',
          duration: Duration(seconds: 10),
        ).show(context);
      }
    };

    final loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        Text("Connexion en cours ... Patienter"),
      ],
    );

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 49,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              autofocus: false,
              textAlign: TextAlign.center,
              decoration: buildInputDecoration('Adresse email', Icons.email),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un email';
                }
                return null;
              },
              onSaved: (value) => _email = value,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 49,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              autofocus: false,
              textAlign: TextAlign.center,
              decoration: buildInputDecoration('Mot de passe', Icons.lock),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un mot de passe';
                }
                return null;
              },
              onSaved: (value) => _password = value,
            ),
          ),
          SizedBox(height: 20.0),
          auth.loggedInStatus == Status.Authenticating
          ?loading
          : Container(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: longButtons('Login', doLogin),
          ),
          SizedBox(height: 300)
        ],
      ),
    );
  }
}