import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/core/locator.dart';
import 'package:school_app/data/model/student_model.dart';
import 'package:school_app/data/model/subject_model.dart';
import 'package:school_app/data/repository/repository_impl.dart';

class HomeScreenNotifier extends StateNotifier<bool> {
  HomeScreenNotifier() : super(false);

  void toggleView() {
    state = !state;
  }

  submitRegn(int studId, int subjId) async {
    await locator<RepositoryImpl>().submitRegns(studId, subjId);
  }

  Future<(StudentModel?, String?)> getStudentDetails(int studId) async {
    return await locator<RepositoryImpl>().getStudentDetails(studId);
  }

  Future<(SubjectModel?, String?)> getSubjectDetails(int id) async {
    return await locator<RepositoryImpl>().getSubjectDetails(id);
  }

  Future<(String?, String?)> deleteRegn(int id) async {
    return await locator<RepositoryImpl>().deleteRegn(id);
  }
}
