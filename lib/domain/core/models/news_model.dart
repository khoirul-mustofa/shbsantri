import 'package:shbsantri/domain/core/models/category_model.dart';
import 'package:shbsantri/domain/core/models/user_model.dart';

class NewsModel {
  int? id;
  String? title;
  String? content;
  String? video;
  String? image;
  CategoryModel? category;
  UserModel? user;
  String? createdAt;
  String? updatedAt;

  NewsModel(
      {this.id,
      this.title,
      this.content,
      this.video,
      this.category,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.image});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    video = json['video'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['video'] = video;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
