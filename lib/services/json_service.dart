import 'dart:convert';

import 'package:flutter/services.dart' as root_bundle;
import '../model/drugs.dart';

class JsonService{
 static Future<List<Drugs>> readJsonData() async {
      final jsonData =
          await root_bundle.rootBundle.loadString('assets/nhis_drugs.json');
      final list = json.decode(jsonData) as List;
      return list.map((data) => Drugs.fromJson(data)).toList();
    }
}