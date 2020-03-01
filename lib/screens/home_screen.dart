import 'package:cobranza/models/provide/i18n.dart';
import 'package:cobranza/models/tabIcon_data.dart';
import 'package:cobranza/screens/card_screen.dart';
import 'package:cobranza/screens/cliente_screen.dart';
import 'package:cobranza/screens/cobranza_screen.dart';
import 'package:cobranza/screens/configuracion_screen.dart';
import 'package:cobranza/screens/perfil_screen.dart';
import 'package:cobranza/views/bottom_bar_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: Colors.transparent,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = CobranzaScreen(/*animationController: animationController*/);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBar(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor
            ])),
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  AppBar appBar() {
    return AppBar(
      leading: Icon(
        Icons.account_balance,
        color: Theme.of(context).primaryColorLight,
      ),
      title: Text(
        "Cobranza",
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: Theme.of(context).primaryColorLight),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          color: Theme.of(context).primaryColorLight,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfiguracionScreen(),
                fullscreenDialog: false,
              ),
            );
          },
        ),

        InkWell(
          borderRadius: BorderRadius.circular(25),
          child: CircleAvatar(
            radius: 17,
            backgroundColor: Theme.of(context).primaryColorLight,
            child: ClipOval(
              child: Image.asset(
                "assets/images/if_1_avatar_2754574.png",
                fit: BoxFit.contain,
                scale: 2.2,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PerfilScreen(),
                fullscreenDialog: false,
              ),
            );
          },
        ),
        SizedBox(
          width: 10,
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = CobranzaScreen(
                      /*animationController: animationController*/);
                });
              });
            } else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      CardScreen(/*animationController: animationController*/);
                });
              });
            } else if (index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = ClienteScreen(
                      /*animationController: animationController*/);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
