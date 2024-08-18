import 'dart:convert';

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
    var uri = Uri.parse(url);
    var resp = await client.get(uri);

    if (resp.statusCode == 200) {
      var json = (jsonDecode(resp.body) as Map);

      var list = json['students'] as List;
      var studList = list.map((e) => StudentModel.fromJson(e)).toList();

      return (studList, null);
    } else {
      return (null, resp.body);
    }
  }

  @override
  Future<(List<SubjectModel>?, String?)> getSubjectsList() async {
    var url = apiBaseUrl + subjectsEndPoint;
    var uri = Uri.parse(url);
    var resp = await client.get(uri);

    if (resp.statusCode == 200) {
      var json = (jsonDecode(resp.body) as Map);

      var list = json['subjects'] as List;
      var subjList = list.map((e) => SubjectModel.fromJson(e)).toList();

      return (subjList, null);
    } else {
      return (null, resp.body);
    }
  }

  @override
  Future<(List<ClassRoomModel>?, String?)> getClassRooms() async {
    var url = apiBaseUrl + clssroomsEndPoint;
    var uri = Uri.parse(url);
    var resp = await client.get(uri);

    if (resp.statusCode == 200) {
      var json = (jsonDecode(resp.body) as Map);

      var list = json['classrooms'] as List;
      var clsList = list.map((e) => ClassRoomModel.fromJson(e)).toList();

      return (clsList, null);
    } else {
      return (null, resp.body);
    }
  }
}
