import 'layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);
  final List<GlobalKey> keys = List.generate(5, (_) => GlobalKey());

  Future<void> scrollTo(int index) async {
    if (index < 0 || index >= keys.length) return;
    final ctx = keys[index].currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }
}
