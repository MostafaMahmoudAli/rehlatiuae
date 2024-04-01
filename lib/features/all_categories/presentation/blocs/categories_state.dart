part of 'categories_bloc.dart';

enum CategoriesStatus {initial,loading, success, error}

class CategoriesState extends Equatable
{
  final CategoriesStatus status;
  final List<Categories> categories;
  final bool hasReachedMax;
  final String errMessage;

  const CategoriesState({
    this.status = CategoriesStatus.loading,
    this.categories= const[],
    this.hasReachedMax=false,
    this.errMessage="",
  });

  CategoriesState copyWith({
    CategoriesStatus?status,
    List<Categories>?categories,
    bool?hasReachedMax,
    String?errMessage,
  })
  {
    return CategoriesState(
      status:status ?? this.status,
      categories:categories??this.categories,
      hasReachedMax:hasReachedMax??this.hasReachedMax,
      errMessage:errMessage??this.errMessage,
    );
  }

  @override
  List<Object?> get props => [status, categories, hasReachedMax, errMessage];
}