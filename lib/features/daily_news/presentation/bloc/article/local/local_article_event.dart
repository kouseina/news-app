// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticle extends LocalArticleEvent {
  const GetSavedArticle();
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle(ArticleEntity entity) : super(article: entity);
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle(ArticleEntity entity) : super(article: entity);
}