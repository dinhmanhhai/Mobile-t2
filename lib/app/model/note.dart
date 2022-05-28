class NoteUserResponse {
  bool? status;
  String? message;
  int? httpCode;
  List<NoteUser>? data;
  String? errorCode;

  NoteUserResponse(
      {this.status, this.message, this.httpCode, this.data, this.errorCode});

  NoteUserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    httpCode = json['httpCode'];
    if (json['data'] != null) {
      data = <NoteUser>[];
      json['data'].forEach((v) {
        data!.add(new NoteUser.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['httpCode'] = this.httpCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['errorCode'] = this.errorCode;
    return data;
  }
}

class NoteUser {
  int? id;
  String? userId;
  String? title;
  String? content;
  String? createTime;
  String? modifyTime;
  bool? completed;
  bool? isDeleted;
  String? color;

  NoteUser(
      {this.id,
        this.userId,
        this.title,
        this.content,
        this.createTime,
        this.modifyTime,
        this.completed,
        this.isDeleted,
        this.color});

  NoteUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    content = json['content'];
    createTime = json['createTime'];
    modifyTime = json['modifyTime'];
    completed = json['completed'];
    isDeleted = json['isDeleted'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['createTime'] = this.createTime;
    data['modifyTime'] = this.modifyTime;
    data['completed'] = this.completed;
    data['isDeleted'] = this.isDeleted;
    data['color'] = this.color;
    return data;
  }
}