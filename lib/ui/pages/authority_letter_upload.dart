import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gmoney/api/web_service_client.dart';
import 'package:gmoney/bloc/aadhar_bloc.dart';
import 'package:gmoney/bloc/consumer_home.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/aadhaar/bottomSheetPicker.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/button_outlined.dart';
import 'package:gmoney/util/utils.dart';

class AuthorityLetterUpload extends StatefulWidget {
  @override
  State<AuthorityLetterUpload> createState() => _AuthorityLetterUploadState();
}

class _AuthorityLetterUploadState extends State<AuthorityLetterUpload> {
  List<String?> allImages = [];
  TextEditingController _editingController =
  TextEditingController(text: "");
  int _counter = 0;
  late StreamController<int> _events;

  @override
  initState() {
    super.initState();
    _events = new StreamController<int>.broadcast();
    _events.add(30);
  }

  @override
  void dispose() {
    _events.close();
    _editingController.dispose();
    allImages.clear();
    consumerHome.updateImgPathBankStatements.add(allImages);
    aadhaarBloc.dispose();
    super.dispose();
  }

  static late Timer _timer;

  void _startTimer() {
    _counter = 30;
    /*  if (_timer != null) {
      _timer.cancel();
    }*/
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      //setState(() {
      (_counter > 0) ? _counter-- : _timer.cancel();
      //});
      print(_counter);
      _events.add(_counter);
    });
  }

  Widget pdfUI(BuildContext context) {
    return GestureDetector(
      onTap: () =>
      {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            backgroundColor: Colors.transparent,
            context: context,
            builder: (_) {
              return BottomSheetPicker(
                place: 5,
                showFile: true,
                policyPaths: allImages,
              );
            })
      },
      child: StreamBuilder<List<String?>>(
          stream: consumerHome.getImgPathBankStatements,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.length == 0) {
              return Column(
                children: [
                  DottedBorder(
                    color: Color(0xFFB5EAFF),
                    strokeWidth: 1,
                    radius: Radius.circular(5),
                    borderType: BorderType.RRect,
                    child: Row(
                      children: [
                        Container(
                            color: Color(0x335DFE7EB),
                            padding: const EdgeInsets.fromLTRB(18, 28, 18, 28),
                            child: Image.asset(
                              "assets/images/upload_pdf.png",
                              fit: BoxFit.fitHeight,
                            )),
                        Divider(),
                        Expanded(
                            child: Container(
                              color: Color(0x117AD5F9),
                              padding: const EdgeInsets.fromLTRB(18, 15, 8, 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Upload Authority Letter",
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
                  SizedBox(height: 25),
                  AppButton(
                    onTap: () => uploadImages(context),
                    buttonTitle: "Submit",
                    // buttonColour: !isChecked!
                    buttonColour:
                         DefaultColor.blueDark,
                  )
                ],
              );
            }
            if (snapshot.data!.length > 0) {
              allImages = snapshot.data!;
              print(snapshot.data!.length);
              bool isPdf = false;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DottedBorder(
                    color: Color(0xFFB5EAFF),
                    strokeWidth: 1,
                    radius: Radius.circular(5),
                    borderType: BorderType.RRect,
                    child: Row(
                      children: [
                        Container(
                            color: Color(0x335DFE7EB),
                            padding: const EdgeInsets.fromLTRB(18, 28, 18, 28),
                            child: Image.asset(
                              "assets/images/upload_pdf.png",
                              fit: BoxFit.fitHeight,
                            )),
                        Divider(),
                        Expanded(
                            child: Container(
                              color: Color(0x117AD5F9),
                              padding: const EdgeInsets.fromLTRB(18, 15, 8, 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Upload Authority Letter",
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
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
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Color(0x335DFE7EB),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                          border: Border.all(
                                              color:
                                              DefaultColor.blueLightGradient)),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 5),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: fileType == 'pdf'
                                          ? Image.asset(
                                        "assets/images/pdf.png",
                                        fit: BoxFit.fitHeight,
                                      )
                                          : Image.file(
                                          File(
                                              snapshot.data![index].toString()),
                                          fit: BoxFit.cover),
                                    ),
                                    Positioned(
                                        right: 10,
                                        top: 0,
                                        child: GestureDetector(
                                            onTap: () {
                                              allImages.removeAt(index);
                                              consumerHome
                                                  .updateImgPathBankStatements
                                                  .add(allImages);
                                            },
                                            child: Text(
                                              'X',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )))

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Page ${index + 1}'),
                              )
                            ],
                          );
                        }),
                  ),
                  SizedBox(height: 10),
                  snapshot.data!.toString().contains('.pdf') ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter pdf password (if any)"),
                      SizedBox(height: 10),
                      TextField(
                        controller: _editingController,
                        decoration: InputDecoration(
                            label: Text("Password for pdf"),
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            // floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Please enter pdf password",
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Utils.getColorFromHex("#A6A6A6"))),
                      ),
                      SizedBox(height: 20),
                    ],
                  ) : SizedBox(height: 0,),
                  AppButton(
                    onTap: () => uploadImages(context),
                    buttonTitle: "Submit",
                    // buttonColour: !isChecked!
                    buttonColour:
                         DefaultColor.blueDark,
                  )
                ],
              );
            }
            return Column(
              children: [
                SizedBox(height: 10),
                AppButton(
                  onTap: () => uploadImages(context),
                  buttonTitle: "Submit",
                  // buttonColour: !isChecked!
                  buttonColour: DefaultColor.blueDark,
                )
              ],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _textStyle = TextStyle(
        color: AadhaarColors.textGrey,
        fontSize: 14,
        fontWeight: FontWeight.w400);
    return Scaffold(
        backgroundColor: DefaultColor.scaffoldBgWhite,
        body: SingleChildScrollView(
          child: CommonCustomBG(
            cardTopPadding: 7,
            widgetsOverGradient: AppBarBackArrow(
                title: "BR/Authority Letter",
                onTap: () => Navigator.pop(context)),
            widgetOverCard: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              padding: EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Sign Authority Letter",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: DefaultColor.blueDarkLogin),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Download And Sign Authority Letter",
                    style: TextStyles.appBlack14.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 25,),
                  Container(
                      height: 52,
                      width: double.infinity,child: ButtonOutlined("Download Authority Letter",(){})),
                  SizedBox(height: 20,),
                  pdfUI(context),

                ],
              ),
            ),
          ),
        ));
  }

  uploadImages(BuildContext context) async {
    List<File> files = [];
    allImages.forEach((element) {
      files.add(File(element!));
      files.add(File(element));
    });

    print("call1");
    print(files);
    if (files.isNotEmpty) {
      var data = {
        "bank_password": "${_editingController.text}"
      };
      EasyLoading.show(status: 'loading...');

      await WebServiceClient.bankStatementUpload(data, files).then((value) {
        print("success");
        EasyLoading.dismiss();
        Navigator.of(context)
            .pushNamedAndRemoveUntil(
            '/HomeScreen',
                (Route<dynamic> route) =>
            false);
      }).catchError((onError) {
        EasyLoading.dismiss();
        print("failed");
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Something went wrong."
                "Please try again")));
      }).onError((error, stackTrace) {
        EasyLoading.dismiss();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Something went wrong."
                "Please try again")));
      });
    } else {
      print("call2");
      Utils.showErrorMessage("Please select files to upload.");
    }
  }}
