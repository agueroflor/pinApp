import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pin_app/utils/blocs.dart';
import 'package:pin_app/utils/screens.dart';
import 'package:pin_app/utils/services.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
        BlocProvider<PostCubit>(
          create: (context) => PostCubit(getIt<ApiService>())..fetchPosts(),
        ),
        BlocProvider<CommentCubit>(
          create: (context) => CommentCubit(getIt<ApiService>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Challenge PinApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PostListScreen(),
      ),
    );
  }
}