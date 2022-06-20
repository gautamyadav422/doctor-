import 'package:json_annotation/json_annotation.dart';

part 'country_response.g.dart';

@JsonSerializable()
class CountryResponse {


 final CountryMetadata? meta;
 final CountryData? data;


  CountryResponse({
    this.meta,
    this.data,
});


  factory CountryResponse.fromJson(Map<String, dynamic> json) => _$CountryResponseFromJson(json);
}

@JsonSerializable()
class CountryMetadata{

  CountryMetadata({
    this.status = 0,
    this.isError= false,
    this.message
});

  final int status;
  @JsonKey(name: 'is_error')
  final bool isError;
  final String? message;

factory CountryMetadata.fromJson(Map<String, dynamic> json) => _$CountryMetadataFromJson(json);
}

@JsonSerializable()
class CountryData {

  CountryData({
    this.count=0,
    this.results,
});
  final int count;
  final List<Country>? results;

  factory CountryData.fromJson(Map<String ,dynamic> json) => _$CountryDataFromJson(json);
}

@JsonSerializable()
class Country {

  Country({
    this.name,
    this.code = 91,
    this.id = 1,
    this.flagUrl
});

  final String? name;

  final int code;
  final int id;

  @JsonKey(name: 'flag')
  final String? flagUrl;

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

}