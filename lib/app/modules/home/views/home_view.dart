// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/book_mock_model.dart';
import 'package:getx_skeleton/app/modules/home/views/widgets/books-tab.dart';
import 'package:getx_skeleton/app/modules/home/views/widgets/stories-tab.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                child: SvgPicture.asset(
                  'assets/vectors/sun-tornado.svg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 64,
                  ),
                  Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/owl.png'),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Discover. Learn. Develop.",
                    style: theme.textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32))),
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          Container(
                            child: TabBar(
                              tabs: [
                                Tab(
                                  icon: Text("Books",
                                      style: theme.textTheme.bodyLarge),
                                ),
                                Tab(
                                    icon: Text("Stories",
                                        style: theme.textTheme.bodyLarge)),
                                Tab(
                                    icon: Text("Last Reads",
                                        style: theme.textTheme.bodyLarge)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: TabBarView(children: [
                                BooksTab(controller: controller),
                                StoriesTab(controller: controller),
                                Container(
                                  child: Text("Sayfa3"),
                                )
                              ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
