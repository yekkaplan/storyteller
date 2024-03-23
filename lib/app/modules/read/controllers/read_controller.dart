import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/book_mock_model.dart';

class ReadController extends GetxController {
  final List<BookMockModel> mockBookList = [
    BookMockModel(
        "Arzın Merkezine Yolculuk",
        "1",
        "assets/images/assettwo.jpg",
        'Semiha Okan',
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr'),
    BookMockModel(
        "80 günde devri alem",
        "2",
        "assets/images/assetthre.jpg",
        'Semiha Okan',
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr'),
    BookMockModel(
        "Dertten müzdarip",
        "3",
        "assets/images/assetone.jpg",
        'Semiha Okan',
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr'),
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
