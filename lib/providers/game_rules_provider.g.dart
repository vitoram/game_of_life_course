// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_rules_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameRulesHash() => r'bcbf4433cea506bd21555ea9d062b4971e97d7d9';

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

abstract class _$GameRules extends BuildlessAutoDisposeNotifier<List<int>> {
  late final GameRule gameRule;

  List<int> build(
    GameRule gameRule,
  );
}

/// See also [GameRules].
@ProviderFor(GameRules)
const gameRulesProvider = GameRulesFamily();

/// See also [GameRules].
class GameRulesFamily extends Family<List<int>> {
  /// See also [GameRules].
  const GameRulesFamily();

  /// See also [GameRules].
  GameRulesProvider call(
    GameRule gameRule,
  ) {
    return GameRulesProvider(
      gameRule,
    );
  }

  @override
  GameRulesProvider getProviderOverride(
    covariant GameRulesProvider provider,
  ) {
    return call(
      provider.gameRule,
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
  String? get name => r'gameRulesProvider';
}

/// See also [GameRules].
class GameRulesProvider
    extends AutoDisposeNotifierProviderImpl<GameRules, List<int>> {
  /// See also [GameRules].
  GameRulesProvider(
    GameRule gameRule,
  ) : this._internal(
          () => GameRules()..gameRule = gameRule,
          from: gameRulesProvider,
          name: r'gameRulesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameRulesHash,
          dependencies: GameRulesFamily._dependencies,
          allTransitiveDependencies: GameRulesFamily._allTransitiveDependencies,
          gameRule: gameRule,
        );

  GameRulesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gameRule,
  }) : super.internal();

  final GameRule gameRule;

  @override
  List<int> runNotifierBuild(
    covariant GameRules notifier,
  ) {
    return notifier.build(
      gameRule,
    );
  }

  @override
  Override overrideWith(GameRules Function() create) {
    return ProviderOverride(
      origin: this,
      override: GameRulesProvider._internal(
        () => create()..gameRule = gameRule,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gameRule: gameRule,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<GameRules, List<int>> createElement() {
    return _GameRulesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameRulesProvider && other.gameRule == gameRule;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gameRule.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GameRulesRef on AutoDisposeNotifierProviderRef<List<int>> {
  /// The parameter `gameRule` of this provider.
  GameRule get gameRule;
}

class _GameRulesProviderElement
    extends AutoDisposeNotifierProviderElement<GameRules, List<int>>
    with GameRulesRef {
  _GameRulesProviderElement(super.provider);

  @override
  GameRule get gameRule => (origin as GameRulesProvider).gameRule;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
