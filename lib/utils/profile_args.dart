import 'package:cobranza/models/entity/user_entity.dart';
import 'package:cobranza/utils/string_util.dart';

class ProfileArgs {
  final UserEntity userEntity;
  final String login;
  final String heroTag;

  ProfileArgs({
    this.userEntity,
    this.login,
    this.heroTag,
  }) : assert(userEntity != null || StringUtil.isNotBlank(login));
}
