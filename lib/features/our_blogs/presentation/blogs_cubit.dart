import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/blogs_model.dart';
import '../domain/repositories/blogs_repository.dart';

part 'blogs_state.dart';
part 'blogs_cubit.freezed.dart';

class BlogsCubit extends Cubit<BlogsState> {
  BlogsCubit({required this.blogsRepository}) : super(const BlogsState.initial());
  final BlogsRepository blogsRepository;

  Future<void> fetchBlogs({int? startIndex, int? limit}) async
  {
    emit(const BlogsState.loading());
   var results = await blogsRepository.fetchBestOffers(
     startIndex: startIndex,
     limit: limit,
   );
   results.fold(
           (errorMessage) => emit(BlogsState.error(errorMessage)),
           (blogs) => BlogsState.loaded(blogs),
   );
  }
}
