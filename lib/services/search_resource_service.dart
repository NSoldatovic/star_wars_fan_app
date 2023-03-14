import 'package:fuzzysearch/fuzzysearch.dart';
import 'package:star_wars_fan_app/models/models.dart';

class SearchResourceService {
  Function? _clearTextField;

  void setClearTextField(Function? value) {
    _clearTextField = value;
  }

  void clearTextField() {
    if (_clearTextField != null) {
      _clearTextField!();
    }
  }

  Future<List<Resource>> searchForResource(
      {required String value, required List<Resource> resources}) async {
    List<Resource> searchedList = [];
    final fuse = Fuzzy.withIdentifiers(
        {for (var resource in resources) resource.name: resource},
        tokens: resources.map((e) => [e.searchableStrings.join(' ')]).toList(),
        options: FuzzyOptions(
          findAllMatches: true,
          tokenize: true,
          matchAllTokens: true,
          isCaseSensitive: false,
          threshold: 0.4,
          verbose: false,
          shouldSort: true,
        ));
    final results = await fuse.search(value, 10);
    for (var result in results) {
      if (result.identifier != null) {
        searchedList.add(result.identifier!);
      }
    }
    return searchedList;
  }
}