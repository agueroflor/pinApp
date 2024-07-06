import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pin_app/utils/blocs.dart';
import 'package:pin_app/utils/models.dart';

class PostDetailScreen extends StatefulWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CommentCubit>().fetchComments(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Detail')),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          final post = (state is PostLoaded)
              ? state.posts.firstWhere((p) => p.id == widget.post.id)
              : widget.post;
          return Column(
            children: [
              Card(
                elevation: 4.0,
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        post.title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        post.body,
                        style: const TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              post.isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: post.isLiked ? Colors.red : null,
                            ),
                            onPressed: () =>
                                context.read<PostCubit>().likePost(post),
                          ),
                          Text(
                            post.isLiked ? 'Liked' : 'Like',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: post.isLiked ? Colors.red : null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                'Comments',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              BlocBuilder<CommentCubit, CommentState>(
                builder: (context, state) {
                  if (state is CommentLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CommentLoaded) {
                    final comments = state.comments;
                    return Expanded(
                      child: ListView.separated(
                        itemCount: comments.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          final comment = comments[index];
                          return ListTile(
                            title: Text(comment.name),
                            subtitle: Text(comment.body),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: Text('Failed to load comments'));
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}