import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rootco_task/Domain_layer/entity/ArticleEntity.dart';

import '../../../Data_layer/model/NewsResponse/Articles_Model.dart';
import '../../../Domain_layer/usecase/Articles_usecase.dart';

part 'home_ViewModel_state.dart';

@injectable
class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  ArticlesUsecase articlesUsecase;
  @factoryMethod
  HomeViewModelCubit(this.articlesUsecase) : super(HomeViewModelInitial());
  static HomeViewModelCubit get(BuildContext context)=>BlocProvider.of(context);


  getArticle(String categoryID)async{
    emit(HomeViewModelLoading());
   var response=await articlesUsecase.call(categoryID);
   response.fold(
           (articles) => emit(HomeViewModelSuccess(articles)),
           (error) => emit(HomeViewModelError(error)));
  }
}
