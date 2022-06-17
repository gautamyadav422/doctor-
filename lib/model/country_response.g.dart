// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryResponse _$CountryResponseFromJson(Map<String, dynamic> json) =>
    CountryResponse(
      count: json['count'] as int? ?? 0,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryResponseToJson(CountryResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String?,
      code: json['code'] as int? ?? 91,
      id: json['id'] as int? ?? 1,
      flagUrl: json['flag'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'id': instance.id,
      'flag': instance.flagUrl,
    };
