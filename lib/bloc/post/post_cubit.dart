import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pin_app/utils/models.dart';
import 'package:pin_app/utils/services.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final ApiService apiService;

  PostCubit(this.apiService) : super(PostInitial());

  void fetchPosts() async {
    try {
      emit(PostLoading());
      final posts = await apiService.fetchPosts();
      emit(PostLoaded(posts: posts));
    } catch (e) {
      emit(PostError("Failed to fetch posts"));
    }
  }

  void likePost(Post post) {
    post.isLiked = !post.isLiked;
    emit(PostLoaded(posts: (state as PostLoaded).posts));
  }
}