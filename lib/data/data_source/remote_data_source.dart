import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_app/core/common_strings.dart';
import 'package:school_app/data/model/classroom_model.dart';
import 'package:school_app/data/model/student_model.dart';
import 'package:school_app/data/model/subject_model.dart';

abstract class RemoteDataSource {
  Future<(List<StudentModel>?, String?)> getStudentsList();
  Future<(List<SubjectModel>?, String?)> getSubjectsList();
  Future<(List<ClassRoomModel>?, String?)> getClassRooms();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({
    required this.client,
  });
  final http.Client client;
  @override
  Future<(List<StudentModel>?, String?)> getStudentsList() async {
    var url = apiBaseUrl + studentsEndPoint;
    debugPrint("url $url");
    var uri = Uri.parse(url);
    var resp = await client.get(uri);
    debugPrint("response :${resp.body}");
    debugPrint("statusCode :${resp.statusCode}");

    if (resp.statusCode == 200) {
      var json = (jsonDecode(resp.body) as Map);

      var list = json['students'] as List;
      debugPrint("list :$list");
      var studList = list.map((e) => StudentModel.fromJson(e)).toList();
      debugPrint("studList :${studList.length}");

      return (studList, null);
    } else {
      return (null, resp.body);
    }
  }

  @override
  Future<(List<SubjectModel>?, String?)> getSubjectsList() async {
    var url = apiBaseUrl + subjectsEndPoint;
    debugPrint("url $url");
    var uri = Uri.parse(url);
    var resp = await client.get(uri);
    debugPrint("response :${resp.body}");
    debugPrint("statusCode :${resp.statusCode}");

    if (resp.statusCode == 200) {
      var json = (jsonDecode(resp.body) as Map);

      var list = json['subjects'] as List;
      debugPrint("list :$list");
      var subjList = list.map((e) => SubjectModel.fromJson(e)).toList();
      debugPrint("subjList :${subjList.length}");

      return (subjList, null);
    } else {
      return (null, resp.body);
    }
  }

  @override
  Future<(List<ClassRoomModel>?, String?)> getClassRooms() async {
    var url = apiBaseUrl + clssroomsEndPoint;
    debugPrint("url $url");
    var uri = Uri.parse(url);
    var resp = await client.get(uri);
    debugPrint("response :${resp.body}");
    debugPrint("statusCode :${resp.statusCode}");

    if (resp.statusCode == 200) {
      var json = (jsonDecode(resp.body) as Map);

      var list = json['classrooms'] as List;
      debugPrint("list :$list");
      var clsList = list.map((e) => ClassRoomModel.fromJson(e)).toList();
      debugPrint("clsList :${clsList.length}");

      return (clsList, null);
    } else {
      return (null, resp.body);
    }
  }
}
