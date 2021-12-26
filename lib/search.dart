import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhis_drug_catalogue/controllers/json_controller.dart';
import 'package:nhis_drug_catalogue/widgets/suggestion_expansion_list.dart';

class Search extends SearchDelegate {
  final drugs = Get.find<JsonController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? drugs.drugList
        : drugs.drugList
            .where((drug) => drug.genericNameDosageFormStrength
                .toLowerCase()
                .startsWith(query.toLowerCase()))
            .toList();

    return SuggetionExpansionList(
      suggestionList: suggestionList,
      drugs: drugs,
      query: query,
    );
  }
}
