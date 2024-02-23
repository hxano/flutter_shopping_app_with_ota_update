// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_details_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemDetailsFutureHash() => r'b000d1e35405f42c059ccd12e4724c5201997e8e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [itemDetailsFuture].
@ProviderFor(itemDetailsFuture)
const itemDetailsFutureProvider = ItemDetailsFutureFamily();

/// See also [itemDetailsFuture].
class ItemDetailsFutureFamily extends Family<AsyncValue<ItemDetails>> {
  /// See also [itemDetailsFuture].
  const ItemDetailsFutureFamily();

  /// See also [itemDetailsFuture].
  ItemDetailsFutureProvider call(
    String id,
  ) {
    return ItemDetailsFutureProvider(
      id,
    );
  }

  @override
  ItemDetailsFutureProvider getProviderOverride(
    covariant ItemDetailsFutureProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'itemDetailsFutureProvider';
}

/// See also [itemDetailsFuture].
class ItemDetailsFutureProvider extends AutoDisposeFutureProvider<ItemDetails> {
  /// See also [itemDetailsFuture].
  ItemDetailsFutureProvider(
    String id,
  ) : this._internal(
          (ref) => itemDetailsFuture(
            ref as ItemDetailsFutureRef,
            id,
          ),
          from: itemDetailsFutureProvider,
          name: r'itemDetailsFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$itemDetailsFutureHash,
          dependencies: ItemDetailsFutureFamily._dependencies,
          allTransitiveDependencies:
              ItemDetailsFutureFamily._allTransitiveDependencies,
          id: id,
        );

  ItemDetailsFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<ItemDetails> Function(ItemDetailsFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ItemDetailsFutureProvider._internal(
        (ref) => create(ref as ItemDetailsFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ItemDetails> createElement() {
    return _ItemDetailsFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemDetailsFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ItemDetailsFutureRef on AutoDisposeFutureProviderRef<ItemDetails> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ItemDetailsFutureProviderElement
    extends AutoDisposeFutureProviderElement<ItemDetails>
    with ItemDetailsFutureRef {
  _ItemDetailsFutureProviderElement(super.provider);

  @override
  String get id => (origin as ItemDetailsFutureProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
