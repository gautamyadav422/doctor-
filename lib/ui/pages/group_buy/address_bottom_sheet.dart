import 'package:flutter/material.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/util/utils.dart';



class AddressBottomSheet extends StatelessWidget {


  List<TextEditingController> _controllers = List.generate(6, (i) => TextEditingController());

  Widget _txtField(String txt,TextEditingController cont){
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 10),
      child: Center(
        child: TextField(
            controller: cont,
            keyboardType: TextInputType.text,
            onChanged: (text) {},
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              focusedBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFA6A6A6), width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFA6A6A6), width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.all(20),
              isDense: true,
              hintText: txt,
              border: InputBorder.none,
            )),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
           _txtField("Enter Address Line 1", _controllers[0]),
            _txtField("Enter Address Line 2", _controllers[1]),
            _txtField("Enter Pincode", _controllers[2]),
            _txtField("Enter City", _controllers[3]),
            _txtField("Enter State", _controllers[4]),
            _txtField("Enter mobile no", _controllers[5]),
            Text("Enter mobile number on which you would like to receive a call during delivery",
              style: TextStyles.appBlack12,),
            SizedBox(height: 50,),
            AppButton(onTap: (){},buttonTitle: "Add Address",)
          ],
        ),
      ),
    );
  }
}
