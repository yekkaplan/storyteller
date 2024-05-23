import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/book_mock_model.dart';

class ReadController extends GetxController {
  final List<BookMockModel> mockBookList = [
    BookMockModel(
      bookName: "Arzın Merkezine Yolculuk",
      id: "1",
      asset: "assets/images/assettwo.jpg",
      author: 'Semiha Okan',
      summary:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr',
      readCount: '99',
      rating: 4.5,
    ),
    BookMockModel(
      bookName: "80 günde devri alem",
      id: "2",
      asset: "assets/images/assetthre.jpg",
      author: 'Semiha Okan',
      summary:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr',
      readCount: '88',
      rating: 3.8,
    ),
    BookMockModel(
      bookName: "Dertten müzdarip",
      id: "3",
      asset: "assets/images/assetone.jpg",
      author: 'Semiha Okan',
      summary:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr',
      readCount: '88',
      rating: 4.0,
    ),
    // Diğer kitapları benzer şekilde ekleyebilirsiniz
  ].obs;

  RxInt currentIndex = 0.obs;

  void updateCurrentIndex(int index) {
    if (index == mockBookList.length) {
      index = 0;
    }
    if (index < 0) {
      index = mockBookList.length - 1;
    }
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
