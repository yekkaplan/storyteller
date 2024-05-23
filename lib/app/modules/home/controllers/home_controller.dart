import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/book_mock_model.dart';

class HomeController extends GetxController {
  var mockBookList = [
    BookMockModel(
      bookName: "Arzın Merkezine Yolculuk",
      id: "1",
      asset: "assets/images/assetone.jpg",
      author: 'Semiha Okan',
      summary:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr',
      readCount: '99',
      rating: 4.2,
    ),
    BookMockModel(
      bookName: "80 günde devri alem",
      id: "2",
      asset: "assets/images/assettwo.jpg",
      author: 'Semiha Okan',
      summary:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr',
      readCount: '88',
      rating: 3.8,
    ),
    BookMockModel(
      bookName: "Dertten müzdarip",
      id: "3",
      asset: "assets/images/logo.png",
      author: 'Semiha Okan',
      summary:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr',
      readCount: '88',
      rating: 4.1,
    ),
    BookMockModel(
      bookName: "Arzın Merkezine Yolculuk",
      id: "1",
      asset: "assets/images/assettwo.jpg",
      author: 'Semiha Okan',
      summary:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr',
      readCount: '99',
      rating: 4.3,
    ),
    BookMockModel(
      bookName: "80 günde devri alem",
      id: "2",
      asset: "assets/images/assetone.jpg",
      author: 'Semiha Okan',
      summary:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr',
      readCount: '88',
      rating: 3.8,
    ),
    BookMockModel(
      bookName: "Dertten müzdarip",
      id: "3",
      asset: "assets/images/assetthre.jpg",
      author: 'Semiha Okan',
      summary:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr',
      readCount: '88',
      rating: 4.0,
    ),
    BookMockModel(
      bookName: "Dertten müzdarip",
      id: "3",
      asset: "assets/images/assetthre.jpg",
      author: 'Semiha Okan',
      summary:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr',
      readCount: '88',
      rating: 1.0,
    ),
    BookMockModel(
      bookName: "Dertten müzdarip",
      id: "3",
      asset: "assets/images/assetthre.jpg",
      author: 'Semiha Okan',
      summary:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr',
      readCount: '88',
      rating: 3.0,
    ),
    // Diğer kitapları benzer şekilde ekleyebilirsiniz
  ].obs;
  var currentIndex = 0.obs;
  var sortedBookList = <BookMockModel>[].obs;
  var sortOption = 'Puan'.obs;

  @override
  void onInit() {
    super.onInit();
    sortedBookList.assignAll(mockBookList);
    sortBooks();
  }

  void updateCurrentIndex(int index) {
    if (index >= 0 && index < mockBookList.length) {
      currentIndex.value = index;
    }
  }

  void sortBooks() {
    if (sortOption.value == 'Puan') {
      sortedBookList.sort((a, b) => b.rating.compareTo(a.rating));
    } else if (sortOption.value == 'İsim') {
      sortedBookList.sort((a, b) => a.bookName.compareTo(b.bookName));
    }
  }

  void setSortOption(String option) {
    sortOption.value = option;
    sortBooks();
  }
}
