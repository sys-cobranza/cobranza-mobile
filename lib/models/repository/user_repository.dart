import 'package:cobranza/models/api_service.dart';
import 'package:cobranza/models/entity/user_entity.dart';
import 'package:cobranza/utils/sp_util.dart';

class UserRepository {
  static Future<UserEntity> login(username, password) async {
    return ApiService.login(username, password).then((data) async {
      SpUtil.setUserName(data.userName);
      SpUtil.setUserEntity(data);
    }).then<UserEntity>((_) => getUser(forceRefresh: false));
  }

  static Future<UserEntity> getUser({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      UserEntity _entity = SpUtil.getUserEntity();
      if (_entity != null) {
        return _entity;
      } else {
        return null;
      }
    }
  }
}
