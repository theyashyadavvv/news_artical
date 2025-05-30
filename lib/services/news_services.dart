import 'package:news_buzz/config/end_points.dart';
import 'package:news_buzz/model/news_data_model.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  Future<List<Article>> fetchNews({String? keyword}) async {
    final base = NewsFeedEndPoints.baseUrl;
    final query = 'q=${keyword == '' ? 'world' : keyword}';
    final apiKey = '&apiKey=${NewsFeedEndPoints.apiKey}';
    final url = base + query + apiKey;
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = NewsDataModel.fromJson(response.body);
        return data.articles;
      } else {
        // when status code is not 200, meaning failed to load data
        throw Exception(
          'Failed to load news: Status code ${response.statusCode}',
        );
      }
    } on http.ClientException catch (e) {
      // HTTP client exceptions
      throw Exception('Network error: ${e.message}');
    } on FormatException catch (e) {
      // JSON parsing errors
      throw Exception('Invalid JSON format: ${e.message}');
    } catch (e) {
      // any other unexpected errors
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
