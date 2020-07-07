import 'dart:js';

import 'package:eye_form/app/models/user.dart';
import 'package:eye_form/app/modules/login/login_module.dart';
import 'package:eye_form/app/modules/register/register_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/modules/home/home_module.dart';

class Routes {
  static const home = HomeModule.routeName;
  static const login = LoginModule.routeName;
  static const register = RegisterModule.routeName;

  static Widget guardedRoute(context, Widget page) {
    User currentUser = Provider.of<User>(context);

    return (currentUser == null) ? LoginModule() : page;
  }

  static Widget nonGuarderRoutes(BuildContext context, Widget page) {
    User currentUser = Provider.of<User>(context);
    print(currentUser);
    return (currentUser == null) ? page : HomeModule();
  }

  final route = <String, WidgetBuilder>{
    Routes.login: (context) => nonGuarderRoutes(context, LoginModule()),
    Routes.register: (context) => nonGuarderRoutes(context, RegisterModule()),
    Routes.home: (context) => guardedRoute(context, HomeModule()),
  };
}
