import 'package:fordevs/domain/entities/entities.dart';

class RemoteAccountModel {
  final String accessToken;

  RemoteAccountModel(this.accessToken);

  factory RemoteAccountModel.fromJson(Map json) =>
      RemoteAccountModel(json['accessToken']);

  //retorna 
  AccountEntity toEntity() => AccountEntity(accessToken);
}
