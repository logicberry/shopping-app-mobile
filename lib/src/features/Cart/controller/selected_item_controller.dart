import 'package:flutter/material.dart';

import '../model/cart_model.dart';

class SelectedItemsProvider extends ChangeNotifier {
  final List<CartModel> _selectedItems = [];

  List<CartModel> get selectedItems => _selectedItems;

  bool isItemSelected(CartModel item) {
    return _selectedItems.contains(item);
  }

  void toggleItemSelection(CartModel item) {
    if (_selectedItems.contains(item)) {
      _selectedItems.remove(item);
    } else {
      _selectedItems.add(item);
    }
    notifyListeners();
  }

  void clearSelection() {
    _selectedItems.clear();
    notifyListeners();
  }
}
