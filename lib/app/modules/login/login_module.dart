import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:eye_form/app/modules/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LoginModule extends ModuleWidget {
  static const String routeName = '/';

  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Login();

  static Inject get to => Inject<LoginModule>.of();
}
