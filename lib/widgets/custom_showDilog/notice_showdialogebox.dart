import 'package:excelkaroor/view/colors/colors.dart';
import 'package:excelkaroor/view/widgets/fonts/google_poppins.dart';
import 'package:excelkaroor/widgets/back_button/back_button_widget.dart';
import 'package:flutter/material.dart';

noticeCustomShowDilogBox(
    {required BuildContext context,
    required String title,
    required List<Widget> children,
    String? actiontext,
    Widget? okButton,
    required bool doyouwantActionButton,
    void Function()? actiononTapfuction}) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GooglePoppinsWidgets(
              //     text: title, fontsize: 15, fontWeight: FontWeight.w600),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: BackButtonContainerWidget(),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: children,
            ),
          ),
          actions: doyouwantActionButton == true
              ? <Widget>[
                  okButton ??
                      GestureDetector(
                        onTap: actiononTapfuction,
                        child: Container(
                          height: 40,
                          width: 250,
                          decoration: const BoxDecoration(
                            color: adminePrimayColor,
                          ),
                          child: Center(
                            child: GooglePoppinsWidgets(
                                text: actiontext ?? 'ok',
                                color: cWhite,
                                fontsize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                ]
              : null);
    },
  );
}
