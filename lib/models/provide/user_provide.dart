import 'package:cobranza/models/entity/user_entity.dart';
import 'package:flutter/widgets.dart';

class UserProvide with ChangeNotifier {
  UserEntity _userEntity;

  UserEntity get user => _userEntity;

  UserProvide();

  void updateUser(UserEntity entity) {
    this._userEntity = entity;
    notifyListeners();
  }
}
