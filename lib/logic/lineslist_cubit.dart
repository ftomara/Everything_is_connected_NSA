import 'dart:ui';

import 'package:bloc/bloc.dart';

class LineslistCubit extends Cubit<List<List<Map<Offset, Offset>?>?>> {
  LineslistCubit() : super([]) {
    list = [];
  }

  List<List<Map<Offset, Offset>?>?> list = [];

  void add(List<Map<Offset, Offset>?> mp) {
    list.add(mp);
    print(mp);
    print("cubitlist : $list");

    // Emit the updated list state
    emit(List<List<Map<Offset, Offset>?>?>.from(list));
  }

  List<List<Map<Offset, Offset>?>?> getlist() {
    return list;
  }
}
