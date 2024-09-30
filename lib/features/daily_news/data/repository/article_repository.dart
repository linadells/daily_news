import 'dart:io';

import 'package:clean_archit/core/constants.dart/constants.dart';
import 'package:clean_archit/core/resouces/data_state.dart';
import 'package:clean_archit/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_archit/features/daily_news/domain/entities/article.dart';
import 'package:clean_archit/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  const ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    DataState<List<ArticleEntity>> res;

    try {
      final httpResponce = await _newsApiService.getNewsArticles(
          apiKey: newsAPIKey,
          country: newsAPICountry,
          category: newsAPICategory);

      if (httpResponce.response.statusCode == HttpStatus.ok) {
        res = DataSuccess<List<ArticleEntity>>(httpResponce.data)
            as DataState<List<ArticleEntity>>;
        return res;
      } else {
        res = DataFailed(DioException(
                requestOptions: RequestOptions(),
                error: httpResponce.response.statusMessage,
                response: httpResponce.response,
                type: DioExceptionType.badResponse))
            as DataState<List<ArticleEntity>>;
        return res;
      }
    } on DioException catch (e) {
      res = DataFailed(e) as DataState<List<ArticleEntity>>;
      return res;
    }
  }
}
