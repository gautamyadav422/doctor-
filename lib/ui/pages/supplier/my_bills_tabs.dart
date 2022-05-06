import 'package:flutter/material.dart';
import 'package:gmoney/bloc/group_buy/products_bloc.dart';
import 'package:gmoney/models/group_buy_models/products_model.dart';
import 'package:gmoney/ui/pages/group_buy/filter.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/button_outlined.dart';
import 'package:gmoney/ui/widgets/home/rounded_card.dart';
import 'package:gmoney/util/utils.dart';

class MyBillsTabs extends StatefulWidget {
  const MyBillsTabs({Key? key}) : super(key: key);

  @override
  State<MyBillsTabs> createState() => _MyBillsTabsState();
}

class _MyBillsTabsState extends State<MyBillsTabs>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

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
                  showGeneralDialog(
                      context: context,
                      pageBuilder: (context, index, _) {
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

  Widget descriptionUI(
      BuildContext context, int index, ProductsModel modelData) {
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
                    fit: BoxFit.fill),
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
                      if (modelData.data![index].products!.units! > 0) {
                        modelData.data![index].products!.units =
                            modelData.data![index].products!.units! - 1;
                        if (modelData.data![index].products!.units == 0)
                          modelData.data![index].products!.isAdded = false;
                        productsBloc.updateProductsData.add(modelData);
                      }
                    },
                  )),
              Text(
                "${modelData.data![index].products!.units}",
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
                      modelData.data![index].products!.units =
                          modelData.data![index].products!.units! + 1;
                      modelData.data![index].products!.isAdded = true;
                      print(modelData.data![index].products!.units);
                      productsBloc.updateProductsData.add(modelData);
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
              "MRP: ₹ ${modelData.data!.first.products!.variants!.first.price}",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: DefaultColor.blackSubText),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "Group Buy Price: ₹ ${modelData.data!.first.products!.variants!.first.compareAtPrice}",
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
              child: ButtonOutlined(
                  modelData.data![index].products!.isAdded! ? "Added" : "Add", () {
                if (modelData.data![index].products!.isAdded == false) {
                  modelData.data![index].products!.isAdded = true;
                  modelData.data![index].products!.units = 1;
                  productsBloc.updateProductsData.add(modelData);
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
    double _totalAmt = 0;
    productsModel.data!.forEach((element) {
      if (element.products!.isAdded ?? false) {
        _totalItems++;
      }
      _totalQty = _totalQty + element.products!.units!;
      _totalAmt = _totalAmt +
          (element.products!.units! * double.parse(element.products!.variants!.first.price!));
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
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF1F1F1),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(gradient: DefaultColor.linearGradient),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  AppBarBackArrow(
                      title: "My Bills", onTap: () => Navigator.pop(context)),
                  SizedBox(height: 5,),
                  TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Colors.blue,
                    controller: _controller,
                    tabs: <Widget>[
                      Tab(
                        text: 'All EMIs',
                      ),
                      Tab(
                        text: 'Group buy',
                      ),
                      Tab(
                        text: 'Supplier Payment',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _controller,
                      children: <Widget>[
                        ListView.builder(
                            padding: EdgeInsets.only(top: 10),
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/Rectangle 4343.png"),
                                          fit: BoxFit.cover,
                                        )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(" Equipment Finance ",
                                              style:
                                                  TextStyle(color: Colors.white)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: DefaultColor.appBarWhite,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Order No: #541GE1F",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: DefaultColor
                                                          .blackSubText),
                                                ),
                                                Text(
                                                  "Delivery Date:",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: DefaultColor
                                                          .blackSubText),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "By: Tejas Tawadia",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: DefaultColor
                                                          .greyBackButton),
                                                ),
                                                Text(
                                                  "09 Feb 22",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: DefaultColor
                                                          .blackSubText),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              "Branch: Mumbai, Maharashtra",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: DefaultColor
                                                      .greyBackButton),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            vertical: 5),
                                                        child: Text(
                                                          "Invoice date: 10 Mar 2022",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: DefaultColor
                                                                  .greyBackButton),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () =>
                                                            Navigator.of(context)
                                                                .pushNamed('/GBOrderDetails'),
                                                        child: Text(
                                                          "View details",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              color: DefaultColor
                                                                  .grey),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            vertical: 5),
                                                        child: Text(
                                                          "Invoice Amount:",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: DefaultColor
                                                                  .greyBackButton),
                                                        ),
                                                      ),
                                                      Text(
                                                        "₹1,00,000",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: DefaultColor
                                                                .blackSubText),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              );
                            }),
                        Center(
                          child: Text('Tab View 2'),
                        ),
                        Center(
                          child: Text('Tab View 3'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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
