// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: GetBuilder<SplashController>(
        builder: (controller) {
          return SafeArea(
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/vectors/sun-tornado.svg',
                  fit: BoxFit.cover,
                  height: size.height,
                  width: size.width,
                ),
                Container(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInDown(
                        child: Hero(
                          tag: 'HeroSplash',
                          child: CircleAvatar(
                            radius: 96,
                            backgroundImage:
                                AssetImage("assets/images/logo_144x144.png"),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      FadeInUp(
                        child: Text(
                          "Hikaye Dünyası!",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: FadeInUp(
                    delay: Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Yükleniyor..",
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
