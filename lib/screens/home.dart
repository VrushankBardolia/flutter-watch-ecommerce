import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  logout()async{
    await FirebaseAuth.instance.signOut();
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
              child: Container(
                height: 2000,
                color: CupertinoColors.destructiveRed,
              ),
            ),
          )
        ],
      ),
    );
  }
}
