
import 'dart:convert';
import 'dart:developer';

import 'package:gmoney/api/bloc_provider.dart';
import 'package:gmoney/models/CartData.dart';
import 'package:gmoney/models/get_cart_items.dart';
import 'package:gmoney/models/group_buy_models/brand_model.dart';
import 'package:gmoney/models/group_buy_models/category_model.dart';
import 'package:gmoney/models/group_buy_models/products_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../api/web_service_client.dart';
import '../../models/group_buy_models/check_out_res.dart';
import '../../util/utils.dart';

class ProductsBloc implements BlocBase {


  var _productsCont = BehaviorSubject<ProductsModel>();
  Stream<ProductsModel> get getProductsData => _productsCont.stream;
  Sink<ProductsModel> get updateProductsData => _productsCont.sink;

  var _checkoutCont = BehaviorSubject<CheckOutRes>();
  Stream<CheckOutRes> get getCheckoutData => _checkoutCont.stream.asBroadcastStream();
  Sink<CheckOutRes> get updateCheckoutData => _checkoutCont.sink;



  var _categoryCont = BehaviorSubject<CategoryRes>();

  Stream<CategoryRes> get getCategoryData => _categoryCont.stream;

  Sink<CategoryRes> get updateCategoryData => _categoryCont.sink;



  var _brandsCont = BehaviorSubject<BrandRes>();

  Stream<BrandRes> get getBrandsData => _brandsCont.stream;

  Sink<BrandRes> get updateBrandsData => _brandsCont.sink;

  var _visibilityCont = BehaviorSubject<int>();

  Stream<int> get getVisibilityData => _visibilityCont.stream.asBroadcastStream();

  Sink<int> get updateVisibilityData => _visibilityCont.sink;

  /// cart
  var _cartCont = BehaviorSubject<CartItems>();
  Stream<CartItems> get getCartData => _cartCont.stream.asBroadcastStream();
  Sink<CartItems> get updateCartData => _cartCont.sink;


/*  ProductsBloc() {
   getProducts();
  }*/



  Future getProducts(Map<String,dynamic> data) async {
    print('calling API getProducts');
    return WebServiceClient.hitProductsApi(data).then((response) async {
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
        print('else response');
        print(response);
        try{
          var _data = ProductsModel.fromJson(response);
          print("parsing successful");
          await getCartItems("9920641456");
          print("parsing successful");
          print("evenet >>>>>>>>>>>>> ${false}");
        await  getCartData.listen((event) {
          print("evenet >>>>>>>>>>>>> ${event.data!.first.lineItems!.length}");
            for (var element1 in event.data!.first.lineItems!){
              _data.data!.forEach((element) {
                if(element.products!.id==element1.productId){
                  var index=_data.data!.indexOf(element);
                  print("evenet >< >${element.products!.isAdded}");
                  _data.data![index].products!.isAdded = true;
                  _data.data![index].products!.units =
                  element1.quantity;
                }
              });
            }

          });
        // _data.data!.forEach((element) {
        //   print("evenet >< >${element.products!.isAdded}");
        // });

          updateProductsData.add(_data);
          return true;
        }catch(e){
          print("parsing failed");
          print(e);
          return false;
        }

      }
    }).catchError((e) {
      Utils.showErrorMessage("Error. Please try again $e");
    });
  }

  Future addToCartApi(Map<String,dynamic> data) async {
    return WebServiceClient.hitAddToCart(data).then((response) async {
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
        print("reply form api is >> ${response['status']}");
        if(response['status'] == true){
          Utils.showSuccessMessage("Successfully Added");
          return true;
        }else{
          Utils.showErrorMessage("${response['message']}");
          return false;
        }
      }
    }).catchError((e) {
      Utils.showErrorMessage("Error. Please try again $e");
    });
  }

  Future removeCartItem(String phoneNumber, String variantId) async {
    return WebServiceClient.hitRemoveFromCart({"phone": "$phoneNumber"},variantId).then((response) async {
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
        Utils.showSuccessMessage("Item Successfully Removed");
        return true;
      }
    }).catchError((e) {
      Utils.showErrorMessage("Error. Please try again $e");
    });
  }

  Future putCheckOut(Map<String,dynamic> data) async {
    print('calling API');
    return WebServiceClient.hitCheckOutApi(data).then((response) async {
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
        print('else response');
        print(response);
        try{
          var _data = CheckOutRes.fromJson(response);
          print("parsing successful");
          updateCheckoutData.add(_data);
          Utils.showSuccessMessage("Checked out Successfully");
          return true;
        }catch(e){
          print("parsing failed");
          print(e);
          return false;
        }

      }
    })/*.catchError((e) {
      Utils.showErrorMessage("Error. Please try again $e");
    })*/;
  }

  Future getCartItems(String phone) async {
    print('calling API');
    return WebServiceClient.getCartApi(phone).then((response) async {
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
        print('else response');
        log(jsonEncode(response));
        var _data = CartItems.fromJson(json.decode(json.encode(response)));
        print("_datamkm");
        print(_data);
        updateCartData.add(_data);
        return true;
      }
    })/*.catchError((e) {
      Utils.showErrorMessage("Error. Please try again $e");
    })*/;
  }

  Future clearCart(Map<String,dynamic> data) async {
    print('calling API');
    return WebServiceClient.clearCartApi(data).then((response) async {
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
        print('else response');
        log(jsonEncode(response));
        var _data = CartItems.fromJson((response));
        print("_data");
        print(_data);
        updateCartData.add(_data);
        return true;
      }
    })/*.catchError((e) {
      Utils.showErrorMessage("Error. Please try again $e");
    })*/;
  }


  Future getCategory() async {
    return WebServiceClient.hitCategoryApi({}).then((response) async {
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
        var _data = CategoryRes.fromJson(response);
        updateCategoryData.add(_data);
        return true;
      }
    })/*.catchError((e) {
      Utils.showErrorMessage("Error. Please try again $e");
    })*/;
  }

  Future getBrands() async {
    return WebServiceClient.hitBrandsApi({}).then((response) async {
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
        var _data = BrandRes.fromJson(response);
        updateBrandsData.add(_data);
        return true;
      }
    })/*.catchError((e) {
      Utils.showErrorMessage("Error. Please try again $e");
    })*/;
  }
  @override
  void dispose() {
    _productsCont.close();
    _visibilityCont.close();
    _brandsCont.close();
    _categoryCont.close();
    // TODO: implement dispose
  }
}

ProductsBloc productsBloc = ProductsBloc();
