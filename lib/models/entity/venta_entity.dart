import 'package:json_annotation/json_annotation.dart';

part 'venta_entity.g.dart';

@JsonSerializable()
class VentaEntity {
  int id;
  int personaId;
  String fecha;
  String descripcion;
  String montoCobro;
  String montoDeuda;
  String numeroDocumento;
  String nombre;
  String apellidos;

  VentaEntity(
      {this.id,
      this.fecha,
      this.descripcion,
      this.montoCobro,
      this.montoDeuda,
      this.personaId,
      this.numeroDocumento,
      this.nombre,
      this.apellidos});

  factory VentaEntity.fromJson(Map<String, dynamic> json) =>
      _$VentaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VentaEntityToJson(this);

  @override
  String toString() {
    return '{id: $id, personaId: $personaId, fecha: $fecha, descripcion: $descripcion, montoCobro: $montoCobro, montoDeuda: $montoDeuda, numeroDocumento: $numeroDocumento, nombre: $nombre, apellidos: $apellidos}';
  }
}

@JsonSerializable()
class VentaTotal{

  int usuarioId;
  String totalCobro;

  VentaTotal({this.usuarioId, this.totalCobro});

  factory VentaTotal.fromJson(Map<String, dynamic> json) =>
      _$VentaTotalFromJson(json);

  Map<String, dynamic> toJson() => _$VentaTotalToJson(this);

  @override
  String toString() {
    return '{usuarioId: $usuarioId, totalCobro: $totalCobro}';
  }

}