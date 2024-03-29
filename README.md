<<<<<<< HEAD
### ShoppingItemModel에 copyWith 메서드를 작성하여 toggle 관련 함수 코드를 간결화하는 방법
```dart
// select_provider.dart
toggleHasBought(){
    state = ShoppingItemModel(
      name: state.name,
      quantity: state.quantity,
      hasBought: !state.hasBought,
      isSpicy: state.isSpicy,
    );
  }
```
shopping_item_model.dart 내의 ShoppingItemModel에 copyWith 메소드를 추가
```dart
// shopping_item_model.dart
ShoppingItemModel copyWith({
  String? name,
  int? quantity,
  bool? hasBought,
  bool? isSpicy,
}) {
  return ShoppingItemModel(
    name: name ?? this.name,
    quantity: quantity ?? this.quantity,
    hasBought: hasBought ?? this.hasBought,
    isSpicy: isSpicy ?? this.isSpicy,
  );
}
```
copyWith 메소드를 사용하여 코드를 간결화
```dart
// select_provider.dart
  toggleHasBought() {
    state = state.copyWith(
      hasBought: !state.hasBought,
    );
  }
```
=======
# r_study
>>>>>>> parent of 77e517a (Docs : ShoppingItemModel에 copyWith 메서드를 작성하여 toggle 관련 함수 코드를 간결화하는 방법)

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
