import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_app_with_ota_updates/main.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/common.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/screens/search/components.dart';

import '../../../viewmodel/search_viewmodel.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final searchTextController = TextEditingController();
  late final FocusNode searchFocusNode;

  @override
  void initState() {
    super.initState();
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
    final asyncValueSearchResult = ref.watch(searchItemListProvider);
    return GestureDetector(
      onTap: () => searchFocusNode.unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.15,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              centerTitle: true,
              title: SearchScreenSearchBar(
                  textController: searchTextController,
                  focusNode: searchFocusNode),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DetailedSearchButton(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/detailed_search',
                      arguments: searchTextController.text,
                    );
                  },
                ),
              ],
            ),
          ),
          asyncValueSearchResult.when(
            data: (items) => SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.25,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = items[index];
                  final ab = ref.watch(abTestProvider);
                  return ab ? ItemThumbnailCardA(
                    item: item,
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/item_details',
                        arguments: item.id,
                      );
                    },
                  ) : ItemThumbnailCardB(
                    item: item,
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/item_details',
                        arguments: item.id,
                      );
                    },
                  );
                },
                childCount: items.length,
              ),
            ),
            loading: () => const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stackTrace) => SliverToBoxAdapter(
              child: Center(
                child: Text('Error: $error'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
