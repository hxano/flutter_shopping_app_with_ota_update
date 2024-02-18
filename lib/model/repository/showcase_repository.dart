import 'package:flutter/material.dart';

abstract class ShowcaseRepository {
  Future<List<ImageProvider>> fetchShowcaseContents();
}

class MockShowcaseRepository implements ShowcaseRepository {
  @override
  Future<List<ImageProvider>> fetchShowcaseContents() async {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () {
        return <ImageProvider>[
          const AssetImage('assets/images/showcase.png'),
        ];
      },
    );
  }
}
