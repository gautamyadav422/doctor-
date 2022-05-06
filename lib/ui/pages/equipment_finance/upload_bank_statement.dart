import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gmoney/api/web_service_client.dart';
import 'package:gmoney/bloc/partner_details_bloc.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/aadhaar/bottomSheetPicker.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/util/utils.dart';

class BankStatementUpload extends StatefulWidget {
  @override
  State<BankStatementUpload> createState() => _BankStatementUploadState();
}

class _BankStatementUploadState extends State<BankStatementUpload> {
  List<String?> allImages = [];


  @override
  initState() {
    super.initState();

  }

  @override
  void dispose() {
    allImages.clear();
    partnersBloc.updateImgPathBankStatements.add(allImages);

    super.dispose();
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
                place: 6,
                showFile: true,
                policyPaths: allImages,
              );
            })
      },
      child: StreamBuilder<List<String?>>(
          stream: partnersBloc.getImgPathBankStatements,
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
                                    "Upload Current Address proof",
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
                  SizedBox(height: 10),

                  AppButton(
                    onTap: () => uploadImages(context),
                    buttonTitle: "Next",
                    // buttonColour: !isChecked!
                    buttonColour: allImages.isEmpty
                        ? Utils.getColorFromHex("#DCDCDC")
                        : DefaultColor.blueDark,
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
                                    "Upload Current Address proof",
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
                                              partnersBloc
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
                  // snapshot.data!.toString().contains('.pdf') ?
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text("Enter pdf password (if any)"),
                  //     SizedBox(height: 10),
                  //     TextField(
                  //       controller: _editingController,
                  //       decoration: InputDecoration(
                  //           label: Text("Password for pdf"),
                  //           floatingLabelAlignment:
                  //           FloatingLabelAlignment.start,
                  //           // floatingLabelBehavior: FloatingLabelBehavior.always,
                  //           enabledBorder: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(10)),
                  //           focusedBorder: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(10)),
                  //           hintText: "Please enter pdf password",
                  //           hintStyle: TextStyle(
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w400,
                  //               color: Utils.getColorFromHex("#A6A6A6"))),
                  //     ),
                  //     SizedBox(height: 10),
                  //   ],
                  // ) : SizedBox(height: 0,),
                  AppButton(
                    onTap: () => uploadImages(context),
                    buttonTitle: "Next",
                    // buttonColour: !isChecked!
                    buttonColour: allImages.isEmpty
                        ? Utils.getColorFromHex("#DCDCDC")
                        : DefaultColor.blueDark,
                  )
                ],
              );
            }
            print(snapshot.data);
            return Column(
              children: [
                SizedBox(height: 10),
                AppButton(
                  onTap: () => uploadImages(context),
                  buttonTitle: "Next",
                  // buttonColour: !isChecked!
                  buttonColour: allImages.isEmpty
                      ? Utils.getColorFromHex("#DCDCDC")
                      : DefaultColor.blueDark,
                )
              ],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: DefaultColor.scaffoldBgWhite,
        body: SingleChildScrollView(
          child: CommonCustomBG(
            cardTopPadding: 8,
            widgetsOverGradient: AppBarBackArrow(
                title: "Bank Statement upload",
                onTap: () => Navigator.pop(context)),
            widgetOverCard: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bank Statement",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: DefaultColor.blueDarkLogin),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text("Upload Bank statement",
                        style:
                        TextStyle(color: DefaultColor.black, fontSize: 14)),
                  ),
                  SizedBox(height: 20),
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
        "bank_password": ""
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
