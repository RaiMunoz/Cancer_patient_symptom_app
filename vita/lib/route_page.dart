import 'package:flutter/material.dart';
import 'package:vita/pages/login/login_page.dart';
import 'package:vita/pages/login/login_auth.dart';
import 'HomePage.dart';

class RoutePage extends StatefulWidget {
  RoutePage({this.auth});
  final loginAuthImplement auth;

  @override
  State<StatefulWidget> createState() => new _RoutePageState();
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_SIGNED_IN,
  SIGNED_IN,
}

class _RoutePageState extends State<RoutePage> {

  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;

  initState() {
    super.initState();
    widget.auth.getCurrentUser().then((userId) {
      setState(() {
        authStatus = userId == null ? AuthStatus.NOT_SIGNED_IN : AuthStatus.SIGNED_IN;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.SIGNED_IN;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.NOT_SIGNED_IN;
    });
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
      //return _buildWaitingScreen();
      case AuthStatus.NOT_SIGNED_IN:
        return new LoginPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.SIGNED_IN:
        return new HomePage(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
    }
  }
}