import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_shopping_app_with_ota_updates/view/screens/search/components.dart';

import '../../../viewmodel/search_viewmodel.dart';

class DetailedSearchScreen extends StatefulWidget {
  const DetailedSearchScreen({super.key, required this.text});

  final String text;

  @override
  State<DetailedSearchScreen> createState() => _DetailedSearchScreenState();
}

class _DetailedSearchScreenState extends State<DetailedSearchScreen> {
  TextEditingController searchTextController = TextEditingController();
  late final FocusNode searchFocusNode;

  @override
  void initState() {
    super.initState();
    searchTextController.text = widget.text;
    searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => searchFocusNode.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: DetailedSearchBackButton(
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          title: DetailedSearchScreenSearchBar(
            textController: searchTextController,
            focusNode: searchFocusNode,
          ),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            return DetailedSearchScreenBody(
              onTap: () {
                ref.read(searchItemListProvider.notifier).search(
                  searchTextController.text,
                );
                Navigator.of(context).pop();
              },
            );
          }
        ),
      ),
    );
  }
}
