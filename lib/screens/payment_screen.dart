import 'dart:ui';
import 'package:cobranza/themes/cobranza_theme.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<PaymentScreen> {
  var textFormFieldController =
  MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

  bool _isButtonDisabled = true;

  @override
  void initState() {
    textFormFieldController.updateValue(0.00);
    super.initState();
  }


  _checkInputForConfirm(double amount) {
    if (amount > 0.0) {
      setState(() {
        _isButtonDisabled = false;
      });
    } else {
      setState(() {
        _isButtonDisabled = true;
      });
    }
  }

  _startPayment() {
    Navigator.of(context).pop(textFormFieldController.numberValue);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Ingrese Monto',
              style: TextStyle(fontFamily: CobranzaTheme.fontName, color: CobranzaTheme.nearlyWhite),
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(CommunityMaterialIcons.close_circle,
                    color: CobranzaTheme.nearlyWhite),
                onPressed: () {
                  Navigator.of(context)
                      .pop(textFormFieldController.numberValue);
                },
              ),
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'MONTO A COBRAR',
                            style: TextStyle(fontFamily: CobranzaTheme.fontName,color: CobranzaTheme.nearlyWhite),
                          ),
                        ),
                        Spacer(flex: 1),
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 2,
                          child: TextField(
                            controller: textFormFieldController,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: false, decimal: true),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsetsDirectional.only(
                                    top: 13, start: 25),
                                child: Text(
                                  'S/.',
                                  style: TextStyle(fontSize:25,color: CobranzaTheme.nearlyWhite),
                                ),
                              ),
                              prefixStyle: TextStyle(
                                  fontFamily: CobranzaTheme.fontName, fontSize: 25),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                                fontFamily: CobranzaTheme.fontName,
                                color: CobranzaTheme.nearlyWhite,
                                fontSize: 50),
                            onChanged: (text) {
                              _checkInputForConfirm(double.parse(text));
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: FlatButton(
                        color: Theme.of(context).buttonColor,
                        textColor: Theme.of(context).primaryColorDark,
                        disabledColor: CobranzaColors.Grey,
                        child: Text(
                          "Confirmar",
                          style: TextStyle(
                              fontFamily: CobranzaTheme.fontName,
                              color: Theme.of(context).primaryColorDark,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                        ),
                        // onPressed: null,
                        onPressed:
                        _isButtonDisabled ? null : () => _startPayment(),
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
        ),
      ),
    );
  }
}
