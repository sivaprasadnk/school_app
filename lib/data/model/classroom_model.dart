import 'package:school_app/domain/entity/classroom.dart';

class ClassRoomModel extends ClassRoom {
  ClassRoomModel({
    required super.id,
    required super.layout,
    required super.name,
    required super.size,
  });
  factory ClassRoomModel.fromJson(Map<String, dynamic> json) {
    return ClassRoomModel(
      layout: json['layout'],
      name: json['name'],
      id: json['id'],
      size: json['size'],
    );
  }
}
