import 'package:flutter/material.dart';
import 'package:vita/pages/login/login_auth.dart';
import 'package:vita/assets/theme/theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:vita/pages/login/entry.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth,this.onSignedIn});
  final loginAuthImplement auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

// Remember that everyone should have a choice!
enum FormMode{ SIGNIN, SIGNUP}

class _LoginPageState extends State<LoginPage>
{
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormMode _formMode = FormMode.SIGNIN;

  bool failed_login=false;

  bool validateAndSave()
  {
    final form=  formKey.currentState;
    if(form.validate())
      {
        form.save();
        return true;
      }
    return false;
  }

  // Need to make sure we have the right person!
  void validateAndSubmit() async
  {

    if (validateAndSave()) {
      try {
        if (_formMode == FormMode.SIGNIN) {
          String userId = await widget.auth.signIn(_email, _password);
          print("Signed in as: $userId");
        }
        else {
          String userId = await widget.auth.signUp(_email, _password);
          print("Signed up as : $userId!");
          String userid= await widget.auth.getCurrentUser();
          final mref= FirebaseDatabase.instance.reference();
          // Need to down the list here!
          final muser= mref.child("users");
          final dentry = muser.child(userid);
          entry_submit entry_login = entry_submit(_email);

          DatabaseReference ref= dentry;

          ref.set(entry_login.toJson());
        }

        widget.onSignedIn();




      }
      catch (e) {
        print("Error: $e");
        failed_login=true;
      }
    }
  }

    void _signUp()
    {
      formKey.currentState.reset();
      setState(() {
        _formMode = FormMode.SIGNUP;
      });
    }

    void _signIn()
    {
      formKey.currentState.reset();
      setState(() {
        _formMode = FormMode.SIGNIN;
      });
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: ThemeColors.grey1,
        appBar: new AppBar(
          backgroundColor: ThemeColors.darkGreen,
          title: new Text('Vita login'),
        ),
        body: new Container(
            padding: EdgeInsets.all(16.0),
            child: new Form(
              key: formKey,
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _sizedBox(50.0),
                  _logo(),
                  _sizedBox(100.0),
                  _emailInput(),
                  _sizedBox(15.0),
                  _passwordInput(),
                  _sizedBox(30.0),
                  _submitButton(),
                  _label(),
                ],
              ),
            )));
  }

  Widget _logo() {
    return new Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        //child: Image.asset('assets/images/vita_1.png'),
        child: Container(
          padding: const EdgeInsets.only(left:50.0, right:60.0, top:60.0, bottom:60.0),
          //width: 50.0,
          //height: 50.0,
          decoration: new BoxDecoration(
            image: new DecorationImage(image: AssetImage('assets/images/vita_logo.jpeg'), fit: BoxFit.fitHeight),
          ),
        ),
      ),
    );
  }
    Widget _sizedBox(_height) {
      return new SizedBox(height: _height);
    }

    Widget _emailInput() {
      return new TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) {
          if(value.isEmpty) {
            return 'Email can\'t be empty';
          }
          else if (failed_login==true)
            {
              //Set the login flag back to try again!
              failed_login=false;
              return 'Login info is incorrect! Please try again';
            }
        },
        onSaved: (value) => _email = value,
      );
    }

    Widget _passwordInput() {
      return new TextFormField(
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value){
          if(value.isEmpty) {
            return 'Email can\'t be empty';
          }
          else if (failed_login==true)
          {
            return 'Login info is incorrect! Please try again';
          }
        },
        onSaved: (value) => _password = value,
      );
    }

    Widget _label() {
      if (_formMode == FormMode.SIGNIN) {
        return
          new FlatButton(
            child: new Text('Create an account',
                style:
                new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
            onPressed: _signUp,
          );
      } else {
        return
          new FlatButton(
            child: new Text('Have an account? Sign in',
                style:
                new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
            onPressed: _signIn,
          );
      }
    }
    Widget _submitButton() {
      if (_formMode == FormMode.SIGNIN) {
        return
          new Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: new Material(
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Colors.blueAccent.shade100,
                  elevation: 5.0,
                  child: new MaterialButton(
                    minWidth: 200.0,
                    height: 42.0,
                    color: ThemeColors.darkGreen,
                    child: new Text('Login',
                        style:
                        new TextStyle(fontSize: 20.0, color: Colors.white)),
                    onPressed: validateAndSubmit,
                  )));
      } else {
        return
          new Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: new Material(
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Colors.lightBlueAccent.shade100,
                  elevation: 5.0,
                  child: new MaterialButton(
                    minWidth: 200.0,
                    height: 42.0,
                    color: Colors.blue,
                    child: new Text('Create account',
                        style:
                        new TextStyle(fontSize: 20.0, color: Colors.white)),
                    onPressed: validateAndSubmit,
                  )));
      }
    }
  }



