// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/home/views/widgets/books-tab.dart';
import 'package:getx_skeleton/app/modules/home/views/widgets/stories-tab.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    var isLargeScreen = size.width > 600;

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
                            child: Image.asset(
                              'assets/images/logo_144x144.png',
                              fit: BoxFit.contain,
                              height: isLargeScreen ? 160 : 120,
                              width: isLargeScreen ? 160 : 120,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Discover. Learn. Develop.",
                        style: theme.textTheme.headline4?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isLargeScreen ? 32 : 24,
                        ),
                        textAlign: TextAlign.center,
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
                                  labelColor: theme.primaryColor,
                                  unselectedLabelColor: Colors.grey,
                                  indicatorColor: theme.primaryColor,
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
                                      Column(
                                        children: [
                                          Expanded(
                                            child: BooksTab(
                                                controller: controller),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: OutlinedButton(
                                              onPressed: () {
                                                Get.toNamed('allview');
                                              },
                                              style: OutlinedButton.styleFrom(
                                                side: BorderSide(
                                                    color: theme
                                                        .colorScheme.secondary),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 24),
                                              ),
                                              child: Text(
                                                "Tüm Hikayeleri Göster",
                                                style: theme.textTheme.button
                                                    ?.copyWith(
                                                  color: theme
                                                      .colorScheme.secondary,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Expanded(
                                            child: StoriesTab(
                                                controller: controller),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: OutlinedButton(
                                              onPressed: () {
                                                Get.toNamed('allview');
                                              },
                                              style: OutlinedButton.styleFrom(
                                                side: BorderSide(
                                                    color: theme
                                                        .colorScheme.secondary),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 24),
                                              ),
                                              child: Text(
                                                "Tüm Okunanları Göster",
                                                style: theme.textTheme.button
                                                    ?.copyWith(
                                                  color: theme
                                                      .colorScheme.secondary,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
