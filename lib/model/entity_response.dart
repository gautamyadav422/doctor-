
import 'package:json_annotation/json_annotation.dart';

part 'entity_response.g.dart';

@JsonSerializable()
class EntityReposnse{

  final EntityMetadata? meta;
  final List<EntityData>? data;


  EntityReposnse({
    this.meta,
    this.data,
  });

  factory EntityReposnse.fromJson(Map<String, dynamic> json) => _$EntityReposnseFromJson(json);

}

@JsonSerializable()
class EntityMetadata {

  EntityMetadata({
    this.status = 0,
    this.isError= false,
    this.message
  });

  final int status;
  @JsonKey(name: 'is_error')
  final bool isError;
  final String? message;

  factory EntityMetadata.fromJson(Map<String, dynamic> json) => _$EntityMetadataFromJson(json);

}


@JsonSerializable()
class EntityData {

  EntityData({
    this.id=0,
    this.entity,
  });
  final int id;
  @JsonKey(name: 'user_profile')
  final List<Entity>? entity;

  factory EntityData.fromJson(Map<String, dynamic> json) => _$EntityDataFromJson(json);

}


@JsonSerializable()
class Entity {

  Entity({
    this.enityName,
    this.id,
  });

  @JsonKey(name: 'profile_name')
  final String? enityName;
  @JsonKey(name: 'profile_id')
  final String? id;

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);


}