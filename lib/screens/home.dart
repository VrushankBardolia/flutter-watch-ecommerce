import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxetime/components/snackbar.dart';

import '../components/alerts.dart';
import '../util/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Alerts alerts = Alerts();
  MySnackbar snackbar = MySnackbar();

  show(){
    // alerts.ActionAlert(context,'Hello','Okay',(){Get.back();});
    // alerts.SimpleAlert(context, 'Simple');
    ScaffoldMessenger.of(context).showSnackBar(snackbar.Success('Logged in!'));
  }

  logout()async{
    alerts.ActionAlert(context, 'Do you want to logout?', 'Logout', ()async{
          await FirebaseAuth.instance.signOut();
          ScaffoldMessenger.of(context).showSnackBar(snackbar.Normal('Logged Out!'));
          Get.back();}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text('LuxeTime',style: MyTexts.title),
            backgroundColor: Theme.of(context).colorScheme.background.withOpacity(0.9),
            actions: [IconButton(onPressed: logout, icon: const Icon(Icons.logout_rounded))],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    CupertinoButton.filled(onPressed: show, child: const Text('show'))
                  ],
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
