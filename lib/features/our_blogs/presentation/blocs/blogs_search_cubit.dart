import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/blogs_model.dart';
import '../../domain/repositories/blogs_repository.dart';

part 'blogs_search_cubit.freezed.dart';
part 'blogs_search_state.dart';

class BlogsSearchCubit extends Cubit<BlogsSearchState> {
  final BlogsRepository blogsRepository;

  BlogsSearchCubit({required this.blogsRepository}) : super(const BlogsSearchState.initial());

  Future<void> fetchSearchData({String? name, int? clientId}) async {
    var results = await blogsRepository.fetchBlogsSearch(
      name: name,
    );
    results.fold(
      (errorMessage) => _update(BlogsSearchState.error(errorMessage)),
      (blogsList) {
        name == null ? _update(const BlogsSearchState.loaded([])) : _update(BlogsSearchState.loaded(blogsList));
      },
    );
  }

  void _update(BlogsSearchState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
