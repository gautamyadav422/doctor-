import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tags_x/flutter_tags_x.dart';
import 'package:gmoney/bloc/group_buy/products_bloc.dart';
import 'package:gmoney/models/group_buy_models/brand_model.dart';
import 'package:gmoney/models/group_buy_models/category_model.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/button_outlined.dart';
import 'package:gmoney/util/utils.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  Map<String, bool> titles = Map();
  Map<String, bool> brands = Map();

  bool checkBoxBrands = false;
  bool checkBoxCategory = false;
  bool brandsSelected = false;
  bool allBrandsSelected = false;
  bool allTitlesSelected = false;

  Widget _divider() {
    return Divider(
      thickness: 0.8,
      color: DefaultColor.blackSubText,
    );
  }

  Widget _checkBox(AsyncSnapshot<CategoryRes> text, bool val, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: titles[text.data!.data![index].datumId.toString()],
              onChanged: (_) {
                toggleCheckboxState(
                    val, text.data!.data![index].datumId.toString());
              },
            ),
            Expanded(
              child: Text(
                text.data!.data![index].title!,
                style: TextStyles.appBlack18.copyWith(
                  fontWeight: FontWeight.w400,
                  color: DefaultColor.blackTC,
                ),
              ),
            )
          ],
        ),
        Offstage(
          offstage: !titles[text.data!.data![index].datumId.toString()]!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Tags(
              itemCount: 10, // required
              itemBuilder: (int index) {
                return ItemTags(
                  // Each ItemTags must contain a Key. Keys allow Flutter to
                  // uniquely identify widgets.
                  key: Key(index.toString()),
                  index: index,
                  borderRadius:BorderRadius.all( Radius.circular(5)),
                  // required
                  title: "item.title",
                  active: false,
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                  //combine: ItemTagsCombine.withTextBefore,
                  // image: ItemTagsImage(
                  //     image: AssetImage(
                  //         "img.jpg") // OR NetworkImage("https://...image.png")
                  //     ),
                  // // OR null,
                  // icon: ItemTagsIcon(
                  //   icon: Icons.add,
                  // ),
                  // // OR null,
                  // removeButton: ItemTagsRemoveButton(
                  //   onRemoved: () {
                  //     // Remove the item from the data source.
                  //     // setState(() {
                  //     //   // required
                  //     //   _items.removeAt(index);
                  //     // });
                  //     //required
                  //     return true;
                  //   },
                  // ),
                  // OR null,
                  onPressed: (item) => print(item),
                  onLongPressed: (item) => print(item),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _checkBoxBrands(String text, bool val, int index) {
    return Row(
      children: [
        Checkbox(
          value: brands[text],
          onChanged: (_) {
            toggleCheckboxStateBrands(val, text);
          },
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyles.appBlack18.copyWith(
              fontWeight: FontWeight.w400,
              color: DefaultColor.blackTC,
            ),
          ),
        )
      ],
    );
  }

  Widget middleView() {
    return Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       GestureDetector(
              //         child: Text(
              //           "Category",
              //           style: TextStyles.appBlack14.copyWith(fontSize: 18.0),
              //         ),
              //         onTap: () {
              //           productsBloc.updateVisibilityData.add(1);
              //         },
              //       ),
              //       Container(
              //         child: _divider(),
              //         width: MediaQuery.of(context).size.width / 4,
              //       ),
              //       GestureDetector(
              //           onTap: () {
              //             productsBloc.updateVisibilityData.add(2);
              //           },
              //           child: Text(
              //             "Brands",
              //             style: TextStyles.appBlack14.copyWith(fontSize: 18.0),
              //           )),
              //       Container(
              //         child: _divider(),
              //         width: MediaQuery.of(context).size.width / 4,
              //       ),
              //     ],
              //   ),
              // ),
              // VerticalDivider(
              //   thickness: 0.8,
              //   color: DefaultColor.blackSubText,
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      value: checkBoxCategory,
                      onChanged: (bool? b) {
                        checkBoxCategory = !checkBoxCategory;
                        setState(() {
                          if (b == true) {
                            titles.updateAll((key, value) => true);
                            allBrandsSelected = true;
                          } else if (b == false) {
                            titles.updateAll((key, value) => false);
                            allBrandsSelected = false;
                          }
                        });
                      },
                    ),
                    Text("Select all      ")
                  ],
                ),
              ),
              // StreamBuilder<int>(
              //     initialData: 1,
              //     stream: productsBloc.getVisibilityData,
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData && snapshot.data == 1) {
              //         return Expanded(
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               Checkbox(
              //                 value: checkBoxCategory,
              //                 onChanged: (bool? b) {
              //                   checkBoxCategory = !checkBoxCategory;
              //                   setState(() {
              //                     if (b == true) {
              //                       titles.updateAll((key, value) => true);
              //                       allBrandsSelected = true;
              //                     } else if (b == false) {
              //                       titles.updateAll((key, value) => false);
              //                       allBrandsSelected = false;
              //                     }
              //                   });
              //                 },
              //               ),
              //               Text("Select all      ")
              //             ],
              //           ),
              //         );
              //       }
              //       return Expanded(
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             Checkbox(
              //               value: checkBoxBrands,
              //               onChanged: (bool? b) {
              //                 if (brandsSelected) {
              //                   checkBoxBrands = !checkBoxBrands;
              //                   setState(() {
              //                     if (b == true) {
              //                       brands.updateAll((key, value) => true);
              //                       allTitlesSelected = true;
              //                     } else if (b == false) {
              //                       brands.updateAll((key, value) => false);
              //                       allTitlesSelected = false;
              //                     }
              //                   });
              //                 }
              //               },
              //             ),
              //             Text("Select all      ")
              //           ],
              //         ),
              //       );
              //     }),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            children: [
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       GestureDetector(
              //         child: Text(
              //           "Category",
              //           style: TextStyles.boldWhite.copyWith(fontSize: 20.0),
              //         ),
              //         onTap: () {
              //           //productsBloc.updateVisibilityData.add(1);
              //         },
              //       ),
              //       Container(
              //         child: Divider(
              //           thickness: 0.8,
              //           color: DefaultColor.appBarWhite,
              //         ),
              //         width: MediaQuery
              //             .of(context)
              //             .size
              //             .width / 4,
              //       ),
              //       GestureDetector(
              //           onTap: () {
              //             // productsBloc.updateVisibilityData.add(2);
              //           },
              //           child: Text(
              //             "Brands",
              //             style: TextStyles.boldWhite.copyWith(fontSize: 20.0),
              //           )),
              //     ],
              //   ),
              // ),
              // VerticalDivider(
              //   thickness: 0.8,
              //   color: DefaultColor.blackSubText,
              // ),
              // SizedBox(
              //   width: 5,
              // ),
              StreamBuilder<CategoryRes>(
                  stream: productsBloc.getCategoryData,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return Expanded(
                      child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            snapshot.data!.data!.forEach((element) {
                              titles.putIfAbsent(
                                  element.datumId!.toString(), () => false);
                            });
                            return _checkBox(
                              snapshot,
                              false,
                              index,
                            );
                          },
                          itemCount: snapshot.data!.data!.length,
                        ),
                      ),
                    );
                  }),
              // StreamBuilder<int>(
              //     initialData: 1,
              //     stream: productsBloc.getVisibilityData,
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData && snapshot.data == 1) {
              //         brandsSelected = false;
              //         return StreamBuilder<CategoryRes>(
              //             stream: productsBloc.getCategoryData,
              //             builder: (context, snapshot) {
              //               if (!snapshot.hasData) {
              //                 return CircularProgressIndicator();
              //               }
              //               return Expanded(
              //                 child: SizedBox(
              //                   height: double.maxFinite,
              //                   width: double.maxFinite,
              //                   child: ListView.builder(
              //                     padding: EdgeInsets.only(top: 0),
              //                     shrinkWrap: true,
              //                     scrollDirection: Axis.vertical,
              //                     physics: ScrollPhysics(),
              //                     itemBuilder: (context, index) {
              //                       snapshot.data!.data!.forEach((element) {
              //                         titles.putIfAbsent(
              //                             element.datumId!.toString(),
              //                                 () => false);
              //                       });
              //                       return _checkBox(
              //                         snapshot,
              //                         false,
              //                         index,
              //                       );
              //                     },
              //                     itemCount: snapshot.data!.data!.length,
              //                   ),
              //                 ),
              //               );
              //             });
              //       }
              //       return StreamBuilder<BrandRes>(
              //           stream: productsBloc.getBrandsData,
              //           builder: (context, snapshot) {
              //             if (!snapshot.hasData) {
              //               return CircularProgressIndicator();
              //             }
              //             brandsSelected = true;
              //             return Expanded(
              //               child: SizedBox(
              //                 height: double.maxFinite,
              //                 width: double.maxFinite,
              //                 child: ListView.builder(
              //                   padding: EdgeInsets.only(top: 0),
              //                   shrinkWrap: true,
              //                   scrollDirection: Axis.vertical,
              //                   physics: ScrollPhysics(),
              //                   itemBuilder: (context, index) {
              //                     snapshot.data!.data!.forEach((element) {
              //                       brands.putIfAbsent(
              //                           element.id!, () => false);
              //                     });
              //                     return _checkBoxBrands(
              //                         snapshot.data!.data![index].id!,
              //                         false,
              //                         index);
              //                   },
              //                   itemCount: snapshot.data!.data!.length,
              //                 ),
              //               ),
              //             );
              //           });
              //     })
            ],
          ),
        ),
      ],
    );
  }

  Widget bottomView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 15, 10),
      child: Row(
        children: [
          Expanded(
              child: ButtonOutlined(
            "Reset Filter",
            () {
              setState(() {
                titles.clear();
                brands.clear();
                checkBoxBrands = false;
                checkBoxCategory = false;
                brandsSelected = false;
                allBrandsSelected = false;
                allTitlesSelected = false;
              });
            },
            height: 55.0,
          )),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: AppButton(
            onTap: () async {
              List categoryData = [];
              List brandsData = [];
              if (titles.length > 0 || brands.length > 0) {
                titles.forEach((key, value) {
                  if (value == true) {
                    categoryData.add(int.parse(key));
                  }
                });
                brands.forEach((key, value) {
                  if (value == true) {
                    brandsData.add(key);
                  }
                });
                var data = {
                  "filters": {"categories": categoryData, "brands": brandsData}
                };
                print(categoryData);
                print(brandsData);
                EasyLoading.show();
                await productsBloc.getProducts(data);
                EasyLoading.dismiss();
                Navigator.of(context).pop();
              } else {
                EasyLoading.show();
                await productsBloc.getProducts({});
                EasyLoading.dismiss();
                Navigator.of(context).pop();
              }
            },
            buttonTitle: "Apply Filter",
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.85,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
        decoration: new BoxDecoration(
          color: DefaultColor.appBarWhite,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 15, 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Filter",
                    style: TextStyles.appBlack14.copyWith(fontSize: 20.0),
                  )),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
            ),
            _divider(),
            Expanded(child: middleView()),
            _divider(),
            bottomView()
          ],
        ));
  }

  toggleCheckboxState(bool? val, String index) {
    setState(() {
      titles[index] = !titles[index]!;
      // isChecked = val ?? true;
    });
  }

  toggleCheckboxStateBrands(bool? val, String index) {
    setState(() {
      brands[index] = !brands[index]!;
      // isChecked = val ?? true;
    });
  }

  getSelecttion() {
    if (allTitlesSelected && !brandsSelected) {
      print("case 1");
      return true;
    } else if (allBrandsSelected && brandsSelected) {
      print("case 2");
      return true;
    } else {
      print("case 3");
      print(allTitlesSelected);
      print(allBrandsSelected);
      print(brandsSelected);
      return false;
    }
  }
}
