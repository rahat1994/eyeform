import 'package:eye_form/app/modules/home/agenda_form.dart';
import 'package:eye_form/app/modules/home/pateint_form.dart';
import 'package:eye_form/app/services/firebase_auth_service.dart';
import 'package:eye_form/app/utils/color_constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int active = 0;
  final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 3, initialIndex: 0)
      ..addListener(() {
        setState(() {
          active = tabController.index;
        });
      });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            MediaQuery.of(context).size.width < 1300 ? true : false,
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 32),
                child: Text(
                  "Admin Material",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ),
            ]),
        actions: <Widget>[
          InkWell(
            onTap: () {
              print("download");
            },
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.cloud_download,
                    color: Colors.black,
                    size: 22,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Download Now",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'HelveticaNeue',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 32),
          Container(child: Icon(Icons.web)),
          SizedBox(width: 32),
          Container(child: Icon(Icons.account_circle)),
          SizedBox(width: 32),
          Container(
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                firebaseAuthService.signOut();
              },
            ),
          ),
          SizedBox(width: 32),
        ],
        backgroundColor: ColorConstants.blue,
        // automaticallyImplyLeading: false,
      ),
      body: Row(
        children: <Widget>[
          MediaQuery.of(context).size.width < 1300
              ? Container()
              : Card(
                  elevation: 2.0,
                  child: Container(
                      margin: EdgeInsets.all(0),
                      height: MediaQuery.of(context).size.height,
                      width: 300,
                      color: Colors.white,
                      child: listDrawerItems(false)),
                ),
          Container(
            width: MediaQuery.of(context).size.width < 1300
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width - 310,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                Text('DashBoardDashBoard'),
                PateintForm(),
                AgendaForm(),

                // Dashboard(),
                // FormMaterial(),
                // HeroAnimation(),
              ],
            ),
          )
        ],
      ),
      drawer: Padding(
          padding: EdgeInsets.only(top: 56),
          child: Drawer(child: listDrawerItems(true))),
    );
  }

  Widget listDrawerItems(bool drawerStatus) {
    return ListView(
      children: <Widget>[
        FlatButton(
          color: tabController.index == 0 ? Colors.grey[100] : Colors.white,
          //color: Colors.grey[100],
          onPressed: () {
            tabController.animateTo(0);
            drawerStatus ? Navigator.pop(context) : print("");
          },

          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: [
                Icon(Icons.dashboard),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ]),
            ),
          ),
        ),
        FlatButton(
          color: tabController.index == 1 ? Colors.grey[100] : Colors.white,
          onPressed: () {
            print(tabController.index);
            tabController.animateTo(1);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: [
                Icon(Icons.person),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Pacients",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ]),
            ),
          ),
        ),
        FlatButton(
          color: tabController.index == 2 ? Colors.grey[100] : Colors.white,
          onPressed: () {
            tabController.animateTo(2);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: [
                Icon(Icons.date_range),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Agendamentos",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
