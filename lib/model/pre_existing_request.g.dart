// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_existing_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreExistingCustomerRequest _$PreExistingCustomerRequestFromJson(
        Map<String, dynamic> json) =>
    PreExistingCustomerRequest(
      phone: json['phone'] as String,
      source: json['source'] as int,
    );

Map<String, dynamic> _$PreExistingCustomerRequestToJson(
        PreExistingCustomerRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'source': instance.source,
    };
