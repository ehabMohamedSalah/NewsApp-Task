
import 'package:dartz/dartz.dart';
import '../model/NewsResponse/NewsResponse_Model.dart';

abstract class ArticlesDataSource{
  Future<Either<NewsResponseModel, String>> getNews(String categoryId);

}