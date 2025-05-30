import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BookmarkCubit extends Cubit<List<Map<String, dynamic>>> {
  BookmarkCubit() : super([]) {
    loadBookmarks();
  }

  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('bookmarks');
    if (data != null) {
      emit(List<Map<String, dynamic>>.from(json.decode(data)));
    }
  }

  Future<void> addBookmark(Map<String, dynamic> article) async {
    final updated = List<Map<String, dynamic>>.from(state);
    if (!updated.any((a) => a['url'] == article['url'])) {
      updated.add(article);
      emit(updated);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('bookmarks', json.encode(updated));
    }
  }

  Future<void> removeBookmark(String url) async {
    final updated = state.where((a) => a['url'] != url).toList();
    emit(updated);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('bookmarks', json.encode(updated));
  }
}