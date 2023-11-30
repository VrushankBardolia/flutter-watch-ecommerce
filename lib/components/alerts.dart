import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxetime/util/theme.dart';

class Alerts{

  void ActionAlert(BuildContext context, String title, String action, Function() actionTap) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title,style: GoogleFonts.montserrat(color: MyColors.primary)),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () { Get.back(); },
            child: Text('Cancel',style: GoogleFonts.montserrat(),),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            isDefaultAction: true,
            onPressed: actionTap,
            child: Text(action,style: GoogleFonts.montserrat(),),
          ),
        ],
      ),
    );
  }

  void SimpleAlert(BuildContext context, String title) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title,style: GoogleFonts.montserrat(color: MyColors.primary)),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () { Get.back(); },
            child: Text('Okay',style: GoogleFonts.montserrat(),),
          ),
        ],
      ),
    );
  }
}