import 'package:meta/meta.dart';

@immutable
class User {
  final String uid;
  String email;

  User({this.uid, this.email});
}
