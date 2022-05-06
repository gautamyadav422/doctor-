import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gmoney/bloc/group_buy/products_bloc.dart';
import 'package:gmoney/models/group_buy_models/line_items.dart';
import 'package:gmoney/models/group_buy_models/products_model.dart';
import 'package:gmoney/ui/pages/group_buy/address_confirm.dart';
import 'package:gmoney/ui/pages/group_buy/filter.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/button_outlined.dart';
import 'package:gmoney/ui/widgets/home/rounded_card.dart';
import 'package:gmoney/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupBuyHome extends StatefulWidget {
  const GroupBuyHome({Key? key}) : super(key: key);

  @override
  State<GroupBuyHome> createState() => _GroupBuyHomeState();
}

class _GroupBuyHomeState extends State<GroupBuyHome> {




  final List<Map<String,dynamic>> _lineItems = [];
  final _map = Map();
  var _mobileNumber;

  Widget filterView(BuildContext context, ProductsModel productsModel) {
    return RoundedCard(
      childWidget: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Group Buy",
                  style: TextStyles.appBlack18,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Category: General, Diagnostic",
                  style: TextStyles.appBlack14
                      .copyWith(fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: DefaultColor.scaffoldBgWhite),
            child: IconButton(
                iconSize: 27,
                padding: EdgeInsets.all(6),
                constraints: BoxConstraints(),
                onPressed: () async {
                  await productsBloc.getBrands();
                  await productsBloc.getCategory();
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder : (context) {
                        return Filter();
                      });
                },
                icon: Icon(
                  Icons.filter_alt_outlined,
                )),
          )
        ],
      ),
      paddingBottom: 27.0,
      paddingLeft: 20.0,
      paddingRight: 20.0,
      paddingTop: 20.0,
    );
  }

  Widget descriptionUI(BuildContext context, int index, ProductsModel modelData) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(
        children: [
          Container(
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
                    fit: BoxFit.fill
                ),

                color: DefaultColor.greyButtonColor),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
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
                    onPressed: () {
                      if(modelData.data![index].products!.units! > 0){
                        modelData.data![index].products!.units = modelData.data![index].products!.units! -1 ;
                        if(modelData.data![index].products!.units! == 0) modelData.data![index].products!.isAdded = false;
                        productsBloc.updateProductsData.add(modelData);
                        /*_lineItems.add(LineItems(modelData.data![index].products!.variants!.first.id!
                            ,modelData.data![index].products!.units!));*/
                        _map[modelData.data![index].products!.variants!.first.id]
                        ="${modelData.data![index].products!.units!}";
                      }
                    },
                  )),
              Text(
                "${modelData.data![index].products!.units!}",
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
                    onPressed: () {
                      modelData.data![index].products!.units = modelData.data![index].products!.units! +1 ;
                      modelData.data![index].products!.isAdded = true ;
                      print(modelData.data![index].products!.units!);
                      productsBloc.updateProductsData.add(modelData);
                     /*_lineItems.add(LineItems(modelData.data![index].products!.variants!.first.id!
                         ,modelData.data![index].products!.units!));*/
                     _map[modelData.data![index].products!.variants!.first.id]
                     ="${modelData.data![index].products!.units!}";
                      },
                  )),
            ],
          )
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
              modelData.data![index].products!.title ?? "White Hand Gloves",
              style: TextStyles.appBlack14
                  .copyWith(fontSize: 16, color: DefaultColor.blueDarkLogin),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Brand: F8Wares",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: DefaultColor.blackSubText),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "MRP: ₹ ${modelData.data!.first.products?.variants?.first.price}",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: DefaultColor.blackSubText),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "Group Buy Price: ₹ ${modelData.data!.first.products?.variants?.first.compareAtPrice}",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: DefaultColor.blackSubText),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child:
              ButtonOutlined(modelData.data![index].products!.isAdded! ? "Remove" : "Add", () {
                if(modelData.data![index].products!.isAdded == false){
                  modelData.data![index].products!.isAdded = true;
                  modelData.data![index].products!.units = 1;
                  productsBloc.updateProductsData.add(modelData);
                  _map[modelData.data![index].products!.variants!.first.id]
                  ="${modelData.data![index].products!.units!}";
                }else{
                  if(modelData.data![index].products!.units! > 0){
                    modelData.data![index].products!.units = 0 ;
                    if(modelData.data![index].products!.units! == 0) modelData.data![index].products!.isAdded = false;
                    productsBloc.updateProductsData.add(modelData);
                    _map.remove(modelData.data![index].products!.variants!.first.id);
                  }
                  // var _params= Map<String,dynamic>();
                  // _params["phone"]=_mobileNumber??"7307567171";
                 /* EasyLoading.show();
                  productsBloc.removeCartItem(_mobileNumber.toString(),modelData.data![index].products!.variants!.first.id.toString());
                  EasyLoading.dismiss();*/
                }

              }, color: DefaultColor.appDarkBlue),
            )
          ],
        ),
      )
    ]);
  }

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

  Widget bottomView(ProductsModel productsModel) {
    int _totalItems = 0;
    int _totalQty = 0;
    double _totalAmt =0;
    productsModel.data!.forEach((element) {
      if(element.products!.isAdded! ){
        _totalItems++;
      }
      _totalQty = _totalQty + element.products!.units!;
      // _totalAmt = _totalAmt + (element.units! * double.parse(element.variants?.first.price!));
    });
    return RoundedCard(
        childWidget: Column(
          children: [
            _row("Total Items:", "$_totalItems"),
            SizedBox(
              height: 6,
            ),
            _row("Total Qty:", "$_totalQty"),
            Divider(
              color: DefaultColor.blackSubText,
            ),
            _row("Total Amount:", "₹$_totalAmt")
          ],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   hitApisAndCompare();
    getMobile();
  }

  void getMobile()async{
    var sp = await SharedPreferences
        .getInstance();
    _mobileNumber  = sp.getString("userMobile");
  }
  hitApisAndCompare()async{
    await productsBloc.getProducts({});
    // await productsBloc.getCartItems("9920641456");
    // print("evenet >>>>");
    // productsBloc.getCartData.listen((event) {
    //   print("evenet >>>> ${event.data!.first.lineItems!.first.id}");
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: SingleChildScrollView(
        child: CommonCustomBG(
            cardTopPadding: 6.5,
            widgetsOverGradient: AppBarBackArrow(
                title: "Group Buy", onTap: () => Navigator.pop(context)),
            isCardOnTop: false,
            screenWidgets:
            StreamBuilder<ProductsModel>(
                stream: productsBloc.getProductsData,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    print('no data');
                    return Utils.instance.loader(context);
                  }

                  return snapshot.data!.data==null||snapshot.data!.data!.isEmpty
                      ? Utils.instance
                      .notFoundContainer("No data Found..", context)
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      filterView(context, snapshot.data!),
                      ListView.builder(
                          padding: EdgeInsets.only(top: 0, bottom: 0),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index) {
                            return RoundedCard(
                                childWidget:
                                descriptionUI(context, index, snapshot.data!));
                          }),
                      //bottomView(snapshot.data!),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 18,
                      ),
                      AppButton(
                        buttonTitle: "Go To My Cart",
                        onTap: () async{
                          // if(_lineItems.length==0){
                          //   Utils.showErrorMessage("Please select item");
                          //   return;
                          // }
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
                          EasyLoading.show();
                          if(_lineItems.length>0){
                         await productsBloc.addToCartApi(_params).then((value) async {
                           if(value){
                            //  var sp= await SharedPreferences.getInstance();
                            //  var data={
                            //    "phone": "${sp.getString("userMobile").toString()}"
                            //  };
                            // await productsBloc.putCheckOut(data);
                             EasyLoading.dismiss();
                             Navigator.pushNamed(context, "/CartScreen");
                           }
                         });}else{
                            Utils.showNormalMessage("Please select at least one item");
                          }
                          EasyLoading.dismiss();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  );
                })
        ),
      ),
    );
  }
}

/*   showGeneralDialog(
                      context: context,
                      pageBuilder: (context, index, _) {
                        return StatefulBuilder(
                          builder: (_context, _setState){
                            return Filter(_context, _setState);
                          },
                        );
                      });*/
