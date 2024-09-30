import 'package:clean_archit/core/resouces/data_state.dart';
import 'package:clean_archit/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_event.dart';
import 'package:clean_archit/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_archit/features/daily_news/domain/usecases/get_article.dart';

class RemoteArticle extends Bloc<RemoteArticleEvent, RemoteArticleState>{
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticle(this._getArticleUseCase): super(const RemoteArticlesLoading()){
    on<GetArticles>(onGetArticles);
  }

  Future<void> onGetArticles(GetArticles event, Emitter<RemoteArticleState> emmit) async {
    final dataState=await _getArticleUseCase();
    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(RemoteArticlesDone(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}