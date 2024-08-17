import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/domain/entity/classroom.dart';
import 'package:school_app/domain/entity/subject.dart';

class ClassroomData {
  Subject? subject;
  ClassRoom? classroom;
  ClassroomData({
    required this.subject,
    required this.classroom,
  });
}

class ClassroomNotifier extends StateNotifier<List<ClassroomData>> {
  ClassroomNotifier() : super([]);

  assignSubject(Subject? subject, ClassRoom classRoom) {
    var classData = state.firstWhere(
      (element) => element.classroom!.id == classRoom.id,
      orElse: () => ClassroomData(subject: null, classroom: null),
    );
    var classIndex =
        state.indexWhere((element) => element.classroom == classData.classroom);
    state[classIndex] = ClassroomData(subject: subject, classroom: classRoom);
    state = [...state];
  }

  initialiseClass(ClassRoom classRoom) {
    if (state.isEmpty) {
      state.add(ClassroomData(subject: null, classroom: classRoom));
    } else {
      var classData = state.firstWhere(
        (element) => element.classroom!.id == classRoom.id,
        orElse: () => ClassroomData(subject: null, classroom: null),
      );
      if (classData.subject == null && classData.classroom == null) {
        state.add(ClassroomData(subject: null, classroom: classRoom));
      }
    }
  }

  Subject? subjectFromClass(ClassRoom classRoom) {
    var classData = state.firstWhere(
      (element) => element.classroom!.id == classRoom.id,
      orElse: () => ClassroomData(subject: null, classroom: null),
    );
    return classData.subject;
  }

  bool subjectExists(ClassRoom classRoom) {
    if (state.isEmpty) {
      return false;
    }
    var classData = state.firstWhere(
      (element) => element.classroom!.id == classRoom.id,
      orElse: () => ClassroomData(subject: null, classroom: null),
    );

    return classData.subject != null;
  }
}
