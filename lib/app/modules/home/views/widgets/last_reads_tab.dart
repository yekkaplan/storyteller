import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/home/controllers/home_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

class LastReadsTab extends GetView<HomeController> {
  final HomeController controller;
  const LastReadsTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      child: Stack(
        children: [
          Obx(() => Container(
                padding: EdgeInsets.only(left: 4, right: 4),
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
                            width: Get.width,
                            height: Get.height *
                                0.2, // Resim yüksekliği ekran yüksekliğinin %20'si
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
                          style: Get.theme.textTheme.headlineLarge!
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                              onPressed: () => {},
                              icon: Icon(
                                Icons.menu_book_outlined,
                                color: theme.colorScheme.secondary,
                              ),
                              label: Text(
                                "Hemen Oku",
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () => {},
                              icon: Icon(
                                Icons.spatial_audio_rounded,
                                color: theme.colorScheme.secondary,
                              ),
                              label: Text(
                                "Dinle",
                                style: theme.textTheme.bodyLarge,
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  controller
                      .updateCurrentIndex(controller.currentIndex.value - 1);
                },
              ),
            ),
            top: Get.height *
                0.1, // Butonun yüksekliği ekran yüksekliğinin %10'u
            left: 16,
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  controller
                      .updateCurrentIndex(controller.currentIndex.value + 1);
                },
              ),
            ),
            top: Get.height *
                0.1, // Butonun yüksekliği ekran yüksekliğinin %10'u
            right: 16,
          ),
        ],
      ),
    );
  }
}
