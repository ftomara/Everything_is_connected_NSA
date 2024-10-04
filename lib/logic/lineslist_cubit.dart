import 'dart:ui';

import 'package:bloc/bloc.dart';

class LineslistCubit extends Cubit<List<Map<Offset, Offset>?>> {
  // Initialize the list properly
  LineslistCubit() : super([]) {
    list = [];
  }

  List<Map<Offset, Offset>?>? list;

  void add(Map<Offset, Offset>? mp) {
    if (mp != null) {
      list?.add(mp); 
    }
    print(mp);
    print("cubitlist : $list");

    // Emit the updated list state
    emit(List<Map<Offset, Offset>?>.from(list ?? []));
  }

  List<Map<Offset, Offset>?> getlist() {
    return list??[];
  }
}
