import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/book_mock_model.dart';
import 'package:getx_skeleton/app/modules/home/controllers/home_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

class BooksTab extends GetView<HomeController> {
  final HomeController controller;
  const BooksTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: Stack(
        children: [
          Obx(() => Container(
                padding: EdgeInsets.all(8),
                child: Card(
                  elevation: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.READ);
                        },
                        child: Hero(
                          tag: 'Test!',
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            child: Image.asset(
                              controller
                                  .mockBookList[controller.currentIndex.value]
                                  .asset,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Text(
                          controller.mockBookList[controller.currentIndex.value]
                              .bookName,
                          style: theme.textTheme.headlineLarge!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Text(
                          controller.mockBookList[controller.currentIndex.value]
                              .author,
                          style: theme.textTheme.bodyLarge!
                              .copyWith(color: Colors.black54),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Text(
                          controller.mockBookList[controller.currentIndex.value]
                              .summary,
                          style: theme.textTheme.bodySmall!
                              .copyWith(color: Colors.black54),
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: TextButton(
                                onPressed: () => {},
                                child: Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.menu_book_outlined,
                                        color: theme.colorScheme.secondary,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Hemen Oku",
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                onPressed: () => {},
                                child: Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.spatial_audio_rounded,
                                        color: theme.colorScheme.secondary,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Dinle",
                                        style: theme.textTheme.bodyLarge,
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
              )),
          Positioned(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {
                controller
                    .updateCurrentIndex(controller.currentIndex.value - 1);
              },
            ),
            top: 150,
            left: 16,
          ),
          Positioned(
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {
                controller
                    .updateCurrentIndex(controller.currentIndex.value + 1);
              },
            ),
            top: 150,
            right: 16,
          ),
        ],
      ),
    );
  }
}
