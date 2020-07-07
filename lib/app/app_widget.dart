import 'package:eye_form/app/modules/eyeForm/eye_form_module.dart';
import 'package:eye_form/app/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:eye_form/app/modules/home/home_module.dart';
import 'package:eye_form/routes.dart';
import 'package:provider/provider.dart';
import '../app/models/user.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: FirebaseAuthService().user,
        builder: (context, snapshot) {
          // User currentUser = Provider.of<User>(context);
          // print(snapshot);
          // if (snapshot.) {
          //   return MaterialApp(
          //     title: 'Loading...',
          //     home: Scaffold(
          //       body: Center(
          //         child: CircularProgressIndicator(),
          //       ),
          //     ),
          //   );
          // }

          return MaterialApp(
            title: 'Patient Form',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            routes: Routes().route,
            initialRoute: '/',
          );
        });
  }
}
