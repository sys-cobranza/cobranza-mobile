import 'package:cobranza/models/entity/venta_entity.dart';
import 'package:cobranza/models/provide/i18n.dart';
import 'package:cobranza/models/repository/venta_repository.dart';
import 'package:cobranza/screens/finanza_screen.dart';
import 'package:cobranza/utils/util.dart';
import 'package:cobranza/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CobranzaScreen extends StatefulWidget {
  @override
  _CobranzaState createState() => _CobranzaState();
}

class _CobranzaState extends State<CobranzaScreen> {
  StateFlag _loadingCobros = StateFlag.idle;
  StateFlag _loadingOtros = StateFlag.idle;
  List<VentaEntity> _cobroEntity = [];
  List<VentaEntity> _otroCobroEntity = [];
  VentaTotal _cobroTotal;

  @override
  void initState() {
    super.initState();
    _loadTotal();
    _loadCobros();
    _loadOtrosCobros();
  }

  Future<void> _loadTotal() async {
    return VentaRepository.getCobrototal().then((cobros) {
      if (mounted) {
        setState(() {
          this._cobroTotal = cobros;
        });
      }
    }).catchError((e) {
      if (mounted) {
        this._cobroTotal = null;
      }
    });
  }

  Future<void> _loadOtrosCobros() async {
    if (_loadingOtros == StateFlag.loading) return Future;
    if (mounted) {
      setState(() {
        _loadingOtros = StateFlag.loading;
      });
    }
    return VentaRepository.getOtrosCobros().then((cobros) {
      if (mounted) {
        setState(() {
          _loadingOtros = StateFlag.complete;
          this._otroCobroEntity = cobros;
        });
      }
    }).catchError((e) {
      if (mounted) {
        _loadingOtros = StateFlag.error;
        this._otroCobroEntity = [];
      }
      Util.showToast("Cobros de ayer no Registrados");
    });
  }

  Future<void> _loadCobros() async {
    if (_loadingCobros == StateFlag.loading) return Future;
    _loadingCobros = StateFlag.loading;
    if (mounted) {
      setState(() {});
    }
    return VentaRepository.getCobros().then((cobros) {
      if (mounted) {
        setState(() {
          _loadingCobros = StateFlag.complete;
          this._cobroEntity = cobros;
        });
      }
    }).catchError((e) {
      if (mounted) {
        setState(() {
          _loadingCobros = StateFlag.error;
          this._cobroEntity = [];
        });
      }
      Util.showToast(S.current.refreshFailedCheckNetwork);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 5),
              child: FinanzaScreen(this._cobroTotal)),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 245, 248, 0.96),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Cobros Realizados",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                                color: Theme.of(context)
                                    .primaryColorDark
                                    .withOpacity(0.8)),
                          ),
                          Text(
                            "Ver Todo",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Theme.of(context)
                                    .primaryColorDark
                                    .withOpacity(0.6)),
                          )
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    _espacioBody(10, this._cobroEntity.length),
                    _titleCobros(context, "HOY", this._cobroEntity.length),
                    _espacioBody(10, this._cobroEntity.length),
                    _cobrosRealizados(context),
                    _espacioBody(16, this._otroCobroEntity.length),
                    _titleCobros(context, "AYER", this._otroCobroEntity.length),
                    _espacioBody(10, this._otroCobroEntity.length),
                    _otroCobrosRealizados(context),
                    SizedBox(
                      height: 50,
                    ),
                    //now expense
                  ],
                ),
              ),
            ),
          ),
          //draggable sheet
        ],
      ),
    );
  }

  Widget _otroCobrosRealizados(BuildContext context) {
    DateFormat dateFormat = DateFormat('hh:mm a');
    if (_loadingOtros == StateFlag.loading) {
      return Container(
        child:  Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              Text("Por favor espere..."),
            ],
          ),
        ),
      );
    } else if (_loadingCobros == StateFlag.error) {
      return LoadingView(
        StateFlag.error,
        onRetry: () {
          this._loadCobros();
        },
      );
    } else {
      return ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 5,
                color: Color.fromRGBO(243, 245, 248, 1),
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        child: Icon(
                          Icons.money_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        padding: EdgeInsets.all(12),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${this._otroCobroEntity[index].nombre} ${this._otroCobroEntity[index].apellidos}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            Text(
                              '${this._otroCobroEntity[index].descripcion}',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "+ ${this._otroCobroEntity[index].montoCobro}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.orange),
                          ),
                          Text(
                            S.current.createdAt(dateFormat.format(
                                DateTime.parse(
                                    this._otroCobroEntity[index].fecha))),
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              shrinkWrap: true,
              itemCount: this._otroCobroEntity.length,
              padding: EdgeInsets.all(0),
              controller: ScrollController(keepScrollOffset: false),
            );
    }
  }

  Widget _cobrosRealizados(BuildContext context) {
    DateFormat dateFormat = DateFormat('hh:mm a');
    if (_loadingOtros == StateFlag.loading) {
      return Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              Text("Por favor espere..."),
            ],
          ),
        ),
      );
    } else if (_loadingCobros == StateFlag.error) {
      return LoadingView(
        StateFlag.error,
        onRetry: () {
          _loadOtrosCobros();
        },
      );
    } else {
      return ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 5,
                color: Color.fromRGBO(243, 245, 248, 1),
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        child: Icon(
                          Icons.monetization_on,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        padding: EdgeInsets.all(12),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${this._cobroEntity[index].nombre} ${this._cobroEntity[index].apellidos}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            Text(
                              '${this._cobroEntity[index].descripcion}',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "+ ${this._cobroEntity[index].montoCobro}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColorDark),
                          ),
                          Text(
                            S.current.createdAt(dateFormat.format(
                                DateTime.parse(
                                    this._cobroEntity[index].fecha))),
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              shrinkWrap: true,
              itemCount: this._cobroEntity.length,
              padding: EdgeInsets.all(0),
              controller: ScrollController(keepScrollOffset: false),
            );
    }
  }

  Widget _titleCobros(BuildContext context, String text, int height) {
    return height > 0
        ? Container(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor.withOpacity(0.6)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
          )
        : SizedBox(
            height: 0,
          );
  }

  Widget _espacioBody(double height, int sizeBox) {
    return sizeBox > 0
        ? SizedBox(
            height: height,
          )
        : SizedBox(
            height: 0,
          );
  }
}
