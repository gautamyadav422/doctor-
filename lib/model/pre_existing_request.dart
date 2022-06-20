import 'package:json_annotation/json_annotation.dart';
part 'pre_existing_request.g.dart';

@JsonSerializable()
class PreExistingCustomerRequest {
  PreExistingCustomerRequest({
    required this.phone,
    required this.source,
  });

  final String phone;
  final int source;

  Map<String, dynamic> toJson() => _$PreExistingCustomerRequestToJson(this);

}
