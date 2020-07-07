import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:eye_form/app/modules/eyeForm/eye_form_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class EyeFormModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => EyeForm();

  static Inject get to => Inject<EyeFormModule>.of();
}
