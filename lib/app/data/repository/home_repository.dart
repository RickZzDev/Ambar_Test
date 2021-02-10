import 'dart:convert';

import 'package:ambar_test/app/data/models/git_repo_model.dart';
import 'package:ambar_test/app/data/provider/home_provider.dart';
import 'package:meta/meta.dart';

class HomeRepository {
  final HomeProvider apiClient;

  HomeRepository({@required this.apiClient}) : assert(apiClient != null);

  getRepos() async {
    var response = await apiClient.getRepos();
    if (response is Exception) return response;
    List<dynamic> _list = json.decode(
      utf8.decode(response.bodyBytes),
    );
    return GitRepoModel().fromJson(_list);
  }
}
