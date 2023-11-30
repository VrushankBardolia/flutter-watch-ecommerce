import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxetime/brandTile.dart';
import 'package:luxetime/components/snackbar.dart';
import 'package:luxetime/components/exploreButton.dart';

import '../components/alerts.dart';
import '../components/carousel.dart';
import '../util/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Alerts alerts = Alerts();
  MySnackbar snackbar = MySnackbar();

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
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Column(
                children: [

                  // Image Carousel
                  const Carousel(),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Brands',style: MyTexts.subHeading,),
                        Spacer(),
                        Explore(onTap: (){},)
                      ],
                    ),
                  ),
                  
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        BrandTile(img: 'assets/logo/rolex.png'),
                        BrandTile(img: 'assets/logo/audemars piguet.png'),
                        BrandTile(img: 'assets/logo/patek phillipe.png'),
                        BrandTile(img: 'assets/logo/omega.png'),
                        BrandTile(img: 'assets/logo/casio.png'),
                        BrandTile(img: 'assets/logo/tissot.png'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Watches',style: MyTexts.subHeading,),
                        Spacer(),
                        Explore(onTap: (){},)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
