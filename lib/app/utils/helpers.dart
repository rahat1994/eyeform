import 'package:fluttertoast/fluttertoast.dart';

showErrorToast({String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      webBgColor: "#e74c3c",
      gravity: ToastGravity.TOP);
}
