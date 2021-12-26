import 'package:flutter/material.dart';
import 'package:nhis_drug_catalogue/controllers/json_controller.dart';
import 'package:nhis_drug_catalogue/model/drugs.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class SuggetionExpansionList extends StatelessWidget {
  const SuggetionExpansionList({
    Key? key,
    required this.suggestionList,
    required this.drugs,
    required this.query,
  }) : super(key: key);

  final List<Drugs> suggestionList;
  final JsonController drugs;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        left: 8,
        right: 8,
      ),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedExpansionTile(
                  childrenPadding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  title: RichText(
                    text: TextSpan(
                        text: suggestionList[index]
                            .genericNameDosageFormStrength
                            .substring(0, query.length),
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: suggestionList[index]
                                .genericNameDosageFormStrength
                                .substring(query.length),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ]),
                  ),
                  children: [
                    Text(
                      'Code: ${drugs.drugList[index].code}',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    Divider(),
                    Text(
                      'Level of Prescribing: ${suggestionList[index].levelOfPrescibing}',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    Divider(),
                    Text(
                      'Unit of Pricing: ${suggestionList[index].unitOfPricing}',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    Divider(),
                    Text(
                      'Price: GHC ${suggestionList[index].price}',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
