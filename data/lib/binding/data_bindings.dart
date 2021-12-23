import 'package:data/network/rest/api_service.dart';
import 'package:data/network/rest/network_properties.dart';
import 'package:data/network/rest/request/post_request.dart';
import 'package:data/repository/posts/post_repository_impl.dart';
import 'package:data/source/posts/remote/post_datasource_impl.dart';
import 'package:data/source/product_datasource.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/post_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseOptions>(
          () => BaseOptions(baseUrl: NetworkProperties.BASE_URL));
    Get.lazyPut<Dio>(
            () => Dio(Get.find<BaseOptions>()));
    Get.lazyPut<ApiService>(
            () => ApiService(Get.find<Dio>()));
    Get.lazyPut<PostRequest>(
            () => PostRequest(Get.find<ApiService>()));
    Get.lazyPut<PostDataSource>(
            () => PostDataSourceImpl(Get.find<PostRequest>()));
    Get.lazyPut<PostRepository>(
            () => PostRepositoryImpl(Get.find<PostDataSource>()));
  }

}