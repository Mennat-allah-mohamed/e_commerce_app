import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FavoritesCubit extends Cubit<List<int>> {
  static const _key = 'favorite_ids';

  FavoritesCubit() : super([]) {
    loadFavorites();
  }

  void toggleFavorite(int productId) {
    final updatedFavorites = [...state];
    if (updatedFavorites.contains(productId)) {
      updatedFavorites.remove(productId);
    } else {
      updatedFavorites.add(productId);
    }
    emit(updatedFavorites);
    _saveToPrefs(updatedFavorites);
  }

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList(_key)?.map(int.parse).toList() ?? [];
    emit(ids);
  }

  void _saveToPrefs(List<int> ids) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_key, ids.map((id) => id.toString()).toList());
  }
}
