import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:gmoney/bloc/consumer_home.dart';
import 'package:gmoney/models/notification_res.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import '../../../util/utils.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  Widget cardWithList(int _index, List<NotificationData> notifications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            margin: EdgeInsets.only(bottom: 20, top: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Utils.getColorFromHex("#FFFFFF")),
            child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: notifications.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 2,
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => consumerHome.notificationReadStatus(notifications[index].id!),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(
                                        (math.Random().nextDouble() * 0xFFFFFF)
                                            .toInt())
                                    .withOpacity(1.0)),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                    index == 2
                                        ? Icons.person_outline
                                        : Icons.calendar_today_outlined,
                                    color: DefaultColor.appBarWhite))),
                        Expanded(
                            child: Text(
                          "${notifications[index].notification ?? "Your next EMI of ₹10,000 for Wockhardt Hospital is due on 9th March 2022."}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: DefaultColor.blackSubText),
                        ))
                      ],
                    ),
                  );
                })),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    consumerHome.getNotificationData();
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: SingleChildScrollView(
        child: CommonCustomBG(
          cardTopPadding: 9,
          isCardOnTop: false,
          widgetsOverGradient: AppBarBackArrow(
              title: "Notifications", onTap: () => Navigator.pop(context)),
          screenWidgets: StreamBuilder<NotificationRes>(
              stream: consumerHome.notificationData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Utils.instance.loader(context);
                }
                int? counts = snapshot.data!.notifications?.length;
                return snapshot.data!.notifications!.isEmpty ? Utils.instance.notFoundContainer("No notifications found..", context) : ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: counts ?? 0 + 1,
                  itemBuilder: (context, index) {
                    if (index == 0 ||
                        index == snapshot.data!.notifications!.length + 1) {
                      return Container(); // zero height: not visible
                    }
                    print("${snapshot.data!.notifications![index].id!}");
                    return cardWithList(index, snapshot.data!.notifications!,);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return daySelector(context, index, snapshot.data!.notifications!.length, snapshot.data!.notifications![index].createdOn!);

                  },
                );
              }),
        ),
      ),
    );
  }

  Widget daySelector(BuildContext context, int index, int length, DateTime createdOn) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    if(createdOn != null && createdOn == today){
      return Text(
        "Today",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: (index == 0 ||
                index ==
                    length + 1)
                ? DefaultColor.appBarWhite
                : DefaultColor.blackSubText),
      );

    }
    else if (createdOn != null && createdOn == yesterday){
      return Text(
        "Yesterday",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: (index == 0 ||
                index ==
                    length + 1)
                ? DefaultColor.appBarWhite
                : DefaultColor.blackSubText),
      );

    }
    else{
      return Text(
        "${createdOn.day} / ${createdOn.month} / ${createdOn.year}",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: (index == 0 ||
                index ==
                    length + 1)
                ? DefaultColor.appBarWhite
                : DefaultColor.blackSubText),
      );

    }
  }
}
