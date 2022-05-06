import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gmoney/bloc/aadhar_bloc.dart';
import 'package:gmoney/bloc/bank_details_bloc.dart';
import 'package:gmoney/models/my_bills_model.dart';
import 'package:gmoney/models/policy_status_res.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/util/utils.dart';
import 'package:intl/intl.dart';

import '../../bloc/consumer_home.dart';
import '../widgets/aadhaar/bottomSheetPicker.dart';
import '../widgets/dotted_line.dart';

class ApprovalScreen extends HookWidget {


  final _formKey = GlobalKey<FormState>();
  final _formOptionalKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat('dd-MMMM-yyyy');



  List<String?>? policyPaths = [];
  List<String?>? consultPaths = [];

  String? addressImage;


  Widget _columnKycSteps(String text, String img) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(img),
        SizedBox(
          height: 12,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: Utils.getColorFromHex("#373737")),
        )
      ],
    );
  }

  Widget pdfUICurrent(BuildContext context, int place,
      Stream<List<String?>> stream, List<String?> paths,String titleUpload) {
    return GestureDetector(
      onTap: () => {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            backgroundColor: Colors.transparent,
            context: context,
            builder: (_) {
              return BottomSheetPicker(
                place: place,
                showFile: true,
                policyPaths: paths,
              );
            })
      },
      child: StreamBuilder<List<String?>>(
          stream: stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData||(snapshot.hasData&&snapshot.data!.length==0)) {
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  strokeWidth: 2,
                  dashPattern: [5],
                  child: Row(
                    children: [
                      Container(
                          color: Color(0x335DFE7EB),
                          padding: const EdgeInsets.fromLTRB(18, 28, 18, 28),
                          child: Image.asset(
                            "assets/images/upload_pdf.png",
                            fit: BoxFit.fitHeight,
                          )),
                      CustomPaint(
                          size: Size(2, MediaQuery.of(context).size.height / 9),
                          painter: DashedLineVerticalPainter()),
                      Expanded(
                          child: Container(
                        color: Color(0x117AD5F9),
                        padding: const EdgeInsets.fromLTRB(18, 15, 8, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titleUpload,
                              style: TextStyle(
                                  color: Color(0xFF014078),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Maximum file size 5 MB (png, jpeg, jpg, pdf)",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF525252)),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            }
            // debugPrint("file >>>>>> ${snapshot.data!.length}");
            if (snapshot.data!.length > 0) {
              // allImages = snapshot.data!;
              // addressImage = snapshot.data!.last;
              bool isPdf = false;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(10),
                      strokeWidth: 2,
                      dashPattern: [5],
                      child: Row(
                        children: [
                          Container(
                              color: Color(0x335DFE7EB),
                              padding:
                                  const EdgeInsets.fromLTRB(18, 28, 18, 28),
                              child: Image.asset(
                                "assets/images/upload_pdf.png",
                                fit: BoxFit.fitHeight,
                              )),
                          CustomPaint(
                              size: Size(
                                  2, MediaQuery.of(context).size.height / 9),
                              painter: DashedLineVerticalPainter()),
                          Expanded(
                              child: Container(
                            color: Color(0x117AD5F9),
                            padding: const EdgeInsets.fromLTRB(18, 15, 8, 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  titleUpload,
                                  style: TextStyle(
                                      color: Color(0xFF014078),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Maximum file size 5 MB (png, jpeg, jpg, pdf)",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF525252)),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  snapshot.data!.length > 0
                      ? Container(
                          height: 110,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                String? mimeStr = snapshot.data![index];
                                String fileType = mimeStr!
                                    .substring(mimeStr.length - 3)
                                    .toLowerCase();
                                isPdf = true;
                                print('file type ${fileType}');
                                return Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Color(0x335DFE7EB),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                color: DefaultColor
                                                    .blueLightGradient)),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 5),
                                        padding: const EdgeInsets.only(top: 5,bottom: 10,left: 7,right: 0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 50,
                                              child:  fileType == 'pdf'
                                                  ? Image.asset(
                                                "assets/images/pdf.png",
                                                fit: BoxFit.fitHeight,
                                              )
                                                  : Image.file(
                                                  File(snapshot.data![index]
                                                      .toString()),
                                                  fit: BoxFit.cover),
                                            ),
                                            GestureDetector(child: Icon(Icons.close,size: 15,color: DefaultColor.greyBackButton),onTap: (){
                                              if(place==3){
                                                policyPaths!.removeAt(index);
                                                //consumerHome.getImgPathPolicy.drain();
                                                consumerHome.updateImgPathPolicy
                                                    .add(policyPaths!);
                                              }

                                              if(place==4){
                                                consultPaths!.removeAt(index);
                                                //consumerHome.getImgPathPolicy.drain();
                                                consumerHome.updateImgPathConsult
                                                    .add(consultPaths!);
                                              }
                                            },)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Page ${index + 1}'),
                                    )
                                  ],
                                );
                              }),
                        )
                      : Container(),
                ],
              );
            }
            return Container();
          }),
    );
  }

  final List<Widget> list = [
    Tab(text: "Upload"),
    Tab(text: "Status"),
  ];

  Widget descriptionUI(BuildContext context) {
    return StreamBuilder<PolicyStatusRes>(
      stream: bankDetailsBloc.policyStatusStream,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        return ListView.builder(
          itemBuilder: (context,index) {
            return  Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "Updated on",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: HomePageColors.textGrey),
                                )),
                            Expanded(
                                child: Text(
                                  "Mobile:",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: HomePageColors.textGrey),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "${snapshot.data!.data![index].createdOn!=null?dateFormat.format(snapshot.data!.data![index].createdOn!):"Not Found"}",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                )),
                            Expanded(
                                child: Text(
                                  '${snapshot.data!.data![index].customer?.mobile}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: HomePageColors.textGrey),
                                )),
                            Expanded(
                                child: Text(
                                  "Est. Amount",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: HomePageColors.textGrey),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "${snapshot.data!.data![index].customer?.identity?.name!=null?snapshot.data!.data![index].customer?.identity?.name!:"Not Found"}",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                )),
                            Expanded(
                                child: Text(
                                  '₹ ${snapshot.data!.data![index].estimateAmount!=null?snapshot.data!.data![index].estimateAmount!:"Not Found"}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "Approved Amount",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: HomePageColors.textGrey),
                                )),
                            Expanded(
                                child: Text(
                                  "Approval Date",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: HomePageColors.textGrey),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "${snapshot.data!.data![index].approvedAmount!=null?snapshot.data!.data![index].approvedAmount!:"Not Found"}",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                )),
                            Expanded(
                                child: Text(
                                  "${snapshot.data!.data![index].approvalDate!=null?dateFormat.format(snapshot.data!.data![index].approvalDate!):"Not Found"}",

                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: HomePageColors.textGrey),
                              ),
                              Text(
                                "${snapshot.data!.data![index].status!=null?snapshot.data!.data![index].status!:"Not Found"}",
                                style: TextStyle(
                                    color: DefaultColor.blueDark,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ));

          },
          itemCount: snapshot.data!.data!.length,
        );
      }
    );
  }



  @override
  Widget build(BuildContext context) {
    final _controller = useTabController(initialLength: 2);
    var textController = useTextEditingController();
    var textClaimController = useTextEditingController();
    final _index = useState(0);
    final _tabKey = GlobalKey();
    _controller.addListener(() {
      _index.value = _controller.index;
      if(_index.value==1){
        bankDetailsBloc.getPolicyStatusUpdate({});
      }
    });

    uploadImages(BuildContext context) async {
      List<File> policyFiles = [];
      List<File> consultFiles = [];

      Map<String, List<File>> fileMapList = Map();
      for (var policies in policyPaths!) {
        policyFiles.add(File(policies!));
      }
      for (var consults in consultPaths!) {
        consultFiles.add(File(consults!));
      }

      if (policyPaths != null &&
          policyPaths!.isNotEmpty &&
          consultPaths != null &&
          consultPaths!.isNotEmpty) {
        // files.add(File(addressImage));
        fileMapList = {'policy': policyFiles, 'consult': consultFiles};
      }

      print("call1");
      if (policyPaths!.isNotEmpty) {
        var data = {"amount": textController.text,
          "amountClaimed": textClaimController.text};
        EasyLoading.show(status: 'loading...');

        await aadhaarBloc.uploadMediclaimDocs(data, [],{}, fileMapList).then((value) {
          print("success");
          EasyLoading.dismiss();
          policyPaths!.clear();
          consultPaths!.clear();
          consumerHome.updateImgPathPolicy.add(policyPaths!);
          consumerHome.updateImgPathConsult.add(consultPaths!);
          Navigator.pop(context);
        }).catchError((onError) {
          EasyLoading.dismiss();
          print("failed");
        }).onError((error, stackTrace) {
          EasyLoading.dismiss();
        });
      } else {
        print("call2");
        Utils.showErrorMessage("Please select files and accept the terms.");
      }
    }


    return Scaffold(
      backgroundColor: DefaultColor.lightGrey,
      appBar: AppBar(
        backgroundColor: DefaultColor.blueDark,
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              policyPaths!.clear();
              consultPaths!.clear();
              consumerHome.updateImgPathPolicy.add(policyPaths!);
              consumerHome.updateImgPathConsult.add(consultPaths!);
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: DefaultColor.appBarWhite,
            )),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Text(
            "Advance Against Mediclaim",
            textAlign: TextAlign.left,
            style: TextStyle(color: DefaultColor.appBarWhite, fontSize: 18),
          ),
        ),
        bottom: TabBar(
          onTap: (index) {},
          controller: _controller,
          tabs: list,
        ),
        automaticallyImplyLeading: false,
      ),
      body: TabBarView(
        key: _tabKey,
        controller: _controller,
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: new BoxDecoration(
                      color: DefaultColor.lightGrey,
                      gradient: new LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          DefaultColor.blueDark,
                          DefaultColor.blueLightGradient
                        ],
                      ))),
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      color: DefaultColor.appBarWhite,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: Text(
                                "Upload Policy",
                                style: TextStyle(
                                    color: DefaultColor.blueDarkLogin,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            pdfUICurrent(context, 3,
                                consumerHome.getImgPathPolicy, policyPaths!,"Upload Policy"),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: Text(
                                "Upload Consultation Paper",
                                style: TextStyle(
                                    color: DefaultColor.blueDarkLogin,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            pdfUICurrent(context, 4,
                                consumerHome.getImgPathConsult, consultPaths!,"Upload consultation paper"),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 0, right: 15),
                              child: Text(
                                "Enter Amount",
                                style: TextStyle(
                                    color: DefaultColor.blueDarkLogin,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 0),
                                            child: TextFormField(
                                                controller: textController,
                                                keyboardType:
                                                    TextInputType.number,
                                                style: TextStyle(fontSize: 18),
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  LengthLimitingTextInputFormatter(
                                                      20),
                                                ],
                                                validator: (val) {
                                                  if (val == null ||
                                                      val.isEmpty ||
                                                      val.length > 20) {
                                                    return "Please enter valid amount.";
                                                  }
                                                  return null;
                                                },
                                                onChanged: (text) {
                                                  _formKey.currentState!
                                                      .validate();
                                                },
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 20),
                                                  isDense: true,
                                                  hintText:
                                                      "Please enter estimated bill amount",
                                                  hintStyle:
                                                      TextStyle(fontSize: 14),
                                                  labelStyle: TextStyle(
                                                      color: DefaultColor.grey),
                                                  border: InputBorder.none,
                                                )),
                                          ),
                                        ],
                                      ),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 0),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: DefaultColor.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    ),
                                  ],
                                )),
                            //
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 0, right: 15),
                              child: Text(
                                "Amount claim, if any",
                                style: TextStyle(
                                    color: DefaultColor.blueDarkLogin,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 0),
                                        child: TextFormField(
                                            key: _formOptionalKey,
                                            validator: (val) {
                                              if (val == null ||
                                                  val.isEmpty ||
                                                  val.length > 20) {
                                                return "Please enter valid amount.";
                                              }
                                              return null;
                                            },
                                            onChanged: (text) {
                                              _formOptionalKey.currentState!.validate();
                                            },
                                            controller: textClaimController,
                                            keyboardType: TextInputType.number,
                                            style: TextStyle(fontSize: 18),
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              LengthLimitingTextInputFormatter(
                                                  20),
                                            ],
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 20),
                                              isDense: true,
                                              hintText:
                                                  "Please enter amount claimed in last 1 year",
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                              labelStyle: TextStyle(
                                                  color: DefaultColor.grey),
                                              border: InputBorder.none,
                                            )),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 0),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: DefaultColor.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                              ],
                            ),
                            //
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: AppButton(
                                onTap: () {
                                  print('uploadImages');
                                  uploadImages(context);
                                },
                                buttonTitle: "Submit",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: new BoxDecoration(
                      color: DefaultColor.lightGrey,
                      gradient: new LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          DefaultColor.blueDark,
                          DefaultColor.blueLightGradient
                        ],
                      ))),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: descriptionUI(context),
              ),
            ],
          )
        ],
      ),
    );
  }

}
