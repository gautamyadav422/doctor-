import 'package:json_annotation/json_annotation.dart';

part 'country_response.g.dart';

@JsonSerializable()
class CountryResponse {

  CountryResponse({
    this.count = 0,
    this.results,
});

  final int count;

  final List<Country>? results;

  factory CountryResponse.fromJson(Map<String, dynamic> json) => _$CountryResponseFromJson(json);
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