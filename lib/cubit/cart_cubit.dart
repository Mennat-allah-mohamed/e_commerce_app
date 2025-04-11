import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartCubit extends Cubit<List<CartItem>> {
  static const _key = 'cart_items';

  CartCubit() : super([]) {
    loadCart();
  }

  void addToCart(Product product) {
    final updatedCart = List<CartItem>.from(state);
    final existingIndex = updatedCart.indexWhere((item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      updatedCart[existingIndex].quantity++;
    } else {
      updatedCart.add(CartItem(product: product));
    }

    emit(updatedCart);
    _saveToPrefs(updatedCart);
  }

  void removeFromCart(int productId) {
    final updatedCart = List<CartItem>.from(state);
    updatedCart.removeWhere((item) => item.product.id == productId);
    emit(updatedCart);
    _saveToPrefs(updatedCart);
  }

  void updateQuantity(int productId, int newQuantity) {
    final updatedCart = List<CartItem>.from(state);
    final existingIndex = updatedCart.indexWhere((item) => item.product.id == productId);

    if (existingIndex >= 0) {
      updatedCart[existingIndex].quantity = newQuantity;
      emit(updatedCart);
      _saveToPrefs(updatedCart);
    }
  }

  void loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString != null) {
      // Note: In a real app, you'd need proper serialization here
      // This is simplified for the example
      emit([]);
    }
  }

  void _saveToPrefs(List<CartItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    // Note: In a real app, you'd need proper serialization here
    // This is simplified for the example
    prefs.setString(_key, '[]');
  }

  double get totalPrice => state.fold(0, (sum, item) => sum + item.totalPrice);
}