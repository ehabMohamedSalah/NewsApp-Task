import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@singleton
class ApiManager{
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
         // baseUrl: Constant.baseUrl,
          validateStatus: (status){
            if((status!>=200 && status<300)||status==409){
              return true;
            }
            return false;
          }
      ),);
  }
  Future< Response > getRequest({ required String Endpoint,  Map<String, dynamic>? queryParameters})async{
    var response=await dio.get( Endpoint,queryParameters: queryParameters);
    return response;
  }

  Future<Response> postRequest({required String endpoint,Map<String, dynamic>? body})async{
    var response= await dio.post( endpoint, data: body);
    return response;
  }

}