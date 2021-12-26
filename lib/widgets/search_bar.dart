import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhis_drug_catalogue/controllers/json_controller.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final jsonController = Get.find<JsonController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            offset: const Offset(0, 2),
            blurRadius: 1,
          ),
        ],
      ),
      child: TextField(
          cursorColor: Colors.black,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search drug name......',
            hintStyle:
                TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
            contentPadding: const EdgeInsets.all(20),
            suffixIcon: Icon(
              Icons.search_rounded,
              size: 40,
              color: Colors.black,
            ),
          ),
          onChanged: (query) {
            
          }),
    );
  }
}
