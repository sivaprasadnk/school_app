import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/domain/entity/student.dart';
import 'package:school_app/domain/entity/subject.dart';

class RegnData {
  Subject? subject;
  Student? student;
  int? id;
  bool isComplete;
  bool isDeleted;
  RegnData({
    required this.subject,
    required this.student,
    required this.id,
    this.isComplete = false,
    this.isDeleted = false,
  });
}

class RegnNotifier extends StateNotifier<List<RegnData>> {
  RegnNotifier() : super([]);

  initRegn() {
    state.removeWhere((element) => !element.isComplete);
    state.add(RegnData(
      subject: null,
      student: null,
      id: 100 + state.length + 1,
    ));
    state = [...state];
  }

  assignStudent(Student student) {
    var data = state.last;
    state[state.length - 1] = RegnData(
      subject: data.subject,
      student: student,
      id: data.id,
    );
    state = [...state];
  }

  assignSubject(Subject subject) {
    var data = state.last;
    state[state.length - 1] = RegnData(
      subject: subject,
      student: data.student,
      id: data.id,
    );
    state = [...state];
  }

  Student? regnStudent() {
    return state.last.student;
  }

  Subject? regnSubject() {
    return state.last.subject;
  }

  RegnData submitData() {
    var data = state.last;

    return RegnData(
      subject: data.subject,
      student: data.student,
      id: data.id,
      isComplete: true,
    );
  }

  submitRegn() {
    var data = state.last;
    var index = state.indexWhere((element) => element.id == data.id);

    state[index] = RegnData(
      subject: data.subject,
      student: data.student,
      id: data.id,
      isComplete: true,
    );
    state = [...state];
  }

  List<RegnData> completedList() {
    return state
        .where((element) => element.isComplete && !element.isDeleted)
        .toList();
  }

  deleteRegnData(RegnData data) {
    var index = state.indexWhere((element) => element.id == data.id);
    state[index] = RegnData(
      subject: data.subject,
      student: data.student,
      id: data.id,
      isComplete: true,
      isDeleted: true,
    );
    state = [...state];
  }
}
