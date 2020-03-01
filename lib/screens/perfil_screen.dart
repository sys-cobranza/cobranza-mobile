import 'package:cobranza/models/entity/user_entity.dart';
import 'package:cobranza/models/provide/i18n.dart';
import 'package:cobranza/models/repository/user_repository.dart';
import 'package:cobranza/screens/login_screen.dart';
import 'package:cobranza/themes/cobranza_theme.dart';
import 'package:cobranza/utils/sp_util.dart';
import 'package:cobranza/utils/util.dart';
import 'package:cobranza/views/loading_view.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PerfilScreen extends StatefulWidget {

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<PerfilScreen> {
  var index = 0;
  StateFlag _loading = StateFlag.idle;
  UserEntity userEntity = null;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    if (_loading == StateFlag.loading) return Future;
    _loading = StateFlag.loading;
    if (mounted) {
      setState(() {});
    }
    return UserRepository.getUser().then((usuario) {
      print(usuario);
      if (mounted) {
        setState(() {
          _loading = StateFlag.complete;
          this.userEntity = usuario;
        });
      }
    }).catchError((e) {
      if (mounted) {
        setState(() {
          _loading = StateFlag.error;
          this.userEntity = null;
        });
      }
      Util.showToast(S.current.refreshFailedCheckNetwork);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: Icon(CommunityMaterialIcons.close_circle),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height*.1,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/if_1_avatar_2754574.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  '${userEntity?.persona?.nombre} ${userEntity?.persona?.apellidos}',
                  style: TextStyle(
                      fontFamily: CobranzaTheme.fontName,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColorLight),
                ),
                SizedBox(height: 25),
                SizedBox(
                  height: 35,
                  width: 300,
                  child: FlatButton(
                    color: Theme.of(context).primaryColorLight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).primaryColor,
                          size: 16,
                        ),
                        Expanded(
                          child: Text(
                            "${userEntity?.persona?.direccion}",
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Usuario",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 18, start: 50),
                            child:
                                Icon(Icons.chevron_right, color: Colors.white),
                          ),
                        ),
                        style: TextStyle(
                            fontFamily: CobranzaTheme.fontName,
                            color: Colors.white,
                            fontSize: 18),
                        initialValue: "${userEntity.userName}",
                        readOnly: true,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Numero Documento",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 18, start: 50),
                            child:
                                Icon(Icons.chevron_right, color: Colors.white),
                          ),
                        ),
                        style: TextStyle(
                            fontFamily: CobranzaTheme.fontName,
                            color: Colors.white,
                            fontSize: 18),
                        initialValue: "${userEntity.persona.numeroDocumento}",
                        readOnly: true,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nombre Completo",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 18, start: 50),
                            child:
                                Icon(Icons.chevron_right, color: Colors.white),
                          ),
                        ),
                        style: TextStyle(
                            fontFamily: CobranzaTheme.fontName,
                            color: Colors.white,
                            fontSize: 18),
                        initialValue: "${userEntity.persona.nombreCompleto}",
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 140,
                  child: FlatButton(
                    color: Theme.of(context).primaryColorLight,
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                          fontFamily: CobranzaTheme.fontName,
                          color: Theme.of(context).primaryColor,
                          fontSize: 18),
                    ),
                    onPressed: () {
                      SpUtil.logout();
                      Navigator.of(context).pushReplacementNamed(LoginPage.ROUTE_NAME);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
