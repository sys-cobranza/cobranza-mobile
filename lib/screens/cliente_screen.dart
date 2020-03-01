import 'package:cobranza/models/entity/venta_entity.dart';
import 'package:cobranza/models/provide/i18n.dart';
import 'package:cobranza/models/repository/venta_repository.dart';
import 'package:cobranza/screens/cobro_screen.dart';
import 'package:cobranza/themes/cobranza_theme.dart';
import 'package:cobranza/utils/util.dart';
import 'package:cobranza/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClienteScreen extends StatefulWidget {
  @override
  _ClienteState createState() => _ClienteState();
}

class _ClienteState extends State<ClienteScreen> {
  StateFlag _loading = StateFlag.idle;
  List<VentaEntity> _deudacliente = [];
  String filter = "";

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
    return VentaRepository.filterCliente(filter).then((clientes) {
      if (mounted) {
        setState(() {
          _loading = StateFlag.complete;
          this._deudacliente = clientes;
        });
      }
    }).catchError((e) {
      if (mounted) {
        setState(() {
          _loading = StateFlag.error;
          this._deudacliente = [];
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
            margin: EdgeInsets.only(top: 5),
            height: 40,
            child: Theme(
              data: ThemeData(
                primaryColor: Color.fromRGBO(243, 245, 248, 0.96),
                primaryColorDark: Color.fromRGBO(243, 245, 248, 0.96),
              ),
              child: TextFormField(
                autofocus: false,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    fillColor: CobranzaColors.LightGrey,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      borderSide: BorderSide(
                          color: CobranzaColors.LightGrey, width: 0.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      borderSide: BorderSide(
                          color: CobranzaColors.LightGrey, width: 0.0),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    hintText: "Buscar Cliente"),
                onEditingComplete: () {
                  _loadData();
                },
                onSaved: (value) {
                  this.filter = value;
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              // margin: EdgeInsets.only(top: 132),
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 245, 248, 0.96),
              ),
              child: _listView(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listView(BuildContext context) {
    if (_loading == StateFlag.loading) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Text("Buscando..."),
          ],
        ),
      );
    } else if (_loading == StateFlag.error) {
      return LoadingView(
        StateFlag.error,
        onRetry: () {
          this._loadData();
        },
      );
    } else {
      return ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Clientes',
              style: TextStyle(
                  fontFamily: CobranzaTheme.fontName,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Theme.of(context).primaryColorDark),
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => Divider(
              height: 5,
              color: Color.fromRGBO(243, 245, 248, 0.96),
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                          builder: (context) =>
                              CobroScreen(_deudacliente[index])),
                    )
                    .then((val) => _loadData());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor.withOpacity(0.6),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: _bodyClientes(context, _deudacliente[index]),
              ),
            ),
            shrinkWrap: true,
            itemCount: _deudacliente.length,
            padding: EdgeInsets.all(0),
            controller: ScrollController(keepScrollOffset: false),
          ),
        ],
      );
    }
  }

  Widget _bodyClientes(BuildContext context, VentaEntity cliente) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).buttonColor.withOpacity(0.7),
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: Icon(
            Icons.person_add,
            color: Theme.of(context).primaryColorDark,
          ),
          padding: EdgeInsets.all(12),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${cliente.nombre} ${cliente.apellidos}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColorDark),
              ),
              Text(
                '${cliente.numeroDocumento}',
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
              "${cliente.montoDeuda}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColorDark),
            ),
            Text(
              S.current
                  .createdAt(dateFormat.format(DateTime.parse(cliente.fecha))),
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[500]),
            ),
          ],
        ),
      ],
    );
  }
}
