// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/dashboard_button.dart';
import 'package:getx_skeleton/app/modules/home/views/widgets/last_reads_tab.dart';
import 'package:getx_skeleton/app/modules/home/views/widgets/stories_tab.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLargeScreen = Get.width > 600;
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    'assets/vectors/sun-tornado.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top + 8,
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(isLargeScreen ? 24 : 16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Hero(
                            tag: 'HeroSplash',
                            child: Image.asset('assets/images/logo_144x144.png',
                                fit: BoxFit.contain, height: 100, width: 100),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          child: DefaultTabController(
                            length: 2,
                            child: Column(
                              children: [
                                TabBar(
                                  labelColor: Get.theme.primaryColor,
                                  unselectedLabelColor: Colors.grey,
                                  indicatorColor: Get.theme.primaryColor,
                                  tabs: [
                                    Tab(
                                      text: "Hikayeler",
                                    ),
                                    Tab(
                                      text: "Son Okunanlar",
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      StoriesColumn(controller: controller),
                                      LastReadsColumn(controller: controller),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LastReadsColumn extends StatelessWidget {
  const LastReadsColumn({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LastReadsTab(controller: controller),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DashboardButton(onPressed: () => {Get.toNamed('allview')}),
        ),
      ],
    );
  }
}

class StoriesColumn extends StatelessWidget {
  const StoriesColumn({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StoriesTab(controller: controller),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: DashboardButton(onPressed: () => {Get.toNamed('allview')})),
      ],
    );
  }
}
