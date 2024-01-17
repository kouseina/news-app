// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticlesState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUserCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUserCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<GetSavedArticle>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticles);
    on<SaveArticle>(onSaveArticles);
  }

  void onGetSavedArticles(
      GetSavedArticle event, Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticles(
      RemoveArticle event, Emitter<LocalArticlesState> emit) async {
    await _removeArticleUseCase(params: event.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticles(
      SaveArticle event, Emitter<LocalArticlesState> emit) async {
    await _saveArticleUserCase(params: event.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
