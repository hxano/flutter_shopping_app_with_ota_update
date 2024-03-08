import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/common.dart';

import 'package:flutter_shopping_app_with_ota_updates/view/screens/home/components.dart';

import '../../../main.dart';
import '../../../viewmodel/home_viewmodel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
    final showcase = ref.watch(showcaseContentsFutureProvider);
    final recommended = ref.watch(recommendItemsFutureProvider);
    return GestureDetector(
      onTap: () => searchFocusNode.unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              centerTitle: true,
              title: Column(
                children: [
                  const Expanded(
                    child: HomeScreenLogo(),
                  ),
                  HomeScreenSearchBar(
                    textController: searchTextController,
                    focusNode: searchFocusNode,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer(builder: (context, ref, child) {
              return showcase.when(
                data: (contents) {
                  final showcase = contents;
                  return ShowcaseCarouselSlider(
                    items: List.generate(
                      showcase.length,
                      (index) => ShowcaseCard(
                        image: showcase[index],
                        onTap: () {},
                      ),
                    ),
                  );
                },
                loading: () {
                  return const SizedBox(
                    height: 220,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return const SizedBox(
                    height: 220,
                    child: Center(
                      child: Text('Error'),
                    ),
                  );
                },
              );
            }),
          ),
          const SliverToBoxAdapter(
            child: HomeScreenTitleHeader(title: 'Recommended'),
          ),
          recommended.when(
            data: (items) {
              return SliverGrid(
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
              );
            },
            error: (error, stackTrace) {
              return const SliverToBoxAdapter(
                child: SizedBox(
                  height: 220,
                  child: Center(
                    child: Text('Error'),
                  ),
                ),
              );
            },
            loading: () {
              return const SliverToBoxAdapter(
                child: SizedBox(
                  height: 220,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
