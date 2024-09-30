import 'package:clean_archit/core/resouces/data_state.dart';
import 'package:clean_archit/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository{
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}