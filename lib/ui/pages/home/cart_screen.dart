
import 'package:flutter/material.dart';
import 'package:gmoney/bloc/group_buy/products_bloc.dart';
import 'package:gmoney/models/get_cart_items.dart';
import 'package:gmoney/models/group_buy_models/products_model.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/button_outlined.dart';
import 'package:gmoney/ui/widgets/home/rounded_card.dart';
import 'package:gmoney/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/group_buy_models/check_out_res.dart';
import '../group_buy/address_confirm.dart';


class CartScreen extends StatelessWidget {
  Widget _row(String text1, String text2) {
    return Row(
      children: [
        Expanded(
            child: Text(
              text1,
              style: TextStyles.appBlack14.copyWith(fontWeight: FontWeight.w400),
            )),
        Text(
          text2,
          style: TextStyles.appBlack18
              .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
  Widget bottomView(AsyncSnapshot<CartItems> snapshot) {
    int _totalItems = 0;
    int _totalQty = 0;
    String _totalAmt ="0";
    String _discount="0";
    if(snapshot!=null){
      snapshot.data!.data!.first.lineItems!.forEach((element) {
        _totalQty= _totalQty+element.quantity!;
      });
      _totalItems= snapshot.data!.data!.first.lineItems!.length;
      //_totalQty= snapshot.data!.data!.lineItems![0].quantity!;
      _totalAmt= snapshot.data!.data!.first.totalPrice!;
      _discount= "0.0";

    }
    /* CartItems.data!.forEach((element) {
      if(element.isAdded ?? false ){
        _totalItems++;
      }
      //_totalQty = _totalQty + element.units!;
      //_totalAmt = _totalAmt + (element.units! * double.parse(element.variants!.first.price!));
    });*/
    return RoundedCard(
        childWidget: Column(
          children: [
            _row("Total Items:", "$_totalItems"),
            SizedBox(
              height: 6,
            ),
            _row("Total Qty:", "$_totalQty"),

            // _row("Amount:", "$_totalQty"),
            Row(
              children: [
                Expanded(
                    child: RichText(
                      text: TextSpan(text: "Amount", style: TextStyles.appBlack14.copyWith(fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(text: '(Inclusive of all taxes)', style: TextStyle(fontSize: 12)),
                      ]),
                    )),
                Text(
                  "₹$_totalAmt",
                  style: TextStyles.appBlack18
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                )

              ],
            ),
            _row("Discount/Coupon:", "₹$_discount"),
            Divider(
              color: DefaultColor.blackSubText,
            ),
            _row("Total Amount:", "₹${double.parse(_totalAmt)-double.parse(_discount)}")
          ],
        ));
  }
/*

  Widget descriptionUI(BuildContext context, int index, CartItems modelData){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Column(
        children: [
          Container(height: MediaQuery.of(context).size.height/10,width:100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: DefaultColor.greyButtonColor),),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
              color: DefaultColor.greyButtonColor,),
                  child: IconButton(padding: EdgeInsets.all(2),
                    constraints: BoxConstraints(),
                    icon: Icon(Icons.remove,color: DefaultColor.appDarkBlue,),
                    onPressed: (){},)),
              Text("100",style: TextStyles.appBlack12.copyWith(fontSize: 18),),
              Container(
                  margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                    color: DefaultColor.greyButtonColor,),
                  child: IconButton(padding: EdgeInsets.all(2),
                    constraints: BoxConstraints(),
                    icon: Icon(Icons.add,color: DefaultColor.appDarkBlue,),
                    onPressed: (){},)),
            ],
          )
        ],
      ),
       SizedBox(width: 10,),
       Expanded(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(*/
/*_dataParams.merchant!.name ??*//*
 "White Hand Gloves",
               style: TextStyles.appBlack14.copyWith(fontSize: 16,color: Color(0xFF111827)),),
             SizedBox(height: 8,),
             Text("Brand: F8Wares",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: DefaultColor.blackSubText),),
             SizedBox(height: 6,),
             Text("MRP: ₹ 1050",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: DefaultColor.blackSubText),),
             SizedBox(height: 6,),
             Text("Group Buy Price: ₹ 1000",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: DefaultColor.blackSubText),),
             SizedBox(height: MediaQuery.of(context).size.height*0.01,),
             Align(
               alignment: Alignment.bottomRight,
               child: ButtonOutlined("Remove",(){}),
             )
           ],
         ),
       )
      ]
    );
  }

*/

  Widget descriptionUI(BuildContext context, int index, CartItems modelData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        index%5 == 0 ?
        Column(
          children: [
            Text("Item Unavailable",style: TextStyle(color: Colors.red, fontSize: 16),),
            SizedBox(height: 5,)
          ],
        )
            : SizedBox(height: 0,),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            children: [
            /*  modelData.data![index].image == null
                  ? Container(
                height: MediaQuery.of(context).size.height / 10,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: DefaultColor.greyButtonColor),
              )
                  :*/ Container(
                height: MediaQuery.of(context).size.height / 10,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://amsp.africa/all_media/2021/04/8.jpg"
                          /*     modelData.data![index].image == null ||
                            modelData.data![index].image!.src == null || modelData.data![index].image!.src!.isEmpty
                            ?
                            "https://amsp.africa/all_media/2021/04/8.jpg"
                            :
                        modelData.data![index].image!.src.toString()*/
                        ),
                        fit: BoxFit.fill),
                    color: DefaultColor.greyButtonColor),
              ),

            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  /*modelData.data![index]Params.merchant!.name ??*/
                  modelData.data!.first.lineItems?[index].title ??"" ,
                  style: TextStyles.appBlack14
                      .copyWith(fontSize: 16, color: DefaultColor.blueDarkLogin),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Brand: ${modelData.data!.first.lineItems?[index].vendor}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: DefaultColor.blackSubText),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "MRP: ₹ ${modelData.data!.first.lineItems?[index].price}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: DefaultColor.blackSubText),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Group Buy Price: ₹ ${modelData.data!.first.lineItems?[index].price}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: DefaultColor.blackSubText),
                ),
              ],
            ),
          )
        ]),
        SizedBox(height: 3,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: DefaultColor.greyButtonColor,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.all(2),
                      constraints: BoxConstraints(),
                      icon: Icon(
                        Icons.remove,
                        color: DefaultColor.appDarkBlue,
                      ),
                      onPressed: () async {
                        /// remove from cart api

                        if(modelData.data!.first.lineItems![index].quantity! > 1){
                          modelData.data!.first.lineItems![index].quantity = modelData.data!.first.lineItems![index].quantity! - 1 ;
                          print(modelData.data!.first.lineItems![index].quantity);
                          // if(modelData.data![index].units == 0) modelData.data![index].isAdded = false;
                          productsBloc.updateCartData.add(modelData);
                          ///
                          _map[modelData.data!.first.lineItems![index].variantId]
                          ="${modelData.data!.first.lineItems![index].quantity!}";
                          //
                          List<Map<String,dynamic>> _lineItems = [];
                          _lineItems.clear();
                          print("my map >>>>> ${_map}");
                          _map.forEach((key, value) {_lineItems.add(
                              {
                                "variant_id":key,
                                "quantity":int.parse(value)
                              }
                          );
                          });
                          print("my map >>>>> ${_lineItems}");
                          var _params = Map<String, dynamic>();
                          _params = {
                            "line_items":
                            _lineItems,
                            // "phone": _mobileNumber??"9920641456"
                            "phone": "9920641456"
                          };
                          //
                          await productsBloc.addToCartApi(_params);
                          callAPIs();
                        }
                      },
                    )),
                Text(
                  "${modelData.data!.first.lineItems?[index].quantity}",
                  style: TextStyles.appBlack12.copyWith(fontSize: 18),
                ),
                Container(
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: DefaultColor.greyButtonColor,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.all(2),
                      constraints: BoxConstraints(),
                      icon: Icon(
                        Icons.add,
                        color: DefaultColor.appDarkBlue,
                      ),
                      onPressed: () async {
                        /// add to cart API
                        if(modelData.data!.first.lineItems![index].availableQuantity == modelData.data!.first.lineItems?[index].quantity){
                          return;
                        }
                        modelData.data!.first.lineItems![index].quantity = modelData.data!.first.lineItems![index].quantity! +1 ;
                        // modelData.data![index].isAdded = true ;
                        print(modelData.data!.first.lineItems![index].quantity);
                        productsBloc.updateCartData.add(modelData);
                        ///
                        _map[modelData.data!.first.lineItems![index].variantId]
                        ="${modelData.data!.first.lineItems![index].quantity!}";
                        //
                         List<Map<String,dynamic>> _lineItems = [];
                        _lineItems.clear();
                        _map.forEach((key, value) {_lineItems.add(
                            {
                              "variant_id":key,
                              "quantity":int.parse(value)
                            }
                        );
                        });
                        var _params = Map<String, dynamic>();
                        _params = {
                          "line_items":
                          _lineItems,
                          // "phone": _mobileNumber??"9920641456"
                          "phone": "9920641456"
                        };
                        //
                        await productsBloc.addToCartApi(_params);
                        callAPIs();

                      },
                    )),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child:
              ButtonOutlined("Remove", () async {
                /// remove item from cart api
              /*  if(modelData.data![index].isAdded == true){
                  modelData.data![index].isAdded = false;
                  modelData.data![index].units = 0;
                  productsBloc.updateProductsData.add(modelData);
                }*/
                _map.remove(modelData.data!.first.lineItems![index].variantId);
               await productsBloc.removeCartItem('9920641456', modelData.data!.first.lineItems![index].variantId.toString());
               await productsBloc.getCartItems("9920641456");



              }, color: DefaultColor.appDarkBlue),
            ),
          ],
        ),
        index%5 == 1 ?
        Text("You have reached the limit of max order",style: TextStyle(color: Colors.red),)
            : SizedBox(height: 0,)
      ],
    );
  }

  final _map = Map();
  @override
  Widget build(BuildContext context) {
    callAPIs();
    // productsBloc.putCheckOut({"phone": "7307567171"});
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: SingleChildScrollView(
        child: CommonCustomBG(
            cardTopPadding: 8.5,
            widgetsOverGradient: AppBarBackArrow(title: "My Cart", onTap: ()=> Navigator.pushNamedAndRemoveUntil(context, "/HomeScreen", (route) => false)),
            isCardOnTop: false,
            screenWidgets: /*StreamBuilder<MyBillsModel>(
                stream: myBillsBloc.getMyBillsData,
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Utils.instance.loader(context);
                  }
                  return snapshot.data!.data!.isEmpty ?
                  Utils.instance.notFoundContainer("No data Found..", context) :*/
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*   ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                  return Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(bottom: 15),decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),color: Utils.getColorFromHex("#FFFFFF")
                  ),child: descriptionUI(context));
                  }),*/
                StreamBuilder<CartItems>(
                    stream: productsBloc.getCartData,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        print('no data');
                        return Utils.instance.loader(context);
                      }
                      // print('snapshot.data!.data!.first');
                      // print(snapshot.data!.data!.first);
                      return snapshot.data!.data!.isEmpty
                          ? Utils.instance
                          .notFoundContainer("No data Found..", context)
                          : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                              padding: EdgeInsets.only(top: 20, bottom: 0),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.data!.first.lineItems!.length,
                              itemBuilder: (context, index) {
                                print('snapshot.data');
                                print(snapshot.data!.data!.first.lineItems!.length);
                                return RoundedCard(
                                    childWidget:
                                    descriptionUI(context, index, snapshot.data!));
                              }),

                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),color: DefaultColor.appBarWhite
                              ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment : CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("GMEDS30",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                      SizedBox(
                                          width: 100, height: 40,
                                          child: AppButton(buttonTitle: "Apply",onTap: (){},)),

                                    ],
                                  ),
                                  Text("--------------------------------------------------------------------------------------------------------------------------------------",
                                  maxLines: 1, style: TextStyle(color: Colors.grey.shade500),),
                                  Text("Use code GMEDZ30 & get 30% off"),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          bottomView(snapshot),
                        ],
                      );
                    }),

                Text(
                  "* Shop a minimum of ₹5000 to complete your group buy order ",
                  style: TextStyle(
                      color: Color(0xFFFFA319), fontSize: 11),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 18,),
                AppButton(buttonTitle: "Proceed To Select Address",onTap: ()async{
                  var data={
                    // "phone": "${sp.getString("userMobile").toString()}"
                    "phone": "9920641456",
                    "billing_address": {
                      "zip": "40202",
                      "city": "Louisville",
                      "phone": "555-625-1199",
                      "company": null,
                      "country": "united states",
                      "default": true,
                      "address1": "Chestnut Street 92",
                      "address2": "Apartment 2",
                      "province": "Kentucky",
                      "last_name": "Norman",
                      "first_name": "Bob",
                      "country_code": "US",
                      "country_name": "United States",
                      "province_code": "KY"
                    }
                  };
                  await productsBloc.putCheckOut(data).then((value) {
                    if(value){
                      Navigator.pushReplacementNamed(context, "/MyOrders",arguments: AddressData(10, 200.0, 20.0));
                    }
                  });
                },),
                SizedBox(height: 20,)
              ],
            )
          /*})*/
        ),
      ),
    );
  }

  Future<void> callAPIs() async {
    await productsBloc.getCartItems("9920641456");

    ///
    var sp= await SharedPreferences.getInstance();

  }
}
