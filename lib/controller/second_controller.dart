import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_app/model/news_model.dart';
import 'package:test_app/services/news_service.dart';

// The Controller Class to call the API and Control the UI States (Update) of the App
class SecondController extends GetxController {
  NewsApi? newsApi;

  @override
  void onInit() {
    getNews();
    super.onInit();
    log('onInit');
  }

  Future<NewsApi> getNews() async {
    newsApi = await NewsServices().getNewsData();
    // call update() to update the UI (Set State)
    update();
    return newsApi!;
  }
}
