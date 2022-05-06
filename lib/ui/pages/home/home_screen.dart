import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:gmoney/bloc/bank_details_bloc.dart';
import 'package:gmoney/bloc/consumer_home.dart';
import 'package:gmoney/models/consumer_home_model.dart';
import 'package:gmoney/ui/pages/home/youtube_view.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/home/call_dialog.dart';
import 'package:gmoney/ui/widgets/home/group_buy_dialog.dart';
import 'package:gmoney/ui/widgets/home/navigation_drawer.dart';
import 'package:gmoney/ui/widgets/my_bill_widgets/bottom_sheet_bills.dart';
import 'package:gmoney/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // 9920641456
  // 7307567171
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final globalKey = GlobalKey<ScaffoldState>();

  bool _isBankUploaded = false;
  bool _isMandateVerified = false;
  bool _isSelfieUploaded = false;
  bool _isAadhaarUploaded = false;
  bool _isAgreementUploaded = false;
  int? indexUpdate = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hitApis();
  }

  hitApis() async {
    await bankDetailsBloc.getPolicyStatusUpdate({});
    await consumerHome.getConsumerHomeData();
  }

  int? _groupValue = 0;

  Widget _row(String title, int _index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          SizedBox(
              height: 16,
              width: 16,
              child: Radio(
                  value: _index,
                  groupValue: _groupValue,
                  onChanged: (int? val) {
                    setState(() {
                      _groupValue = val;
                    });
                  })),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyles.appBlack12.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _columnKycSteps(String text, String img, bool isVerified) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF6F6F6),
                    image: DecorationImage(image: AssetImage(img))),
              ),
              isVerified
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Image.asset("assets/images/tick.png"),
                    )
                  : Container()
            ],
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 8.5,
                fontWeight: FontWeight.w500,
                color: Utils.getColorFromHex("#373737")),
          )
        ],
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18, // 16
            color: Utils.getColorFromHex("#373737")),
      ),
    );
  }

  Widget kycWidget(BuildContext context, Data data, int currentIndex) {
    print(currentIndex);
    List<CardActiveChecks> _data = data.cards![currentIndex].cardActiveChecks!;
    //_isBankUploaded = _data.first.uploaded!;
    _isMandateVerified = _data[0].verified!;
    //_isSelfieUploaded = _data[2].uploaded!;
    _isAadhaarUploaded = _data[1].uploaded!;
    _isAgreementUploaded = _data[2].uploaded!;
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Utils.getColorFromHex("#FFFFFF"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Congratulations! You are eligible for the line of credit upto ₹${getMaxAmount(data.cards![currentIndex].limit!)} ",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: DefaultColor.appDarkBlue),
          ), //StepIndicator(key, 5,pageController),
          //StepIndicator(widget.key, 5, consumerHome.getCount(_data)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
/*
              GestureDetector(
                  onTap: () async {
                    if (!_isBankUploaded) {
                      await Navigator.pushNamed(context, "/BankDetailsScreen");
                      consumerHome.getConsumerHomeData();
                    } else {
                      Utils.instance.showToast(
                          "Bank details submitted successfully",
                          isBottom: false);
                    }
                  },
                  child: _columnKycSteps(
                      "Bank Profile", "assets/images/bank_profile.png",_data[0].verified!)),
*/
              GestureDetector(
                  onTap: () async {
                    if (_data[0].uploaded! &&
                        _data[0].verified! &&
                        !_isMandateVerified) {
                      await Navigator.pushNamed(context, "/EMandate");
                      consumerHome.getConsumerHomeData();
                    } else {
                      Utils.instance.showToast(
                          "E-mandate submitted successfully",
                          isBottom: false);
                    }
                  },
                  child: _columnKycSteps(
                      "e-Nach", "assets/images/eNach.png", _data[1].verified!)),
              /*GestureDetector(
                  onTap: () async {
                    if (!_isSelfieUploaded) {
                      await Navigator.pushNamed(context, "/TakePictureScreen");
                      consumerHome.getConsumerHomeData();
                    }
                    else {
                      Utils.instance.showToast(
                          "Selfie submitted successfully",
                          isBottom: false);
                    }
                  },
                  child: _columnKycSteps("Selfie", "assets/images/selfie.png",_data[2].uploaded!)),*/
              GestureDetector(
                  onTap: () async {
                    if (!_isAadhaarUploaded) {
                      await Navigator.pushNamed(context, "/AadhaarDetails");
                      consumerHome.getConsumerHomeData();
                    } else {
                      Utils.instance.showToast(
                          "Aadhaar details submitted successfully",
                          isBottom: false);
                    }
                  },
                  child: _columnKycSteps("Aadhaar of Signatory",
                      "assets/images/aadhar.png", _data[1].verified!)),
              GestureDetector(
                  //  onTap: () => Navigator.pushNamed(context, "/AgreementScreen"),
                  onTap: () async {
                    if (!_isAgreementUploaded) {
                      await Navigator.pushNamed(context, "/AgreementUrlScreen");
                      consumerHome.getConsumerHomeData();
                    } else {
                      Utils.instance.showToast(
                          "Agreement submitted successfully",
                          isBottom: false);
                    }
                  },
                  child: _columnKycSteps("eSign", "assets/images/agreement.png",
                      _data[2].verified!)),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Divider(),
          SizedBox(
            height: 15,
          ),
          AppButton(
            onTap: () async {
              // use switch case instead if else ladder
              print("_isAadhaarUploaded");
              print(_isAadhaarUploaded);
              /* if (!_isBankUploaded) {
                await Navigator.pushNamed(context, "/BankDetailsScreen");
                consumerHome.getConsumerHomeData();
              } else*/
              if (!_isMandateVerified) {
                await Navigator.pushNamed(context, "/EMandate");
                consumerHome.getConsumerHomeData();
              }
              /*else if (!_isSelfieUploaded) {
                await Navigator.pushNamed(context, "/TakePictureScreen");
                consumerHome.getConsumerHomeData();
              } else*/
              if (!_isAadhaarUploaded) {
                await Navigator.pushNamed(context, "/AadhaarDetails");
                consumerHome.getConsumerHomeData();
              } else if (!_isAgreementUploaded) {
                await Navigator.pushNamed(context, "/AgreementUrlScreen");
                consumerHome.getConsumerHomeData();
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Activation Done")));
              }
            },
            buttonTitle: "Activate Now",
            buttonColour: DefaultColor.appDarkBlue,
          )
        ],
      ),
    );
  }

  /// 3 strings
  Widget _groupBuy(
      {String? imagePath, String? title, String? desc, String? offer}) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      imagePath!,
                      fit: BoxFit.fitWidth,
                    ))),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15)),
                color: Utils.getColorFromHex("#FFFFFF"),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title!,
                    style: TextStyles.appBlack14,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    desc!,
                    style: TextStyles.appBlack12,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  AppButton(
                    onTap: () {
                      Navigator.pushNamed(context, "/GroupBuyHome");
                    },
                    buttonTitle: "Check Group Buy Prices",
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            decoration: BoxDecoration(
                color: Color(0xFFF9B50F),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: Text(
              offer!,
              style: TextStyles.appBlack12.copyWith(
                  fontWeight: FontWeight.w500, color: DefaultColor.appBarWhite),
            ))
      ],
    );
  }

  Widget _supplierPayments() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Utils.getColorFromHex("#FFFFFF"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/supplier_img.png"),
          Text(
            "Pay all Your Supplier Bills In 0% Interest EMI",
            style: TextStyles.appBlack14,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Pay all your bills in EMI with us. Accept Suppliers and pay them easily with GMoney.",
            style: TextStyles.appBlack12,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget insuranceOnEMI() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Utils.getColorFromHex("#FFFFFF"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/Insurance_img.png"),
          SizedBox(
            height: 15,
          ),
          Text(
            "Get Insurance On EMI",
            style: TextStyles.appBlack14,
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            "Pay all your bills in EMI with us. Accept Suppliers and pay them easily with GMoney.",
            style: TextStyles.appBlack14,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     _row("New Policy", 0,) ,
          //     _row("Existing Policy", 1)
          //   ],
          // ),
          SizedBox(
            height: 22,
          ),
          AppButton(
            onTap: () {},
            buttonTitle: "Request A Call Back",
          )
        ],
      ),
    );
  }

  Widget _creditLimits() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Utils.getColorFromHex("#FFFFFF"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pre Approved Credit Limit",
            style: TextStyle(
                color: DefaultColor.appDarkBlue,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Available Bal."), Text("Total Credit")],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: LinearProgressIndicator(
              backgroundColor: Color(0xFFE7E7E7),
              valueColor: AlwaysStoppedAnimation<Color>(DefaultColor.blueDark),
              value: ((200) - (100)) / (200 == 0 ? 1 : 200),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("₹${((200) - (100))}"), Text("₹${200}")],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Mediclaim Advance Limit",
              style: TextStyle(
                  color: DefaultColor.appDarkBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Available Bal."), Text("Total Credit")],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: LinearProgressIndicator(
              backgroundColor: Color(0xFFE7E7E7),
              valueColor: AlwaysStoppedAnimation<Color>(DefaultColor.blueDark),
              value: ((200) - (100)) / (200),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("₹${((200) - (100))}"), Text("₹${100}")],
          )
        ],
      ),
    );
  }

  Widget _productUI() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 18, 10, 20),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: DefaultColor.greyButtonColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "MRI & Brain Scanner",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget equipmentFinance(
      {String? imagePath, String? title, String? desc, String? offer}) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15)),
                    child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          imagePath!,
                          fit: BoxFit.fitWidth,
                        )))),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15)),
                color: Utils.getColorFromHex("#FFFFFF"),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title!,
                    style: TextStyles.appBlack14,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    desc!,
                    style: TextStyles.appBlack12,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  AppButton(
                    onTap: () {
                      Navigator.pushNamed(context, "/GroupBuyHome");
                    },
                    buttonTitle: "Check Group Buy Prices",
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            decoration: BoxDecoration(
                color: Color(0xFFF9B50F),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: Text(
              offer!,
              style: TextStyles.appBlack12.copyWith(
                  fontWeight: FontWeight.w500, color: DefaultColor.appBarWhite),
            ))
      ],
    );
  }

  Widget equipmentFinanceOld() {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Utils.getColorFromHex("#FFFFFF"),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Equipment Finance at 0% Interest",
            style: TextStyles.appBlack14
                .copyWith(fontSize: 16, color: DefaultColor.appDarkBlue),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            "Brands",
            style: TextStyles.appBlack14.copyWith(fontSize: 16),
          ),
          Row(
            children: [
              Expanded(child: _productUI()),
              Expanded(child: _productUI()),
              Expanded(child: _productUI())
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Products",
                  style: TextStyles.appBlack14.copyWith(fontSize: 16),
                ),
              ),
              Text(
                "View all >",
                style: TextStyle(decoration: TextDecoration.underline),
              )
            ],
          ),
          Row(
            children: [
              Expanded(child: _productUI()),
              Expanded(child: _productUI()),
              Expanded(child: _productUI())
            ],
          ),
          AppButton(
            onTap: () {
              Navigator.pushNamed(context, "/ActivateLimit");
            },
            buttonTitle: "Activate Equipment Finance Limit",
          )
        ]));
  }

  Widget promoteMyCentre() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Utils.getColorFromHex("#FFFFFF"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/promote_img.png"),
          SizedBox(
            height: 15,
          ),
          Text(
            "Promote your hospital in our network",
            style: TextStyles.appBlack14,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "You can promote your hospital in our network to get a better reach and more customers to your hospital.",
            style: TextStyles.appBlack12,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 22,
          ),
          AppButton(
            onTap: () {},
            buttonTitle: "Promote Now",
          )
        ],
      ),
    );
  }

  Widget bottomBarTabsColumn(var icon, String text, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? Icon(
                  icon,
                  color: HomePageColors.textGrey,
                )
              : Container(
                  height: 20,
                ),
          Text(
            text,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: HomePageColors.textGrey),
          )
        ],
      ),
    );
  }

  saveIdInPrefs(String? id) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("cardId", id!);
  }

  @override
  Widget build(BuildContext context) {
    print("body");
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: globalKey,
      drawer: NavigationDrawer(),
      bottomNavigationBar: ConvexAppBar(
        color: DefaultColor.grey,
        backgroundColor: Colors.white,
        activeColor: DefaultColor.blueDark,
        style: TabStyle.fixed,
        cornerRadius: 10,
        items: [
          TabItem(icon: Icons.menu, title: 'Menu'),
          TabItem(icon: Icons.shopping_cart_outlined, title: 'Group Buy'),
          TabItem(
            icon: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/pay.png"),
                      fit: BoxFit.cover)),
            ) /*Image.asset("assets/images/pay.png",fit: BoxFit.cover)*/,
            title: 'Pay',
          ),
          TabItem(icon: Icons.my_library_books, title: 'My Bills'),
          TabItem(icon: Icons.receipt, title: 'Receipts'),
        ],
        initialActiveIndex: 1,
        //optional, default as 0
        onTap: (int i) {
          switch (i) {
            case 0:
              globalKey.currentState!.openDrawer();
              break;
            case 2:
              showModalBottomSheet<dynamic>(
                  isScrollControlled: true,
                  constraints: BoxConstraints.loose(Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.75)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) {
                    return BottomSheetBills();
                  });
              break;
            case 3:
              //Navigator.pushNamed(context, "/MyBillsScreen");
              break;
            case 4:
              showDialog(
                  context: context,
                  builder: (_) {
                    return CallDialog();
                  });
              break;
          }
        },
      ),
      backgroundColor: Utils.getColorFromHex("#E5E5E5"),
      body: SingleChildScrollView(
        child: StreamBuilder<ConsumerHomeModel>(
            stream: consumerHome.homeData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Utils.instance.loader(context);
              }
              return CommonCustomBG(
                  cardColor: Colors.transparent,
                  widgetOverCard: Container(
                      height: 220,
                      width: double.infinity,
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: 220.0,
                            viewportFraction:
                                snapshot.data?.data?.cards!.length == 1
                                    ? 1
                                    : 0.9,
                            // enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              indexUpdate = index;
                              consumerHome.updateCurrentIndex.add(index);
                            }),
                        items: snapshot.data?.data?.cards!.map((i) {
                          saveIdInPrefs(i.sId);
                          return Builder(
                            builder: (BuildContext context) {
                              return FlipCard(
                                fill: Fill.fillBack,
                                // Fill the back side of the card to make in the same size as the front.
                                direction: FlipDirection.HORIZONTAL,
                                // default
                                front: Container(
                                  // margin: EdgeInsets.symmetric(horizontal: 5),
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.only(top: 7),
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              i.type!.cardImage!))),
                                  child: StreamBuilder<String>(
                                      initialData: "",
                                      stream: consumerHome.getCardNumber,
                                      builder: (context, cardNumberSnapShot) {
                                        return Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: IconButton(
                                                  padding: EdgeInsets.only(
                                                      top: 0,
                                                      bottom: 10,
                                                      right:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              13),
                                                  constraints: BoxConstraints(),
                                                  onPressed: () {
                                                    consumerHome
                                                        .toggleEyeButton(i
                                                            .cardToken
                                                            .toString());
                                                  },
                                                  icon: cardNumberSnapShot.data
                                                          .toString()
                                                          .isNotEmpty
                                                      ? Icon(
                                                          Icons.visibility,
                                                          color: DefaultColor
                                                              .appDarkBlue,
                                                        )
                                                      : Icon(
                                                          Icons.visibility_off,
                                                          color: DefaultColor
                                                              .appDarkBlue,
                                                        )),
                                            ),
                                            Text(
                                              cardNumberSnapShot.data
                                                      .toString()
                                                      .isEmpty
                                                  ? i.cardNumber.toString()
                                                  : cardNumberSnapShot.data !=
                                                          null
                                                      ? cardNumberSnapShot.data
                                                          .toString()
                                                          .replaceAll("-", " ")
                                                      : i.cardNumber.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF1C4892)),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              snapshot.data!.data!.hospCustomer!
                                                      .identity!.name ??
                                                  "John Wick",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF1C4892)),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                back: StreamBuilder<int>(
                                    initialData: 0,
                                    stream: consumerHome.getCurrentIndex,
                                    builder: (context, snapshotIndex) {
                                      if (!snapshotIndex.hasData) {
                                        return _creditLimits();
                                      }
                                      return _creditLimits();
                                    }),
                              );
                            },
                          );
                        }).toList(),
                      )),
                  screenWidgets: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<int>(
                          initialData: 0,
                          stream: consumerHome.getCurrentIndex,
                          builder: (context, snapshotIndex) {
                            if (!snapshotIndex.hasData) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _title("Complete your KYC"),
                                  kycWidget(context, snapshot.data!.data!, 0),
                                ],
                              );
                            }

                            if (snapshot.data!.data!.cards!.isNotEmpty) {
                              if (snapshot.data!.data!
                                      .cards![snapshotIndex.data!].cardActive ??
                                  false) return Container();
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _title("Complete your KYC"),
                                  kycWidget(context, snapshot.data!.data!,
                                      snapshotIndex.data!),
                                ],
                              );
                            } else
                              return Container();
                          }),
                      Row(
                        children: [
                          Expanded(child: _title("Group Buy - Medical")),
                          IconButton(
                              padding: EdgeInsets.only(right: 5, top: 8),
                              constraints: BoxConstraints(),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return GroupBuyDialog();
                                    });
                              },
                              icon: Icon(
                                Icons.info_outline_rounded,
                                color: DefaultColor.appDarkBlue,
                              ))
                        ],
                      ),
                      _groupBuy(
                          imagePath: "assets/images/Group 73944.png",
                          title: "Buy all the medical essentials in a click",
                          desc:
                              "This list is specially curated for your easy one - click purchase. Save more through Group Buy.",
                          offer: "Next Group Buy on 15 Jun 22"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(child: _title("Group Buy - Dental")),
                          IconButton(
                              padding: EdgeInsets.only(right: 5, top: 8),
                              constraints: BoxConstraints(),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return GroupBuyDialog();
                                    });
                              },
                              icon: Icon(
                                Icons.info_outline_rounded,
                                color: DefaultColor.appDarkBlue,
                              ))
                        ],
                      ),
                      _groupBuy(
                          imagePath: "assets/images/groupbuy2 1.png",
                          title: "Buy all the medical essentials in a click",
                          desc:
                              "This list is specially curated for your easy one - click purchase. Save more through Group Buy.",
                          offer: "Next Group Buy on 15 Jun 22"),
                      _title("Equipment Finance"),
                      equipmentFinance(
                          imagePath: "assets/images/Coaches-cuate 1.png",
                          title: "Equipment finance at 0% interest",
                          desc:
                              "Get Equipment Finance at 0% EMI. Some additional text here.",
                          offer: "Coming soon"),
                      _title("Supplier Payments"),
                      GestureDetector(
                        child: _supplierPayments(),
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed('/MySuppliers'),
                      ),
                      _title("Insurance On EMI"),
                      insuranceOnEMI(),
                      _title("Promote My Center"),
                      promoteMyCentre(),
                      _title("GMoney Health Show"),
                      YouTubeView()
                    ],
                  ),
                  widgetsOverGradient: topGradientUI(
                      _height, snapshot.data!.data!.hospCustomer!, context));
            }),
      ),
    );
  }

  getMaxAmount(Limit limit) {
    // if (limit.total! > limit.mediclaimLimit!) {
    //   return limit.total.toString();
    // } else
    return limit.equipmentFinanceLimit.toString();
  }
}

String getDayGreetings() {
  String greetings = "";
  int timeOfDay = DateTime.now().hour;
  if (timeOfDay >= 5 && timeOfDay < 12) {
    greetings = "Good morning";
  } else if (timeOfDay >= 12 && timeOfDay < 17) {
    greetings = "Good afternoon";
  } else if (timeOfDay >= 17 && timeOfDay < 24) {
    greetings = "Good evening";
  } else if (timeOfDay <= 24 && timeOfDay < 5) {
    greetings = "Good morning";
  }
  return greetings;
}

Widget topGradientUI(var _height, HospCustomer data, BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(15, _height * 0.06, 10, 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${getDayGreetings()},",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                data.identity!.name!.split(" ").first,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/CartScreen");
            consumerHome.getConsumerHomeData();
          },
          icon: Icon(
            Icons.shopping_cart,
            color: Utils.getColorFromHex("#DADADA"),
          ),
          iconSize: 28,
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/Notifications");
            consumerHome.getConsumerHomeData();
          },
          icon: Icon(
            Icons.notifications,
            color: Utils.getColorFromHex("#DADADA"),
          ),
          iconSize: 28,
        )
      ],
    ),
  );
}
