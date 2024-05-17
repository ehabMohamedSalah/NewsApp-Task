import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rootco_task/Domain_layer/repository_contract/Articles_Repo.dart';
import '../entity/ArticleEntity.dart';

@injectable
class ArticlesUsecase{
  ArticlesRepo articlesRepo;
  @factoryMethod
  ArticlesUsecase(this.articlesRepo);
  Future<Either<List<ArticleEntity>, String>> call(String CategoryID){
   return articlesRepo.getArticles(CategoryID);
  }
}