import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/model/news_data_model.dart';
import 'package:news_buzz/services/news_services.dart';

class NewsFeedCubit extends Cubit<NewsFeedState> {
  NewsFeedCubit() : super(NewsFeedLoading());

  final _newsServices = NewsServices();

  Future<void> getNewsArticles({String? keyword}) async {
    try {
      emit(NewsFeedLoading());
      var articles = await _newsServices.fetchNews(keyword: keyword);
      emit(NewsFeedLoaded(articles: articles));
    } catch (e) {
      emit(NewsFeedFailed(errorMessage: e.toString()));
    }
  }
}

abstract class NewsFeedState {}

class NewsFeedLoading extends NewsFeedState {}

class NewsFeedLoaded extends NewsFeedState {
  final List<Article> articles;
  NewsFeedLoaded({required this.articles});
}

class NewsFeedFailed extends NewsFeedState {
  final String errorMessage;
  NewsFeedFailed({required this.errorMessage});
}
