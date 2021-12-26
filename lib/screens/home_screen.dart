import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nhis_drug_catalogue/controllers/json_controller.dart';
import 'package:nhis_drug_catalogue/screens/info_screen.dart';
import 'package:nhis_drug_catalogue/search.dart';
import 'package:nhis_drug_catalogue/widgets/drug_expansion_tile.dart';
// import 'package:nhis_drug_catalogue/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  final JsonController jsonController = Get.put(JsonController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F4FB),
        appBar: AppBar(
          elevation: 3,
          title: const Text(
            '2021 NHIS MEDS',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, size: 35),
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
            ),
            IconButton(
              icon: Icon(Icons.info_outline_rounded, size: 35),
              onPressed: () {
                Get.to(() => InfoScreen());
              },
            )
          ],
        ),
        body: Obx(() {
          if (jsonController.isLoading.value) {
            return SpinKitWave(color: Colors.deepPurple);
          } else {
            return Column(
              children: [
                Expanded(
                    child: DrugExpansionTile(jsonController: jsonController)),
              ],
            );
          }
        }),
      ),
    );
  }
}
