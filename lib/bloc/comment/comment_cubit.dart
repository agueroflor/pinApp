import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pin_app/utils/models.dart';
import 'package:pin_app/utils/services.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final ApiService apiService;

  CommentCubit(this.apiService) : super(CommentInitial());

  void fetchComments(int postId) async {
    try {
      emit(CommentLoading());
      final comments = await apiService.fetchComments(postId);
      emit(CommentLoaded(comments));
    } catch (e) {
      emit(CommentError("Failed to fetch comments"));
    }
  }
}
