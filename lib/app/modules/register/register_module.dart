import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:eye_form/app/modules/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RegisterModule extends ModuleWidget {
  static const routeName = '/register';
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Register();

  static Inject get to => Inject<RegisterModule>.of();
}
