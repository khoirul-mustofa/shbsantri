class NewsModel {
  int? status;
  String? message;
  int? count;
  List<DataNews>? data;
  int? page;
  int? size;
  int? totalPages;
  int? totalData;
  int? nextPage;
  int? previousPage;

  NewsModel(
      {this.status,
      this.message,
      this.count,
      this.data,
      this.page,
      this.size,
      this.totalPages,
      this.totalData,
      this.nextPage,
      this.previousPage});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = <DataNews>[];
      json['data'].forEach((v) {
        data!.add(DataNews.fromJson(v));
      });
    }
    page = json['page'];
    size = json['size'];
    totalPages = json['total_pages'];
    totalData = json['total_data'];
    nextPage = json['next_page'];
    previousPage = json['previous_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['size'] = size;
    data['total_pages'] = totalPages;
    data['total_data'] = totalData;
    data['next_page'] = nextPage;
    data['previous_page'] = previousPage;
    return data;
  }
}

class DataNews {
  int? id;
  String? title;
  String? content;
  String? video;
  String? image;
  String? pdf;
  String? ppt;
  Category? category;
  User? user;
  String? createdAt;
  String? updatedAt;

  DataNews(
      {this.id,
      this.title,
      this.content,
      this.video,
      this.image,
      this.pdf,
      this.ppt,
      this.category,
      this.user,
      this.createdAt,
      this.updatedAt});

  DataNews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    video = json['video'];
    image = json['image'];
    pdf = json['pdf'];
    ppt = json['ppt'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['video'] = video;
    data['image'] = image;
    data['pdf'] = pdf;
    data['ppt'] = ppt;
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

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? avatar;

  User({this.id, this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['avatar'] = avatar;
    return data;
  }
}
