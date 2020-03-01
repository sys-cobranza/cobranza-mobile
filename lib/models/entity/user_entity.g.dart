
part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
    id: json['id'] as int,
    userName: json['userName'] as String,
    password: json['password'],
    estado: json['estado'] as int,
    persona: json['persona'] == null
        ? null
        : Persona.fromJson(json['persona'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.password,
      'estado': instance.estado,
      'persona': instance.persona,
    };

Persona _$PersonaFromJson(Map<String, dynamic> json) {

 return Persona(
    id: json['id'] as int,
    numeroDocumento: json['numeroDocumento'] as String,
    nombre: json['nombre'] as String,
    apellidos: json['apellidos'] as String,
    direccion: json['direccion'] as String,
    nombreCompleto: json['nombreCompleto'] as String,
  );
}

Map<String, dynamic> _$PersonaToJson(Persona instance) => <String, dynamic>{
      'id': instance.id,
      'numeroDocumento': instance.numeroDocumento,
      'nombre': instance.nombre,
      'apellidos': instance.apellidos,
      'direccion': instance.direccion,
      'nombreCompleto': instance.nombreCompleto,
    };
