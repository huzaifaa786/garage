import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/search/search_controller.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
      builder: (controller) => Scaffold(

        body: SafeArea(child: SingleChildScrollView()),
      ),
    );
  }
}
