import 'package:doctor/model/entity_response.dart';
import 'package:doctor/model/pan_number_request.dart';
import 'package:doctor/provider/business_provider.dart';

class BusinessDetailsRepository {

  BusinessDetailsRepository({required this.provider});

  final BusinessDetailsProvider provider;

  ///Get Entity
  Future<List<Entity>> getEntity() async{
    return await provider.getEntity();
  }

  Future<void> panVerify(PANVerifyRequest pannumber) async{
    return await provider.panVerify(pannumber);
  }

}