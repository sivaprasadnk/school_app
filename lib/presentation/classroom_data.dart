import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/domain/entity/classroom.dart';
import 'package:school_app/domain/entity/student.dart';
import 'package:school_app/domain/entity/subject.dart';

class ClassroomData {
  Subject? subject;
  ClassRoom? classroom;
  Student? student;
  ClassroomData({
    required this.subject,
    required this.classroom,
    required this.student,
  });

  ClassroomData copyWith({
    Subject? subject,
    ClassRoom? classroom,
    Student? student,
  }) {
    return ClassroomData(
      subject: subject ?? this.subject,
      classroom: classroom ?? this.classroom,
      student: student ?? this.student,
    );
  }
}

class ClassroomNotifier extends StateNotifier<List<ClassroomData>> {
  ClassroomNotifier() : super([]);

  initialiseClass(ClassRoom classRoom) {
    if (state.isEmpty) {
      state.add(ClassroomData(
        subject: null,
        student: null,
        classroom: classRoom,
      ));
    } else {
      var classData = state.firstWhere(
        (element) => element.classroom!.id == classRoom.id,
        orElse: () => ClassroomData(
          subject: null,
          student: null,
          classroom: null,
        ),
      );
      if (classData.subject == null && classData.classroom == null) {
        state.add(ClassroomData(
          subject: null,
          student: null,
          classroom: classRoom,
        ));
      }
    }
  }

  assignSubject(Subject? subject, ClassRoom classRoom) {
    var classData = state.firstWhere(
      (element) => element.classroom!.id == classRoom.id,
      orElse: () => ClassroomData(
        subject: null,
        classroom: null,
        student: null,
      ),
    );
    var classIndex =
        state.indexWhere((element) => element.classroom == classData.classroom);
    state[classIndex] = ClassroomData(
      subject: subject,
      classroom: classRoom,
      student: classData.student,
    );
    state = [...state];
  }

  assignStudent(Student? student, ClassRoom classRoom) {
    var classData = state.firstWhere(
      (element) => element.classroom!.id == classRoom.id,
      orElse: () => ClassroomData(
        subject: null,
        classroom: null,
        student: null,
      ),
    );
    var classIndex =
        state.indexWhere((element) => element.classroom == classData.classroom);
    state[classIndex] = ClassroomData(
      subject: classData.subject,
      classroom: classRoom,
      student: student,
    );
    state = [...state];
  }

  removeStudent(ClassRoom classRoom) {
    var classData = state.firstWhere(
      (element) => element.classroom!.id == classRoom.id,
      orElse: () => ClassroomData(
        subject: null,
        classroom: null,
        student: null,
      ),
    );
    var classIndex =
        state.indexWhere((element) => element.classroom == classData.classroom);
    state[classIndex] = ClassroomData(
      subject: classData.subject,
      classroom: classRoom,
      student: null,
    );
    state = [...state];
  }

  Subject? subjectFromClass(ClassRoom classRoom) {
    var classData = state.firstWhere(
      (element) => element.classroom!.id == classRoom.id,
      orElse: () => ClassroomData(
        subject: null,
        student: null,
        classroom: null,
      ),
    );
    return classData.subject;
  }

  Student? studentFromClass(ClassRoom classRoom) {
    var classData = state.firstWhere(
      (element) => element.classroom!.id == classRoom.id,
      orElse: () => ClassroomData(
        subject: null,
        student: null,
        classroom: null,
      ),
    );
    return classData.student;
  }

  bool subjectExists(ClassRoom classRoom) {
    if (state.isEmpty) {
      return false;
    }
    return subjectFromClass(classRoom) != null;
  }
}
