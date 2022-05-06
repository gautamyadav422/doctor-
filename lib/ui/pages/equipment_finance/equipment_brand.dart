import 'package:flutter/material.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/button_outlined.dart';
import 'package:gmoney/ui/widgets/home/rounded_card.dart';
import 'package:gmoney/util/utils.dart';


class EquipmentBrand extends StatelessWidget {

final pageController = PageController();
final slideIndex = 0;
  Widget card1(){
    return RoundedCard(
      childWidget: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Skanray Technologies",
                  style: TextStyles.appBlack18,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Total Equipments: 18",
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
                onPressed: ()  {
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
  Widget _listItemUI(){
    return RoundedCard(
      paddingTop: 8.0,paddingRight: 8.0,paddingLeft: 8.0,
      childWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: DefaultColor.scaffoldBgWhite),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,15,10,7),
            child: Text(
              "Medispar MRI and Brain Scanner",
              style: TextStyles.appBlack14.copyWith(fontSize: 16,color: DefaultColor.blueDarkLogin),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,0,10,20),
            child: Row(
              children: [
                Expanded(child: Text("Total Amount: ₹1,00,000",style: TextStyles.appBlack14,)),
                Text("View details",style: TextStyles.appBlack12.copyWith(
                  fontSize: 14,decoration: TextDecoration.underline,),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,0,10,0),
            child: AppButton(onTap: (){},buttonTitle: "I Am Interested. Call Me",),
          )
        ],
      ),
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: SingleChildScrollView(
        child: CommonCustomBG(
            cardTopPadding: 6.2,
            widgetsOverGradient: AppBarBackArrow(title: "Equipment Finance", onTap: ()=> Navigator.pop(context)),
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
                card1(),
                ListView.builder(
                  padding: EdgeInsets.only(bottom: 20),
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context,index){
                  return _listItemUI();
                }),
                Row(
                  children: [
                    Expanded(child: ButtonOutlined("Prev Page", (){},height: MediaQuery.of(context).size.height*0.07,)),
                    SizedBox(width: 16,),
                    Expanded(child: ButtonOutlined("Next page", (){},height: MediaQuery.of(context).size.height*0.07,)),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.04,)
              ],
            )
          /*})*/
        ),
      ),
    );
  }
Widget _buildPageIndicator(bool isCurrentPage) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    height: isCurrentPage ? 8.0 : 8.0,
    width: isCurrentPage ? 8.0 : 8.0,
    decoration: BoxDecoration(
      color: isCurrentPage ? DefaultColor.lightGrey : DefaultColor.lightGrey,
      gradient: isCurrentPage?new LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [DefaultColor.blueDark, DefaultColor.blueLightGradient],
      ):new LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [DefaultColor.lightGrey, DefaultColor.lightGrey],
      ),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
}
