part of 'cobro_entity.dart';

CobroEntity _$CobroEntityFromJson(Map<String, dynamic> json) {
  return CobroEntity(
    personaId: json['personaId'] as int,
    ventaId: json['ventaId'] as int,
    usuarioCreaId: json['usuarioCreaId'] as int,
    descripcion: json['descripcion'] as String,
    montoCobro: json['montoCobro'] as double,
  );
}

Map<String, dynamic> _$CobroEntityToJson(CobroEntity instance) =>
    <String, dynamic>{
      'personaId': instance.personaId,
      'ventaId': instance.ventaId,
      'usuarioCreaId': instance.usuarioCreaId,
      'descripcion': instance.descripcion,
      'montoCobro': instance.montoCobro,
    };
