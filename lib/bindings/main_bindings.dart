import 'package:domain/repository/post_repository.dart';
import 'package:domain/usecase/get_post_details_usecase.dart';
import 'package:domain/usecase/get_post_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:getx_pattern_demo/main/app_vm.dart';
import 'package:data/network/rest/api_service.dart';
import 'package:data/network/rest/network_properties.dart';
import 'package:data/network/rest/request/post_request.dart';
import 'package:data/repository/posts/post_repository_impl.dart';
import 'package:data/source/posts/remote/post_datasource_impl.dart';
import 'package:data/source/product_datasource.dart';
import 'package:dio/dio.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseOptions>(
            () => BaseOptions(baseUrl: NetworkProperties.BASE_URL),fenix: true);
    Get.lazyPut<Dio>(
            () => Dio(Get.find<BaseOptions>()),fenix: true);
    Get.lazyPut<ApiService>(
            () => ApiService(Get.find<Dio>()),fenix: true);
    Get.lazyPut<PostRequest>(
            () => PostRequest(Get.find<ApiService>()),fenix: true);
    Get.lazyPut<PostDataSource>(
            () => PostDataSourceImpl(Get.find<PostRequest>()),fenix: true);
    Get.lazyPut<PostRepository>(
            () => PostRepositoryImpl(Get.find<PostDataSource>()),fenix: true);
    Get.lazyPut<GetPostUseCase>(
            () => GetPostUseCase(Get.find<PostRepository>()),fenix: true);
    Get.lazyPut<GetPostDetailsUseCase>(
            () => GetPostDetailsUseCase(Get.find<PostRepository>()),fenix: true);
    Get.lazyPut<AppVM>(
            () => AppVM(),fenix: true);
  }

}