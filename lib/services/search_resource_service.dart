import 'package:fuzzysearch/fuzzysearch.dart';
import 'package:star_wars_fan_app/models/models.dart';

class SearchResourceService {
  Future<List<Resource>> searchForResource({required String value, required List<Resource> allResources}) async {
    List<Resource> searchedList = [];
    final fuse = Fuzzy.withIdentifiers(
        {for (var resource in allResources) resource.name: resource},
        tokens: allResources.map((e) => e.searchableStrings).toList(),
        options: FuzzyOptions(
          findAllMatches: true,
          tokenize: true,
          isCaseSensitive: false,
          threshold: 0.3,
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