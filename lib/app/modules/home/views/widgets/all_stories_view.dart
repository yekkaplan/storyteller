import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AllBooksView extends GetView<HomeController> {
  const AllBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tüm Kitaplar"),
        backgroundColor: theme.colorScheme.secondary,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.sort),
                            Text(
                              "Sıralama Türü ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(() {
                      return DropdownButton<String>(
                        value: controller.sortOption.value,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.setSortOption(newValue);
                          }
                        },
                        items: <String>['Puan', 'İsim']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        underline: Container(),
                        icon: Icon(Icons.arrow_drop_down,
                            color: theme.colorScheme.secondary),
                        style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontSize: 16,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: Obx(() {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: size.width > 600 ? 3 : 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: controller.sortedBookList.length,
                    itemBuilder: (context, index) {
                      var book = controller.sortedBookList[index];
                      double rating = book.rating;

                      return GestureDetector(
                        onTap: () {
                          Get.toNamed('/read', arguments: book);
                        },
                        child: Hero(
                          tag: 'book_${book.bookName}',
                          child: Card(
                            elevation: 12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            shadowColor: Colors.black54,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16)),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          book.asset,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.black.withOpacity(0.7),
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        book.bookName,
                                        style:
                                            theme.textTheme.headline6!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        book.author,
                                        style:
                                            theme.textTheme.subtitle2!.copyWith(
                                          color: Colors.black54,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        book.summary,
                                        style:
                                            theme.textTheme.bodyText2!.copyWith(
                                          color: Colors.black54,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 8),
                                      RatingBarIndicator(
                                        rating: rating,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Okunma Sayısı: ${book.readCount}",
                                            style: theme.textTheme.caption!
                                                .copyWith(
                                              color: Colors.black45,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 20,
                                            color: theme.primaryColor,
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
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
