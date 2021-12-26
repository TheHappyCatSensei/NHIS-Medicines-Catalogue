import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nhis_drug_catalogue/model/drugs.dart';
import 'package:nhis_drug_catalogue/services/json_service.dart';

class JsonController extends GetxController {
  final isLoading = true.obs;
  final drugList = <Drugs>[].obs;

  late TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    fetchDrugs();
    searchController = TextEditingController();
  }

  void fetchDrugs() async {
    try {
      isLoading(true);
      var drugs = await JsonService.readJsonData();
      drugList.assignAll(drugs);
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  // searchDrugs(String searchedDrug) {
  //   searchedDrug = searchedDrug.toLowerCase();
  //   filteredDrugList = drugList.where((drug) {
  //     var drugName = drug.genericNameDosageFormStrength.toLowerCase();
  //     return drugName.contains(searchedDrug);
  //   }).toList();
  // }
}
