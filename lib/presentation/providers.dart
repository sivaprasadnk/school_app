import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/core/locator.dart';
import 'package:school_app/data/model/classroom_model.dart';
import 'package:school_app/data/model/regn_model.dart';
import 'package:school_app/data/model/student_model.dart';
import 'package:school_app/data/model/subject_model.dart';
import 'package:school_app/data/repository/repository_impl.dart';
import 'package:school_app/domain/use_cases/get_classes.dart';
import 'package:school_app/domain/use_cases/get_registrations.dart';
import 'package:school_app/domain/use_cases/get_students.dart';
import 'package:school_app/domain/use_cases/get_subjects.dart';
import 'package:school_app/presentation/classroom_data.dart';
import 'package:school_app/presentation/notifiers/class_room_notifier.dart';
import 'package:school_app/presentation/notifiers/home_screen_notifier.dart';
import 'package:school_app/presentation/regn_data.dart';

final homeScreenNotifierProvider =
    StateNotifierProvider<HomeScreenNotifier, bool>(
        (ref) => HomeScreenNotifier());

final classroomNotifierProvider =
    StateNotifierProvider<ClassroomNotifier, List<ClassroomData>>(
        (ref) => ClassroomNotifier());

final regnNotifierProvider =
    StateNotifierProvider<RegnNotifier, List<RegnData>>(
        (ref) => RegnNotifier());

final getStudentsProvider =
    FutureProvider.autoDispose<(List<StudentModel>?, String?)>((ref) async {
  return GetStudents(repositoryImpl: locator<RepositoryImpl>()).call();
});

final getSubjectsProvider =
    FutureProvider.autoDispose<(List<SubjectModel>?, String?)>((ref) async {
  return GetSubjects(repositoryImpl: locator<RepositoryImpl>()).call();
});

final getClassProvider =
    FutureProvider.autoDispose<(List<ClassRoomModel>?, String?)>((ref) async {
  return GetClasses(repositoryImpl: locator<RepositoryImpl>()).call();
});

final getRegnProvider =
    FutureProvider.autoDispose<(List<RegnModel>?, String?)>((ref) async {
  return GetRegistrations(repositoryImpl: locator<RepositoryImpl>()).call();
});
