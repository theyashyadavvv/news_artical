import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_buzz/components/article_card.dart';
import 'package:news_buzz/components/custom_text.dart';
import 'package:news_buzz/components/theme_switcher.dart';
import 'package:news_buzz/cubit/news_feed_cubit.dart';
import 'package:news_buzz/model/news_data_model.dart';
import 'package:news_buzz/screens/bookmarks_page.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  late List<Article> fetchedArticles;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<NewsFeedCubit>().getNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF5F6D), Color(0xFFFFC371)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 16,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      color: Colors.white.withOpacity(0.93),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4, // Reduced margin
                        vertical: 8,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4, // Reduced padding
                          vertical: 8,
                        ),
                        child: Column(
                          children: [
                            // AppBar replacement
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: kToolbarHeight - 10,
                                    child: SearchBar(
                                      controller: searchController,
                                      hintText: 'Search anything',
                                      trailing: [const Icon(Icons.search)],
                                      elevation: const WidgetStatePropertyAll(
                                        2,
                                      ),
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                      ),
                                      side: const WidgetStatePropertyAll(
                                        BorderSide.none,
                                      ),
                                      backgroundColor: WidgetStatePropertyAll(
                                        Theme.of(
                                          context,
                                        ).colorScheme.secondaryContainer,
                                      ),
                                      onSubmitted: (value) {
                                        if (value.isNotEmpty) {
                                          context
                                              .read<NewsFeedCubit>()
                                              .getNewsArticles(keyword: value);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.bookmarks),
                                  tooltip: 'Bookmarks',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => BookmarksPage(),
                                      ),
                                    );
                                  },
                                ),
                                ThemeSwitcher(),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: BlocBuilder<NewsFeedCubit, NewsFeedState>(
                                builder: (context, state) {
                                  if (state is NewsFeedLoaded) {
                                    fetchedArticles = state.articles;
                                    if (state.articles.isEmpty) {
                                      return Center(
                                        child: CustomText(
                                          "No articles available",
                                        ),
                                      );
                                    }
                                    return RefreshIndicator.adaptive(
                                      onRefresh: () async {
                                        context
                                            .read<NewsFeedCubit>()
                                            .getNewsArticles(
                                              keyword: searchController.text,
                                            );
                                      },
                                      child: ListView.builder(
                                        itemCount: fetchedArticles.length,
                                        itemBuilder: (
                                          BuildContext context,
                                          int index,
                                        ) {
                                          return ArticleCard(
                                            articles: fetchedArticles,
                                            index: index,
                                          );
                                        },
                                      ),
                                    );
                                  }
                                  if (state is NewsFeedFailed) {
                                    return Center(
                                      child: CustomText(
                                        state.errorMessage,
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  }
                                  return Center(
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
