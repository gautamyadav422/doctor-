import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PanVerifyResponse{
  PanVerifyResponse({
    this.meta,
    this.data

  });
  final PanVerifyMeta? meta;
  final PanVerifyData? data;

}

@JsonSerializable()
class PanVerifyMeta{
  PanVerifyMeta({
    this.status = 0,
    this.isError= false,
    this.message
  });

  final int status;
  @JsonKey(name: 'is_error')
  final bool isError;
  final String? message;


}


@JsonSerializable()
class PanVerifyData {
  PanVerifyData({
    this.requestId ,
    this.result
  });


  final String? requestId;
  final PanResult? result;

}

@JsonSerializable()
class PanResult {
  PanResult({
    this.pan ,
    this.name
  });


  final String? pan;
  final String? name;

}