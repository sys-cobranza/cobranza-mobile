import 'package:cobranza/models/api_service.dart';
import 'package:cobranza/models/entity/cobro_entity.dart';
import 'package:cobranza/models/entity/user_entity.dart';
import 'package:cobranza/models/entity/venta_entity.dart';
import 'package:cobranza/utils/sp_util.dart';

class VentaRepository {
  static Future<List<VentaEntity>> getCobros() async {
    UserEntity userEntity = SpUtil.getUserEntity();
    return ApiService.getCobros(userEntity.id);
  }

  static Future<List<VentaEntity>> getOtrosCobros() async {
    UserEntity userEntity = SpUtil.getUserEntity();
    return ApiService.getOtrosCobros(userEntity.id);
  }

  static Future<VentaTotal> getCobrototal() async {
    UserEntity userEntity = SpUtil.getUserEntity();
    return ApiService.getCobrototal(userEntity.id);
  }

  static Future<List<VentaEntity>> filterCliente(String filter) async {
    return ApiService.filterCliente(filter);
  }

  static Future<dynamic> saveCobro(CobroEntity entity) async {
    UserEntity userEntity = SpUtil.getUserEntity();
    entity.usuarioCreaId = userEntity.id;
    return ApiService.saveCobro(entity);
  }
}
