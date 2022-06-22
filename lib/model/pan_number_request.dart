import 'package:json_annotation/json_annotation.dart';

part 'pan_number_request.g.dart';

@JsonSerializable()
class PANVerifyRequest {
  PANVerifyRequest({
    required this.pan,
  });

  final String pan;

  Map<String, dynamic> toJson() => _$PANVerifyRequestToJson(this);

}
