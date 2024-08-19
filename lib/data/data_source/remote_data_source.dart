import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:school_app/core/common_strings.dart';
import 'package:school_app/data/model/classroom_model.dart';
import 'package:school_app/data/model/regn_model.dart';
import 'package:school_app/data/model/student_model.dart';
import 'package:school_app/data/model/subject_model.dart';

abstract class RemoteDataSource {
  Future<(List<StudentModel>?, String?)> getStudentsList();
  Future<(StudentModel?, String?)> getStudentDetails(int id);
  Future<(List<SubjectModel>?, String?)> getSubjectsList();
  Future<(SubjectModel?, String?)> getSubjectDetails(int id);
  Future<(List<ClassRoomModel>?, String?)> getClassRooms();
  Future<(List<RegnModel>?, String?)> getRegistrations();
  Future<(String?, String?)> submitRegn(int studentId, int subjectId);
  Future<(String?, String?)> deleteRegn(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({
    required this.client,
  });
  final http.Client client;
  @override
  Future<(List<StudentModel>?, String?)> getStudentsList() async {
    var url = apiBaseUrl + studentsEndPoint;
    final params = {
      'api_key': '55E2d',
    };
    print(" url :$url");

    var uri = Uri.parse(url).replace(queryParameters: params);
    var resp = await http.get(uri);
    print("${resp.statusCode}");
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
    final params = {
      'api_key': '55E2d',
    };
    var uri = Uri.parse(url).replace(queryParameters: params);
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
    final params = {
      'api_key': '55E2d',
    };
    var uri = Uri.parse(url).replace(queryParameters: params);
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

  @override
  Future<(List<RegnModel>?, String?)> getRegistrations() async {
    var url = apiBaseUrl + regnEndPoint;
    final params = {
      'api_key': '55E2d',
    };
    var uri = Uri.parse(url).replace(queryParameters: params);

    var resp = await client.get(uri);

    if (resp.statusCode == 200) {
      var json = (jsonDecode(resp.body) as Map);

      var list = json['registrations'] as List;
      var clsList = list.map((e) => RegnModel.fromJson(e)).toList();

      return (clsList, null);
    } else {
      return (null, resp.body);
    }
  }

  @override
  Future<(String?, String?)> submitRegn(int studentId, int subjectId) async {
    var url = apiBaseUrl + regnEndPoint;
    final params = {
      'api_key': '55E2d',
    };
    var uri = Uri.parse(url).replace(queryParameters: params);
    final data = {
      'student': '$studentId',
      'subject': '$subjectId',
    };
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final res = await client.post(uri, headers: headers, body: data);
    if (res.statusCode == 200) {
      return ("Success", null);
    }
    return (null, "Error");
  }

  @override
  Future<(StudentModel?, String?)> getStudentDetails(int id) async {
    var url = "$apiBaseUrl$studentsEndPoint$id";
    final params = {'api_key': '55E2d'};
    var uri = Uri.parse(url).replace(queryParameters: params);
    var resp = await client.get(uri);

    if (resp.statusCode == 200) {
      var json = (jsonDecode(resp.body) as Map<String, dynamic>);
      return (StudentModel.fromJson(json), null);
    } else {
      return (null, resp.body);
    }
  }

  @override
  Future<(SubjectModel?, String?)> getSubjectDetails(int id) async {
    var url = "$apiBaseUrl$subjectsEndPoint$id";
    final params = {'api_key': '55E2d'};
    var uri = Uri.parse(url).replace(queryParameters: params);
    var resp = await client.get(uri);

    if (resp.statusCode == 200) {
      var json = (jsonDecode(resp.body) as Map<String, dynamic>);
      return (SubjectModel.fromJson(json), null);
    } else {
      return (null, resp.body);
    }
  }

  @override
  Future<(String?, String?)> deleteRegn(int id) async {
    var url = "$apiBaseUrl$regnEndPoint$id";
    final params = {
      'api_key': '55E2d',
    };
    var uri = Uri.parse(url).replace(queryParameters: params);

    final res = await client.delete(uri);
    if (res.statusCode == 200) {
      return ("Success", null);
    }
    return (null, "Error");
  }
}
