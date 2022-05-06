import 'package:gmoney/api/bloc_provider.dart';
import 'package:gmoney/models/group_buy_models/brand_model.dart';
import 'package:gmoney/models/group_buy_models/category_model.dart';
import 'package:gmoney/models/group_buy_models/products_model.dart';
import 'package:gmoney/models/partner_details_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../api/web_service_client.dart';
import '../../util/utils.dart';

class PartnersBloc implements BlocBase {
  var _partnersCont = BehaviorSubject<List<PartnerModel>>();

  Stream<List<PartnerModel>> get getPartnersData =>
      _partnersCont.stream.asBroadcastStream();

  Sink<List<PartnerModel>> get updatePartnersData => _partnersCont.sink;

  var _imgPathBankStatements = BehaviorSubject<List<String?>>();

  Stream<List<String?>> get getImgPathBankStatements =>
      _imgPathBankStatements.stream;

  Sink<List<String?>> get updateImgPathBankStatements =>
      _imgPathBankStatements.sink;

  @override
  void dispose() {
    _partnersCont.close();
    _imgPathBankStatements.close();

    // TODO: implement dispose
  }
}

PartnersBloc partnersBloc = PartnersBloc();
