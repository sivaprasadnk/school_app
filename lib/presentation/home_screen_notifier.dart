import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenNotifier extends StateNotifier<bool> {
  HomeScreenNotifier() : super(false);

  void toggleView() {
    state = !state;
  }
}
