import 'package:clean_archit/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_archit/features/daily_news/data/repository/article_repository.dart';
import 'package:clean_archit/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_archit/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_archit/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;

Future<void> initializeDependencies()async{
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepositoryImpl>(ArticleRepositoryImpl(sl()));
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerFactory<RemoteArticle>(() => RemoteArticle(sl()));
}