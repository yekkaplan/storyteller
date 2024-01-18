// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 100, // Buradaki değeri değiştirin
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Aurora"),
                background: Container(
                  padding: EdgeInsets.all(16),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage("assets/images/logo.png"),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(text: 'Tab 1'),
                        Tab(text: 'Tab 2'),
                      ],
                    ),
                    TabBarView(
                      children: [
                        // Tab 1 içeriği
                        Container(
                          child: Center(
                            child: Text('Tab 1 Content'),
                          ),
                        ),
                        // Tab 2 içeriği
                        Container(
                          child: Center(
                            child: Text('Tab 2 Content'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
