import 'dart:convert';
import 'dart:html';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.project,
    required this.article,
    required this.granularity,
    required this.timestap,
    required this.access,
    required this.agent,
    required this.views,
  });

  String project;
  String article;
  String granularity;
  String timestap;
  String access;
  String agent;
  int views;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        project: json["project"],
        article: json["article"],
        granularity: json["granularity"],
        timestap: json["timestap"],
        access: json["access"],
        agent: json["agent"],
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "project": project,
        "article": article,
        "granularity": granularity,
        "timestap": timestap,
        "access": access,
        "agent": agent,
        "views": views,
      };
}
