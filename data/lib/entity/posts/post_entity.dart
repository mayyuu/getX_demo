
import 'package:domain/model/post.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_entity.g.dart';

@JsonSerializable()
class PostEntity implements BaseLayerDataTransformer<PostEntity, Post>{
  @JsonKey(defaultValue: 0)
  final int? id;
  @JsonKey(name: "user_id",defaultValue: 0)
  final int? userId;

  PostEntity({this.id, this.userId, this.title, this.body});

  @JsonKey(defaultValue: '')
  final String? title;
  @JsonKey(defaultValue: '')
  final String? body;

  factory PostEntity.fromJson(Map<String,dynamic> json) =>
      _$PostEntityFromJson(json);

  Map<String,dynamic> toJson() => _$PostEntityToJson(this);

  @override
  PostEntity? restore(Post? data) {
    return PostEntity(id: data?.id,body: data?.body,title: data?.title,userId: data?.userId);
  }

  @override
  Post transform() {
    return Post(userId: userId,title: title,body: body,id: id);
  }

}