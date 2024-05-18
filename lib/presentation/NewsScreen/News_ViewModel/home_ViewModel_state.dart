part of 'home_ViewModel_cubit.dart';

@immutable
sealed class NewsViewModelState {}
final class NewsViewModelInitial extends NewsViewModelState {}
class HomeViewModelLoading extends  NewsViewModelState{}
class NewsViewModelError extends NewsViewModelState{
  String? errorMessage;
  NewsViewModelError(this.errorMessage);
}
class NewsViewModelSuccess extends NewsViewModelState{
  List<ArticleEntity> articles;
  NewsViewModelSuccess(this.articles);
}
