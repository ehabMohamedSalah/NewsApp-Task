import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rootco_task/Data_layer/datasource_contract/Articles_datasource.dart';
import 'package:rootco_task/Domain_layer/entity/ArticleEntity.dart';
import 'package:rootco_task/Domain_layer/repository_contract/Articles_Repo.dart';

import '../model/NewsResponse/Articles_Model.dart';

@Injectable(as: ArticlesRepo)
class ArticlesRepoImpl extends ArticlesRepo{
  ArticlesDataSource apiDataSource;
  @factoryMethod
  ArticlesRepoImpl(this.apiDataSource);
  @override
  Future<Either<List<ArticleEntity>, String>> getArticles(String categoryId)async {
   var response= await apiDataSource.getNews(categoryId);
   return response.fold(
           (result) {
             var ArticlesListModel= result.articles;
             var ArticlesListEntity=ArticlesListModel?.map((article) => article.toArticleEntity()).toList();
             return left(ArticlesListEntity??[]);
           },
           (error)  {
             return right(error);
           });
  }

}