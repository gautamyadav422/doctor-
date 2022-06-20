import 'package:json_annotation/json_annotation.dart';

part 'pre_existing_response.g.dart';


@JsonSerializable()
class PreExistingResponse{

  PreExistingResponse({
    this.meta,
    this.data

});

  final PreExistMeta? meta;
  final PreExistingData? data;

  factory PreExistingResponse.fromJson(Map<String, dynamic> json) => _$PreExistingResponseFromJson(json);

}

@JsonSerializable()
class PreExistMeta{
  PreExistMeta({
    this.status = 0,
    this.isError= false,
    this.message
  });

  final int status;
  @JsonKey(name: 'is_error')
  final bool isError;
  final String? message;
  factory PreExistMeta.fromJson(Map<String, dynamic> json) => _$PreExistMetaFromJson(json);


}

@JsonSerializable()
class PreExistingData{

  PreExistingData({
    this.existing_profiles,

  });

 final List<ExistingUser>? existing_profiles;
  factory PreExistingData.fromJson(Map<String, dynamic> json) => _$PreExistingDataFromJson(json);

}

@JsonSerializable()
class ExistingUser{

  ExistingUser({
    this.user_profile_name,
    this.user_type=0,
    this.is_active=false,

});

  final String? user_profile_name;
  final int? user_type;
  final bool? is_active;

  factory ExistingUser.fromJson(Map<String, dynamic> json) => _$ExistingUserFromJson(json);

}