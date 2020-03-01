import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  int id;
  String userName;
  String password;
  int estado;
  Persona persona;

  UserEntity({
    this.id,
    this.userName,
    this.password,
    this.estado,
    this.persona,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  String toString() {
    return '{id: $id, userName: $userName, password: $password, estado: $estado,persona:$persona}';
  }
}

@JsonSerializable()
class Persona {
  int id;
  String numeroDocumento;
  String nombre;
  String apellidos;
  String direccion;
  String nombreCompleto;

  Persona(
      {this.id,
      this.numeroDocumento,
      this.nombre,
      this.apellidos,
      this.direccion,
      this.nombreCompleto});

  factory Persona.fromJson(Map<String, dynamic> json) =>
      _$PersonaFromJson(json);

  Map<String, dynamic> toJson() => _$PersonaToJson(this);

  @override
  String toString() {
    return '{numeroDocumento: $numeroDocumento, nombre: $nombre, apellidos: $apellidos, direccion: $direccion}';
  }
}
