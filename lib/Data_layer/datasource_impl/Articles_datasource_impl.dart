
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rootco_task/Data_layer/datasource_contract/Articles_datasource.dart';
import 'package:rootco_task/Data_layer/model/NewsResponse/Articles_Model.dart';
import 'package:rootco_task/Data_layer/model/NewsResponse/NewsResponse_Model.dart';
import 'package:rootco_task/core/api/api_manager.dart';
import 'package:rootco_task/core/api/endpoint.dart';
import 'package:rootco_task/core/constant.dart';

@Injectable(as: ArticlesDataSource)
class ArticlesDataSourceImpl extends ArticlesDataSource{
  ApiManager apiManager;
  @factoryMethod
  ArticlesDataSourceImpl(this.apiManager);
  @override
  Future<Either<NewsResponseModel, String>> getNews(String categoryId) async{
    try{
      var response=await apiManager.getRequest(Endpoint: Endpoint.ArticleEndpoint,queryParameters: {
        "apiKey":Constant.apiKey,
        "country": Constant.country,
        "page":Constant.page,
        "category": categoryId!="ALL"?categoryId:null,
      });
      var ArticlesResponse=NewsResponseModel.fromJson(response.data);
      return left(ArticlesResponse);
    }catch(error){
      return right(error.toString());
    }
  }

}