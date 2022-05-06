import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gmoney/api/bloc_provider.dart';
import 'package:gmoney/models/cardsListModel.dart';
import 'package:gmoney/models/my_bills_model.dart';
import 'package:gmoney/models/processing_fee_model.dart';
import 'package:gmoney/models/processing_id_res.dart';
import 'package:rxdart/rxdart.dart';

import '../../api/web_service_client.dart';
import '../../util/utils.dart';

class MyBillsBloc implements BlocBase {
  List<CardsListModel> myCards = [
    CardsListModel(cardNumber: "3455 XXXX XXXX 2423", index: 0, cardImg: ""),
    CardsListModel(cardNumber: "7485 XXXX XXXX 5443", index: 1, cardImg: ""),
    CardsListModel(cardNumber: "8475 XXXX XXXX 9423", index: 2, cardImg: ""),
  ];
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  var _myBillsCont = BehaviorSubject<MyBillsModel>();

  Stream<MyBillsModel> get getMyBillsData => _myBillsCont.stream;

  Sink<MyBillsModel> get updateMyBillsData => _myBillsCont.sink;

  var _myBillsProcessingCont = BehaviorSubject<ProcessingFeeRes>();

  Stream<ProcessingFeeRes> get getMyBillsProcessingData =>
      _myBillsProcessingCont.stream;

  Sink<ProcessingFeeRes> get updateMyBillsProcessingData =>
      _myBillsProcessingCont.sink;

  var _myBillsProcessingIdCont = BehaviorSubject<ProcessingIdRes>();

  Stream<ProcessingIdRes> get getMyBillsProcessingIdData =>
      _myBillsProcessingIdCont.stream;

  Sink<ProcessingIdRes> get updateMyBillsProcessingIDData =>
      _myBillsProcessingIdCont.sink;

  var _policyCheckBoxCont = BehaviorSubject<bool?>();

  Stream<bool?> get getPolicyCheckBox => _policyCheckBoxCont.stream;

  Sink<bool?> get updatePolicyCheckBox => _policyCheckBoxCont.sink;

  MyBillsBloc() {
    getBillsDataApi();
    getBillsProcessingDataApi();
  }

  //Get Processing Id Details
  Future getProcessingIdDetails(
      Map<String, dynamic> parameters, String id) async {
    return WebServiceClient.getProcessingIdService(parameters, id)
        .then((response) async {
      if (response is WebError) {
        switch (response) {
          case WebError.INTERNAL_SERVER_ERROR:
            {
              Utils.showErrorMessage(
                  "Unable to reach server. Please check connection.");
              break;
            }
          case WebError.ALREADY_EXIST:
            {
              Utils.showErrorMessage(
                  "This email or phone number is already registered.");
              break;
            }
          case WebError.NOT_FOUND:
            {
              Utils.showErrorMessage(
                  "This email or phone number is already registered.");
              break;
            }
          default:
            Utils.showErrorMessage(
                "Something went unexpectedly wrong. Please try again later");
            break;
        }
        return false;
      } else {
        print("json.decode(response)");

        var idDataRes = ProcessingIdRes.fromJson(
            json.decode(json.encoder.convert(response)));
        updateMyBillsProcessingIDData.add(idDataRes);
        return idDataRes;
      }
    }).catchError((e) {
      print(e);
      Utils.showErrorMessage("Error. Please try again");
    });
  }

  Future getBillsDataApi() async {
    return WebServiceClient.getBillsPresented({}).then((response) async {
      if (response is WebError) {
        switch (response) {
          case WebError.INTERNAL_SERVER_ERROR:
            {
              Utils.showErrorMessage(
                  "Unable to reach server. Please check connection.");
              break;
            }
          case WebError.ALREADY_EXIST:
            {
              Utils.showErrorMessage(
                  "This email or phone number is already registered.");
              break;
            }
          case WebError.NOT_FOUND:
            {
              Utils.showErrorMessage(
                  "This email or phone number is already registered.");
              break;
            }
          default:
            Utils.showErrorMessage(
                "Something went unexpectedly wrong. Please try again later");
            break;
        }
        return false;
      } else {
        var _data = MyBillsModel.fromJson(response);
        updateMyBillsData.add(_data);
        return true;
      }
    }).catchError((e) {
      Utils.showErrorMessage("Error. Please try again $e");
    });
  }

  Future getBillsProcessingDataApi() async {
    return WebServiceClient.getBillsProcessingPresented({})
        .then((response) async {
      if (response is WebError) {
        switch (response) {
          case WebError.INTERNAL_SERVER_ERROR:
            {
              Utils.showErrorMessage(
                  "Unable to reach server. Please check connection.");
              break;
            }
          case WebError.ALREADY_EXIST:
            {
              Utils.showErrorMessage(
                  "This email or phone number is already registered.");
              break;
            }
          case WebError.NOT_FOUND:
            {
              Utils.showErrorMessage(
                  "This email or phone number is already registered.");
              break;
            }
          default:
            Utils.showErrorMessage(
                "Something went unexpectedly wrong. Please try again later");
            break;
        }
        return false;
      } else {
        print('decoding');
        var _data = ProcessingFeeRes.fromJson(response);
        updateMyBillsProcessingData.add(_data);
        return true;
      }
    }).catchError((e) {
      Utils.showErrorMessage("Error. Please try again $e");
    });
  }

  Future updateBillsStatus(Map<String, dynamic> _map) async {
    return await WebServiceClient.submitOffer(_map).then((response) async {
      if (response is WebError) {
        switch (response) {
          case WebError.INTERNAL_SERVER_ERROR:
            {
              Utils.showErrorMessage(
                  "Unable to reach server. Please check connection.");
              break;
            }
          case WebError.ALREADY_EXIST:
            {
              Utils.showErrorMessage(
                  "This email or phone number is already registered.");
              break;
            }
          case WebError.NOT_FOUND:
            {
              Utils.showErrorMessage(
                  "This email or phone number is already registered.");
              break;
            }
          default:
            Utils.showErrorMessage(
                "Something went unexpectedly wrong. Please try again later");
            break;
        }
        return false;
      } else {
        Utils.showSuccessMessage(response["data"].toString());
        return true;
      }
    }).catchError((e) {
      Utils.showErrorMessage("Error. Please try again $e");
    });
  }

  @override
  void dispose() {
    _myBillsProcessingIdCont.close();
    _myBillsProcessingCont.close();
    _myBillsCont.close();
    // TODO: implement dispose
  }
}

MyBillsBloc myBillsBloc = MyBillsBloc();
