part of 'blogs_cubit.dart';

@freezed
class BlogsState with _$BlogsState
{
  const factory BlogsState.initial() = _Initial;
  const factory BlogsState.loading() = _Loading;
  const factory BlogsState.loaded(List<Blogs>blogs,) = _Loaded;
  const factory BlogsState.error(String errorMessage) = _Error;
}
