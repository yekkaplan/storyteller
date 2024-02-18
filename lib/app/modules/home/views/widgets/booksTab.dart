import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/book_mock_model.dart';
import 'package:getx_skeleton/app/modules/home/controllers/home_controller.dart';

class BooksTab extends GetView<HomeController> {
  const BooksTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BookMockModel> mockList = [
      BookMockModel("Arzın Merkezine Yolculuk", "1",
          "assets/images/assettwo.jpg", 'Semiha Okan'),
      BookMockModel("80 günde devri alem", "2", "assets/images/assetthre.jpg",
          'Semiha Okan'),
      BookMockModel(
          "Dertten müzdarip", "3", "assets/images/assetone.jpg", 'Semiha Okan'),
    ];
    var theme = Theme.of(context);
    return Container(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Card(
              elevation: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Image.asset(
                      mockList[0].asset,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Text(
                      mockList[0].bookName,
                      style: theme.textTheme.headlineLarge!
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Text(
                      mockList[0].author,
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
          ),
          Positioned(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 40,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            top: 150,
            left: 16,
          ),
          Positioned(
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 40,
              ),
              onPressed: () {},
            ),
            top: 150,
            right: 16,
          ),
        ],
      ),
    );
  }
}
