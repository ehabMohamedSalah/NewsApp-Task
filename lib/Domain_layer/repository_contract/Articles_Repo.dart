import 'package:dartz/dartz.dart';
import 'package:rootco_task/Domain_layer/entity/ArticleEntity.dart';

abstract class ArticlesRepo{

  Future<Either<List<ArticleEntity>,String>>getArticles(String categoryId);
}