import 'dart:collection';
import 'package:analyzer/dart/element/element.dart' show Element;
import 'package:analyzer/dart/element/visitor.dart' show SimpleElementVisitor;
import 'package:source_gen/source_gen.dart' show TypeChecker;

/// Generic class that extends [SimpleElementVisitor] and provides
/// methods for storing and clearing found instances of [E] with static type
/// matching [T].
abstract class Collector<T, E extends Element> extends SimpleElementVisitor {
  Collector();

  /// TypeChecker of type [T].
  final checker = TypeChecker.fromRuntime(T);

  /// List of collected items of type [E].
  final List<E> _collectedItems = [];

  /// Returns an unmodifiable list view of all collected items
  /// of type [E].
  UnmodifiableListView<E> get collectedItems =>
      UnmodifiableListView<E>(_collectedItems);

  /// Clears the list of collected items.
  void clear() => _collectedItems.clear();

  /// Appends an item to the list of collected items.
  void add(E item) {
    _collectedItems.add(item);
  }

  /// Appends all [items] to the end of the list of collected items.
  void addAll(List<E> items) {
    _collectedItems.addAll(items);
  }
}
