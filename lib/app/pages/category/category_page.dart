import 'package:flutter/material.dart';
import 'package:my_lyst/app/models/category/category_model.dart';

import '../../controllers/categories_controller.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<CategoryModel> categorires = [];
  CategoryController controller = CategoryController();
  _init() async {
    List<CategoryModel> response = await controller.getCategories();

    setState(() {
      categorires = response;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category'),
        ),
        body: categorires.isNotEmpty
            ? SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) => Card(
                      child: ListTile(
                          title: Text(categorires[index].name ?? "",
                              style: TextStyle()))),
                  itemCount: categorires.length,
                ),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
