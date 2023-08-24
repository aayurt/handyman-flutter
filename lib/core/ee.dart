class ServerErrorModel {
  String? path;
  String? message;

  ServerErrorModel({this.path, this.message});

  ServerErrorModel.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['message'] = message;
    return data;
  }
}
