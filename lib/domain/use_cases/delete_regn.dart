import 'package:school_app/data/repository/repository_impl.dart';

class DeleteRegistrations {
  DeleteRegistrations({required this.repositoryImpl});
  final RepositoryImpl repositoryImpl;
  Future<(String?, String?)> call(int id) async {
    var resp = await repositoryImpl.deleteRegn(id);
    return (resp.$1, resp.$2);
  }
}
