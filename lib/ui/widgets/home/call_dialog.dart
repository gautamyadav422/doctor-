import 'package:flutter/material.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/util/utils.dart';
import 'package:url_launcher/url_launcher.dart';



class CallDialog extends StatelessWidget {

  final Uri _phoneLaunchUri = Uri(
    scheme: 'tel',
    path: '02249361515',
  );
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      insetPadding: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "GMoney",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Text(
              "Our working hours\n9 AM - 9 PM\n7 days a week",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Padding(
              padding: const EdgeInsets.fromLTRB(17,0,17,0),
              child: AppButton(onTap: ()=> launch(_phoneLaunchUri.toString())
                ,buttonTitle: "Call",buttonColour: DefaultColor.blueDark,),
            )
          ],
        ),
      ),
    );;
  }
}
