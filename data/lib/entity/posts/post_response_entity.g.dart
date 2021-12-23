// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponseEntity _$PostResponseEntityFromJson(Map<String, dynamic> json) =>
    PostResponseEntity(
      postListEntity: (json['data'] as List<dynamic>?)
              ?.map((e) => PostEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PostResponseEntityToJson(PostResponseEntity instance) =>
    <String, dynamic>{
      'data': instance.postListEntity,
    };
