import 'package:data/entity/posts/post_entity.dart';
import 'package:domain/model/post.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_response_entity.g.dart';

@JsonSerializable()
class PostResponseEntity extends BaseLayerDataTransformer<PostResponseEntity,List<Post>>{
  @JsonKey(name: "data",defaultValue: [])
  List<PostEntity>? postListEntity;

  PostResponseEntity({this.postListEntity});

  factory PostResponseEntity.fromJson(Map<String,dynamic> json) =>
      _$PostResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PostResponseEntityToJson(this);

  @override
  List<Post>? transform() {
    return postListEntity?.map((e) => e.transform()).toList();
  }
}