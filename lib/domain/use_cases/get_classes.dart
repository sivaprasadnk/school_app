import 'package:school_app/data/model/classroom_model.dart';
import 'package:school_app/data/repository/repository_impl.dart';

class GetClasses {
  GetClasses({required this.repositoryImpl});
  final RepositoryImpl repositoryImpl;
  Future<(List<ClassRoomModel>?, String?)> call() async {
    var resp = await repositoryImpl.getClasses();
    return (resp.$1, resp.$2);
  }
}
