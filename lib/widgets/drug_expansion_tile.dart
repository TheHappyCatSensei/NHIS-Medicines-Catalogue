import 'package:flutter/material.dart';
import 'package:nhis_drug_catalogue/controllers/json_controller.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class DrugExpansionTile extends StatelessWidget {
  DrugExpansionTile({
    Key? key,
    required this.jsonController,
  }) : super(key: key);

  final JsonController jsonController;

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
          itemCount: jsonController.drugList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedExpansionTile(
                  leading: Icon(
                    Icons.medication,
                    size: 30,
                    color: Colors.deepPurple,
                  ),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  childrenPadding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  title: Text(
                    jsonController
                        .drugList[index].genericNameDosageFormStrength,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  children: [
                    Text(
                      'Code: ${jsonController.drugList[index].code}',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    Divider(),
                    Text(
                      'Level of Prescribing: ${jsonController.drugList[index].levelOfPrescibing}',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    Divider(),
                    Text(
                      'Unit of Pricing: ${jsonController.drugList[index].unitOfPricing}',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    Divider(),
                    Text(
                      'Price: GHC ${jsonController.drugList[index].price}',
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
