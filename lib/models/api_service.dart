import 'package:cobranza/models/entity/cobro_entity.dart';
import 'package:cobranza/models/entity/venta_entity.dart';
import 'package:dio/dio.dart';

import 'dio_client.dart';
import 'entity/user_entity.dart';

class ApiService {
  static Future<UserEntity> login(String userName, String password) async {
    var data = UserEntity.fromJson(
        <String, dynamic>{'userName': userName, 'password': password});
    Response<Map<String, dynamic>> response =
        await dioClient.dio.post("/usuario/login", data: data.toJson());
    if (!response.data['success']) {
      return null;
    }
    return UserEntity.fromJson(response.data["response"]);
  }

  static Future<Map<String, dynamic>> saveCobro(CobroEntity entity) async {
    Response<Map<String, dynamic>> response =
        await dioClient.dio.post("/venta/cobro/save", data: entity.toJson());
    return response.data;
  }

  static Future<List<VentaEntity>> getCobros(int pIdUsuario) async {
    Response<Map<String, dynamic>> response =
        await dioClient.dio.get("/venta/cobro/now-all/$pIdUsuario");
    if (!response.data['success']) {
      return null;
    }
    List<VentaEntity> _result = response.data["response"]
        .map<VentaEntity>((item) => VentaEntity.fromJson(item))
        .toList();
    return _result;
  }

  static Future<List<VentaEntity>> getOtrosCobros(int pIdUsuario) async {
    Response<Map<String, dynamic>> response =
        await dioClient.dio.get("/venta/cobro/not-now-all/$pIdUsuario");
    if (!response.data['success']) {
      return null;
    }
    List<VentaEntity> _result = response.data["response"]
        .map<VentaEntity>((item) => VentaEntity.fromJson(item))
        .toList();
    return _result;
  }

  static Future<VentaTotal> getCobrototal(int pIdUsuario) async {
    Response<Map<String, dynamic>> response =
        await dioClient.dio.get("/venta/cobro/now-total/$pIdUsuario");
    if (!response.data['success']) {
      return null;
    }
    return VentaTotal.fromJson(response.data["response"]);
  }

  static Future<List<VentaEntity>> filterCliente(String filter) async {
    var data = <String, dynamic>{'filter': filter};
    Response<Map<String, dynamic>> response =
        await dioClient.dio.post("/venta/deuda/cliente", data: data);
    if (!response.data['success']) {
      return null;
    }
    List<VentaEntity> _result = response.data["response"]
        .map<VentaEntity>((item) => VentaEntity.fromJson(item))
        .toList();
    return _result;
  }

/*  static Future<UserEntity> getUser(String username) async {
    Response<Map<String, dynamic>> response =
        await dioClient.dio.get("/users/$username");
    return UserEntity.fromJson(response.data);
  }*/

}
