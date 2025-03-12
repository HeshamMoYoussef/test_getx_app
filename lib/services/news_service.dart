import 'package:get/get.dart';
import 'package:test_app/model/news_model.dart';

// The Services Class will be used to call the API
class NewsServices extends GetConnect implements GetxService {
  Future<NewsApi> getNewsData() async {
    var response = await get(
      'https://newsapi.org/v2/everything?q=apple&from=2025-03-09&to=2025-03-09&sortBy=popularity&apiKey=a1a230a06cf74108b4843311b6b29641',
    );
    // log("***!!! Get Response Body !!!*** ${response.body}");

    return NewsApi.fromJson(response.body);
  }

  void postData() async {
    await post('URL', {});
  }

  void putData() async {
    await put('URL', {});
  }

  void deleteData() async {
    await delete('URL');
  }
}
