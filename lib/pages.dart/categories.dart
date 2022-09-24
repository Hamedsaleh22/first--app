import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/categories_provider.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).getAllData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Consumer<CategoryProvider>(builder: (context, category, child) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            backgroundColor: Colors.grey,
            title: Text("Categories"),
          ),
          backgroundColor: Colors.grey[300],
          body: Container(
            //color: Colors.grey[300],
            child: ListView.builder(
                itemCount: category.category?.data!.data!.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Image(
                              fit: BoxFit.cover,
                              image: category
                                          .category?.data!.data![index].image ==
                                      null
                                  ? const NetworkImage(
                                      "https://freesvg.org/img/Loading_icon_with_fade.png")
                                  : NetworkImage(category
                                          .category?.data!.data![index].image ??
                                      "")),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${category.category?.data!.data![index].name!}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
      });
}
