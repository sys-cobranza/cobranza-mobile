import 'dart:async';
import 'dart:ui';

import 'package:cobranza/models/entity/cobro_entity.dart';
import 'package:cobranza/models/entity/venta_entity.dart';
import 'package:cobranza/models/provide/i18n.dart';
import 'package:cobranza/models/repository/venta_repository.dart';
import 'package:cobranza/themes/cobranza_theme.dart';
import 'package:cobranza/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CobroScreen extends StatefulWidget {
  final VentaEntity _clienteEntity;

  CobroScreen(this._clienteEntity);

  @override
  _CobroState createState() => _CobroState();
}

class _CobroState extends State<CobroScreen>
    with SingleTickerProviderStateMixin {
  var textFormFieldController =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');
  double montoCobro = 0.0;
  String descripcion = "";

  bool _isAmountOk = false;
  bool _isDescriptionOk = false;
  bool showPageLoader = false;
  bool showSpinner = false;
  bool showChecked = false;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animationController.addListener(() {
      if (animationController.status.toString() ==
          'AnimationStatus.completed') {
        setState(() {
          showSpinner = false;
          showChecked = true;
        });
        Timer(
          Duration(seconds: 1),
          () => setState(() {
            showPageLoader = false;
            // Navigator.of(context).pop();
          }),
        );
      }
    });
    super.initState();
    textFormFieldController
        .updateValue(0.0); //double.parse(widget._clienteEntity.montoCobro)
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _startPayment() {
    var data = CobroEntity.fromJson(<String, dynamic>{
      'personaId': widget._clienteEntity.personaId,
      'ventaId': widget._clienteEntity.id,
      'descripcion': descripcion,
      'montoCobro': montoCobro,
    });

    setState(() {
      showPageLoader = true;
      // animationController.forward();
    });

    return VentaRepository.saveCobro(data).then((d) {
      if (mounted) {
        if (d['success']) {
          setState(() {
            showSpinner = true;
            animationController.forward();
          });
          Util.showToast("Cobro realizado");
          Navigator.of(context).pop(true);
        } else {
          setState(() {
            showPageLoader = false;
            showSpinner = false;
          });

          Util.showToast(
              "Error al realizar el conbro, intentalo en unos instantes");
        }
      }
    }).catchError((e) {
      if (mounted) {
        setState(() {
          showPageLoader = false;
          showSpinner = false;
          // animationController.;
        });
      }
      Util.showToast(S.current.refreshFailedCheckNetwork);
    });

    setState(() {
      showPageLoader = true;
      showSpinner = true;
      animationController.forward();
    });
  }

  Widget _showPageLoader() {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 10,
              sigmaX: 10,
            ),
            child: Container(
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
          ),
        ),
        showSpinner
            ? Align(
                alignment: Alignment.center,
                child: RotationTransition(
                  turns:
                      Tween(begin: 0.0, end: 2.0).animate(animationController),
                  child: Image.asset('assets/images/loading.png'),
                ),
              )
            : Container(),
        showChecked
            ? Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/checked.png'),
                    SizedBox(height: 25),
                    Material(
                      color: Theme.of(context).primaryColor.withOpacity(0),
                      child: Text(
                        'Transacción exitosa',
                        style: TextStyle(
                            fontFamily: CobranzaTheme.fontName,
                            fontSize: 17,
                            color: Theme.of(context).primaryColorLight),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Stack(
          children: <Widget>[
            Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),
                title: Text('Cobrar a ${widget._clienteEntity.nombre}',
                    style: TextStyle(
                        fontFamily: CobranzaTheme.fontName,
                        color: Theme.of(context).primaryColorLight)),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.height * .1,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/if_1_avatar_2754574.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        '${widget._clienteEntity.nombre} ${widget._clienteEntity.apellidos}',
                        style: TextStyle(
                            fontFamily: CobranzaTheme.fontName,
                            fontSize: 22,
                            color: CobranzaTheme.nearlyWhite,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 25,
                        child: FlatButton(
                          color: Theme.of(context).buttonColor,
                          textColor: Theme.of(context).primaryColor,
                          child: Text(
                            "${widget._clienteEntity.numeroDocumento}",
                            style: TextStyle(
                                fontFamily: CobranzaTheme.fontName,
                                color: Theme.of(context).primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Monto",
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          top: 18, start: 50),
                                      child: Icon(Icons.attach_money,
                                          color: Colors.white),
                                    ),
                                    prefixStyle: TextStyle(
                                        fontFamily: CobranzaTheme.fontName,
                                        fontSize: 18),
                                  ),
                                  controller: textFormFieldController,
                                  keyboardType: TextInputType.numberWithOptions(
                                      signed: false, decimal: true),
                                  style: TextStyle(
                                      fontFamily: CobranzaTheme.fontName,
                                      color: CobranzaTheme.nearlyWhite,
                                      fontSize: 18),
                                  onChanged: (text) {
                                    this.montoCobro = double.parse(text);
                                    _checkInputForConfirm(double.parse(text));
                                  },
                                  onSaved: (value) {
                                    this.montoCobro = double.parse(value);
                                  },
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Descripcion",
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          top: 18, start: 50),
                                      child:
                                          Icon(Icons.edit, color: Colors.white),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontFamily: CobranzaTheme.fontName,
                                      color: Colors.white,
                                      fontSize: 18),
                                  onChanged: (text) {
                                    this.descripcion = text;
                                    _checkInputForConfirm2(text);
                                  },
                                  onSaved: (value) {
                                    this.descripcion = value;
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Opacity(
                              opacity: this._isAmountOk & this._isDescriptionOk
                                  ? 1.0
                                  : 0.0,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                child: FlatButton(
                                  color: Theme.of(context).buttonColor,
                                  textColor: Theme.of(context).primaryColorDark,
                                  disabledColor: CobranzaColors.Grey,
                                  child: Text(
                                    "Cobrar",
                                    style: TextStyle(
                                        fontFamily: CobranzaTheme.fontName,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  onPressed: () => _startPayment(),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            showPageLoader ? _showPageLoader() : Container(),
          ],
        ),
      ),
    );
  }

  _checkInputForConfirm(double amount) {
    if (amount > 0.0) {
      setState(() {
        _isAmountOk = true;
      });
    } else {
      setState(() {
        _isAmountOk = false;
      });
    }
  }

  _checkInputForConfirm2(String text) {
    if (text.length > 0) {
      setState(() {
        _isDescriptionOk = true;
      });
    } else {
      setState(() {
        _isDescriptionOk = false;
      });
    }
  }
}
