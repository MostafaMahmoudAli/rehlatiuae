part of 'blogs_search_cubit.dart';

@freezed
class BlogsSearchState with _$BlogsSearchState {
  const factory BlogsSearchState.initial() = _Initial;
  const factory BlogsSearchState.loading() = _Loading;
  const factory BlogsSearchState.loaded(List<Blogs>blogsList) = _Loaded;
  const factory BlogsSearchState.error(String errorMessage) = _Error;
}
