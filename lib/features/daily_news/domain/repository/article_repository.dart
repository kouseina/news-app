import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // api methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticles(ArticleEntity article);

  Future<void> removeArticles(ArticleEntity article);
}
