import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:excelkaroor/controllers/userCredentials/user_credentials.dart';
import 'package:excelkaroor/utils/utils.dart';
import 'package:excelkaroor/view/colors/colors.dart';
import 'package:excelkaroor/view/constant/sizes/sizes.dart';
import 'package:excelkaroor/view/home/events/Tabs/class_level_tab.dart';
import 'package:excelkaroor/view/home/events/Tabs/school_level_tab.dart';
import 'package:excelkaroor/view/home/events/event_display_class_level.dart';
import 'package:excelkaroor/view/home/events/event_display_school_level.dart';
import 'package:excelkaroor/view/widgets/appbar_color/appbar_clr.dart';

class EventList extends StatelessWidget {
   const EventList({super.key,});

  @override
  Widget build(BuildContext context) {
    return 
    // DefaultTabController(
    //   length: 2,
    //   child:
       Scaffold(
        appBar: AppBar(
          foregroundColor: cWhite,
          title: Row(
            children: [
              // IconButtonBackWidget(),
              SizedBox(
                width: 20.w,
              ),
              Text("Events".tr),
            ],
          ),
          flexibleSpace: const AppBarColorWidget(),
          // backgroundColor: adminePrimayColor,
          // bottom: TabBar(tabs: [
          //   Tab(
          //     text: 'Class Level'.tr,
          //   ),
          //   Tab(
          //     text: 'School Level'.tr,
          //   )
          // ]),
        ),

        //  appBar: AppBar(backgroundColor: adminePrimayColor),
        body: 
        const SafeArea(
          child:
          //  TabBarView(
          //   children: [ClassLevelPage(), 
            SchoolLevelPage()
          //   ],
          // ),
        ),
     // ),
    );
  }
}
