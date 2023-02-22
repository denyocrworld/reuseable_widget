// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class QListView extends StatefulWidget {
  final Function(int page) future;
  final Function(Map item, int index) itemBuilder;
  const QListView({
    Key? key,
    required this.future,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  State<QListView> createState() => _QListViewState();
}

class _QListViewState extends State<QListView> {
  List items = [];
  int page = 1;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    loadData();
    scrollController.addListener(() {
      var offset = scrollController.offset;
      var maxOffset = scrollController.position.maxScrollExtent;
      if (offset == maxOffset) {
        //kalo mentok, get data di page selanjutnya
        page++;
        loadData();
        print("Mentok nih");
      }
    });
    super.initState();
  }

  loadData() async {
    var newItems = await widget.future(page);
    items.addAll(newItems);
    setState(() {});
  }

  reload() async {
    page = 1;
    items.clear();
    await loadData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => reload(),
      child: ListView.builder(
        controller: scrollController,
        itemCount: items.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return widget.itemBuilder(item, index);
        },
      ),
    );
  }
}
