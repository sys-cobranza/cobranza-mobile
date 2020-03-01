part of 'venta_entity.dart';

VentaEntity _$VentaEntityFromJson(Map<String, dynamic> json) {
  return VentaEntity(
    id: json['id'] as int,
    fecha: json['fecha'] as String,
    descripcion: json['descripcion'],
    montoCobro: json['montoCobro'],
    montoDeuda: json['montoDeuda'],
    personaId: json['personaId'] as int,
    numeroDocumento: json['numeroDocumento'],
    nombre: json['nombre'],
    apellidos: json['apellidos'],
  );
}

Map<String, dynamic> _$VentaEntityToJson(VentaEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fecha': instance.fecha,
      'descripcion': instance.descripcion,
      'montoCobro': instance.montoCobro,
      'montoDeuda': instance.montoDeuda,
      'personaId': instance.personaId,
      'numeroDocumento': instance.numeroDocumento,
      'nombre': instance.nombre,
      'apellidos': instance.apellidos,
    };

VentaTotal _$VentaTotalFromJson(Map<String, dynamic> json) {
  return VentaTotal(
    usuarioId: json['usuarioId'] as int,
    totalCobro: json['totalCobro'] as String,
  );
}

Map<String, dynamic> _$VentaTotalToJson(VentaTotal instance) =>
    <String, dynamic>{
      'usuarioId': instance.usuarioId,
      'totalCobro': instance.totalCobro,
    };
