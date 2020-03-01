import 'package:json_annotation/json_annotation.dart';

part 'cobro_entity.g.dart';

@JsonSerializable()
class CobroEntity {

  int personaId;
  String descripcion;
  double montoCobro;
  int usuarioCreaId;
  int ventaId;

  CobroEntity(
      {
        this.descripcion,
        this.montoCobro,
        this.personaId,
        this.usuarioCreaId,
        this.ventaId
      });

  factory CobroEntity.fromJson(Map<String, dynamic> json) =>
      _$CobroEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CobroEntityToJson(this);

  @override
  String toString() {
    return '{personaId: $personaId, descripcion: $descripcion, montoCobro: $montoCobro, usuarioCreaId: $usuarioCreaId, ventaId: $ventaId}';
  }


}
