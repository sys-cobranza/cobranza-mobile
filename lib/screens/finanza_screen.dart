import 'package:cobranza/models/entity/venta_entity.dart';
import 'package:flutter/material.dart';

class FinanzaScreen extends StatelessWidget {
  final VentaTotal ventaTotal;

  FinanzaScreen(this.ventaTotal);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.attach_money,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                    Text(
                      "${ventaTotal == null ? '0.00' : ventaTotal.totalCobro ?? '0.00'}",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                padding: EdgeInsets.all(12),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Monto Cobrado",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Theme.of(context).primaryColorLight),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Icon(
                  Icons.rotate_left,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                ),
                padding: EdgeInsets.all(12),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Operaciones",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Theme.of(context).primaryColorLight),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Icon(
                  Icons.account_balance_wallet,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                ),
                padding: EdgeInsets.all(12),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Finanzas",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Theme.of(context).primaryColorLight),
              ),
            ],
          ),
        )
      ],
    );
  }
}
