// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(children: [
              SvgPicture.asset(
                'assets/vectors/sun-tornado.svg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              )
            ]),
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
                                icon: Text("Podcast",
                                    style: theme.textTheme.bodyLarge)),
                            Tab(
                                icon: Text("Story",
                                    style: theme.textTheme.bodyLarge)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: TabBarView(children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              child: Card(
                                elevation: 8,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 250,
                                        child: Image.asset(
                                            'assets/images/assettwo.jpg',
                                            fit: BoxFit.fitWidth),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 8, left: 8, right: 8),
                                        child: Text(
                                          "Arzın Merkezine Yolculuk",
                                          style: theme.textTheme.headlineLarge!
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 8, left: 8, right: 8),
                                        child: Text(
                                          "Semiha Okan",
                                          style: theme.textTheme.bodyLarge!
                                              .copyWith(color: Colors.black54),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: TextButton(
                                                  onPressed: () => {},
                                                  child: Container(
                                                      child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .menu_book_outlined,
                                                        color: theme.colorScheme
                                                            .secondary,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        "Hemen Oku",
                                                        style: theme.textTheme
                                                            .bodyLarge,
                                                      ),
                                                    ],
                                                  ))),
                                            ),
                                            Container(
                                              child: TextButton(
                                                  onPressed: () => {},
                                                  child: Container(
                                                      child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .spatial_audio_rounded,
                                                        color: theme.colorScheme
                                                            .secondary,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text("Dinle",
                                                          style: theme.textTheme
                                                              .bodyLarge),
                                                    ],
                                                  ))),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                            Container(
                              child: Text("Sayfa2"),
                            ),
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
  }
}
