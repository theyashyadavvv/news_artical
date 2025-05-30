import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/bookmark_cubit.dart';

class BookmarksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmarks')),
      body: BlocBuilder<BookmarkCubit, List<Map<String, dynamic>>>(
        builder: (context, bookmarks) {
          if (bookmarks.isEmpty) {
            return Center(child: Text('No bookmarks yet.'));
          }
          return ListView.builder(
            itemCount: bookmarks.length,
            itemBuilder: (context, i) {
              final article = bookmarks[i];
              return ListTile(
                title: Text(article['title'] ?? ''),
                subtitle: Text(article['source']['name'] ?? ''),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<BookmarkCubit>().removeBookmark(article['url']);
                  },
                ),
                onTap: () {
                  // Open article in WebView or detail page
                },
              );
            },
          );
        },
      ),
    );
  }
}