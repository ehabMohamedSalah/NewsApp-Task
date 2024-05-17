part of 'home_ViewModel_cubit.dart';

@immutable
sealed class HomeViewModelState {}
final class HomeViewModelInitial extends HomeViewModelState {}
class HomeViewModelLoading extends  HomeViewModelState{}
class HomeViewModelError extends HomeViewModelState{
  String? errorMessage;
  HomeViewModelError(this.errorMessage);
}
class HomeViewModelSuccess extends HomeViewModelState{
  List<ArticleEntity> articles;
  HomeViewModelSuccess(this.articles);
}
