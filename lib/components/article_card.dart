import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/components/custom_text.dart';
import 'package:news_buzz/constants/k_date_format.dart';
import 'package:news_buzz/model/news_data_model.dart';
import 'package:news_buzz/screens/source_web_view_screen.dart';
import 'package:news_buzz/cubit/bookmark_cubit.dart';

class ArticleCard extends StatelessWidget {
  final List<Article> articles;
  final int index;
  const ArticleCard({super.key, required this.articles, required this.index});

  @override
  Widget build(BuildContext context) {
    final article = articles[index];

    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(0),
        child: BlocBuilder<BookmarkCubit, List<Map<String, dynamic>>>(
          builder: (context, bookmarks) {
            final isBookmarked = bookmarks.any((a) => a['url'] == article.url);

            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleWebView(
                      title: article.sourceName,
                      sourceUrl: article.url,
                    ),
                  ),
                );
              },
              contentPadding: EdgeInsets.all(0),
              minVerticalPadding: 0,
              title: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: FancyShimmerImage(
                  imageUrl: article.urlToImage,
                  boxFit: BoxFit.cover,
                  height: 200,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  spacing: 10,
                  children: [
                    // Headline
                    CustomText(
                      article.title,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(),
                    // Source & Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                          padding: EdgeInsets.all(2),
                          label: CustomText(
                            kFormatDate(article.publishedAt),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          side: BorderSide.none,
                          avatar: Icon(Icons.calendar_month),
                        ),
                        Chip(
                          padding: EdgeInsets.all(2),
                          side: BorderSide.none,
                          label: CustomText(
                            article.sourceName,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          avatar: Icon(Icons.source),
                        ),
                      ],
                    ),
                    // Description
                    CustomText(
                      article.description,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    SizedBox(),
                  ],
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked ? Colors.amber : null,
                ),
                onPressed: () {
                  final articleMap = {
                    'title': article.title,
                    'description': article.description,
                    'url': article.url,
                    'urlToImage': article.urlToImage,
                    'publishedAt': article.publishedAt,
                    'source': {'name': article.sourceName},
                  };
                  if (isBookmarked) {
                    context.read<BookmarkCubit>().removeBookmark(article.url);
                  } else {
                    context.read<BookmarkCubit>().addBookmark(articleMap);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
