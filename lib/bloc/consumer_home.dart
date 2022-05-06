import 'package:gmoney/api/bloc_provider.dart';
import 'package:gmoney/api/web_service_client.dart';
import 'package:gmoney/models/consumer_home_model.dart';
import 'package:gmoney/models/faq_res_model.dart';
import 'package:gmoney/models/fetch_card_number.dart';
import 'package:gmoney/models/mandate_url_res.dart';
import 'package:gmoney/models/notification_res.dart';
import 'package:gmoney/util/utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/policy_offerId_model.dart';




class ConsumerHome extends BlocBase{

  bool cardNumberToggle = true;




  var _homeDataCont = BehaviorSubject<ConsumerHomeModel>();
  Stream<ConsumerHomeModel> get homeData => _homeDataCont.stream;
  Sink<ConsumerHomeModel> get updateHomeData => _homeDataCont.sink;


  var _notificationDataCont = BehaviorSubject<NotificationRes>();
  Stream<NotificationRes> get notificationData => _notificationDataCont.stream;
  Sink<NotificationRes> get updateNotificationData => _notificationDataCont.sink;

  var _imgPath = BehaviorSubject<String?>();
  Stream<String?> get getImgPath => _imgPath.stream;
  Sink<String?> get updateImgPath => _imgPath.sink;

  var _imgPathBack = BehaviorSubject<String?>();
  Stream<String?> get getImgPathBack => _imgPathBack.stream;
  Sink<String?> get updateImgPathBack => _imgPathBack.sink;

  var _imgPathCurrent = BehaviorSubject<String?>();
  Stream<String?> get getImgPathCurrent => _imgPathCurrent.stream;
  Sink<String?> get updateImgPathCurrent => _imgPathCurrent.sink;
  var _imgPathPolicy = BehaviorSubject<List<String?>>();
  Stream<List<String?>> get getImgPathPolicy  => _imgPathPolicy.stream;
  Sink<List<String?>> get updateImgPathPolicy  => _imgPathPolicy.sink;
  var _imgPathConsult = BehaviorSubject<List<String?>>();
  Stream<List<String?>> get getImgPathConsult => _imgPathConsult.stream;
  Sink<List<String?>> get updateImgPathConsult => _imgPathConsult.sink;

  var _imgPathBankStatements = BehaviorSubject<List<String?>>();
  Stream<List<String?>> get getImgPathBankStatements => _imgPathBankStatements.stream;
  Sink<List<String?>> get updateImgPathBankStatements => _imgPathBankStatements.sink;

  var _faqToggle = BehaviorSubject<bool>();
  Stream<bool> get getFaqToggle => _faqToggle.stream;
  Sink<bool> get updateFaqToggle => _faqToggle.sink;

  var _currentIndex = BehaviorSubject<int>();
  Stream<int> get getCurrentIndex => _currentIndex.stream.asBroadcastStream();
  Sink<int> get updateCurrentIndex => _currentIndex.sink;

  var _tcHtml = BehaviorSubject<String?>();
  Stream<String?> get getTCHtmlStream => _tcHtml.stream;
  Sink<String?> get getTCHtmlSink => _tcHtml.sink;

  var _faqRes = BehaviorSubject<FaqRes>();
  Stream<FaqRes> get getFaqRseStream => _faqRes.stream;
  Sink<FaqRes> get getFaqRseSink => _faqRes.sink;

  var _offerIdPolicy = BehaviorSubject<PolicyOfferId>();
  Stream<PolicyOfferId> get getOfferIdPolicy => _offerIdPolicy.stream;
  Sink<PolicyOfferId> get updateOfferIdPolicy => _offerIdPolicy.sink;

  var _cardNumberCont = BehaviorSubject<String>();
  Stream<String> get getCardNumber => _cardNumberCont.stream;
  Sink<String> get updateCardNumber => _cardNumberCont.sink;



  ConsumerHome(){
    getConsumerHomeData();
  }

  int getCount(List<CardActiveChecks> _data){
    var count = -1;
    for(int i=0;i<5;i++){
      if(_data[i].uploaded == true){
        count++;
      }
    }
    return count;
  }
  toggleEyeButton(String token){
    if(cardNumberToggle){
      cardNumberGet(token);
      cardNumberToggle = false;
    }else{
      updateCardNumber.add("");
      cardNumberToggle = true;
    }
  }

  Future getConsumerHomeData() async {
    return WebServiceClient.consumerHomeData({}).then((response) async {
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
        var parsedResponse = ConsumerHomeModel.fromJson(response);
        updateHomeData.add(parsedResponse);
        return true;
      }
    }).catchError((e) {
      Utils.showErrorMessage("Error. Please try again");
    });
  }
  Future getNotificationData() async {
    return WebServiceClient.notificationData({}).then((response) async {
      print('notify');
      print(response);
      print(response is WebError);
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
            print('default running');
            Utils.showErrorMessage(
                "Something went unexpectedly wrong. Please try again later");
            break;
        }
        return false;
      } else {
        print('notify 2');
        var parsedResponse = NotificationRes.fromJson(response);
        updateNotificationData.add(parsedResponse);
        return true;
      }
    }).catchError((e) {
      Utils.showErrorMessage("Error. Please try again");
    }).onError((error, stackTrace) {
      print('notify 3');
      return false;
    });
  }
  Future notificationReadStatus(String _id) async {
    return WebServiceClient.notificationStatusApi({},_id).then((response) async {
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

      }
    }).catchError((e) {
      Utils.showErrorMessage("Error. Please try again");
    });
  }

  Future getTCHtmlData() async {
    return WebServiceClient.getTCService(Map<String, dynamic>()).then((response) async {
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
        var parsedResponse = MandateUrlRes.fromJson(response);
        getTCHtmlSink.add(parsedResponse.data!);
        return true;
      }
    }).catchError((e) {
      Utils.showErrorMessage("Error. Please try again");
    });
  }
  Future getFaqData() async {
    return WebServiceClient.getFaqService(Map<String, dynamic>()).then((response) async {
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
        var parsedResponse = FaqRes.fromJson(response);
        getFaqRseSink.add(parsedResponse);
        return true;
      }
    }).catchError((e) {
      Utils.showErrorMessage("Error. Please try again");
    });
  }
  Future cardNumberGet(String cardToken) async {
    return WebServiceClient.fetchCardNumber({},cardToken).then((response) async {
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
        var parsedResponse = FetchCardNumber.fromJson(response);
        updateCardNumber.add(parsedResponse.data!);
        return true;
      }
    }).catchError((e) {
      Utils.showErrorMessage("Error. Please try again");
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _homeDataCont.close();
    _notificationDataCont.close();
    _imgPath.close();
    _imgPathBack.close();
    _imgPathCurrent.close();
    _faqToggle.close();
    _tcHtml.close();
    _faqRes.close();
    _imgPathPolicy.close();
    _imgPathConsult.close();
    _offerIdPolicy.close();
    _cardNumberCont.close();
  }


}

ConsumerHome consumerHome = new ConsumerHome();