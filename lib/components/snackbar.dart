import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/theme.dart';

class MySnackbar{

  SnackBar Success(String title){
    return SnackBar(
      content: Text(title,style: MyTexts.hint),
      backgroundColor: CupertinoColors.systemGreen,
      margin: const EdgeInsets.all(12),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
    );
  }

  SnackBar Normal(String title){
    return SnackBar(
      content: Text(title,style: MyTexts.hint,),
      // backgroundColor: CupertinoColors.systemGreen,
      margin: const EdgeInsets.all(12),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
    );
  }
}