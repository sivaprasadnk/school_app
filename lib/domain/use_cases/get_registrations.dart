import 'package:school_app/data/model/regn_model.dart';
import 'package:school_app/data/repository/repository_impl.dart';

class GetRegistrations {
  GetRegistrations({required this.repositoryImpl});
  final RepositoryImpl repositoryImpl;
  Future<(List<RegnModel>?, String?)> call() async {
    var resp = await repositoryImpl.getRegns();
    return (resp.$1, resp.$2);
  }
}
