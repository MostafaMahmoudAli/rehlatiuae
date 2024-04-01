part of 'blogs_bloc.dart';




enum BlogsStatus {initial,loading, success,error}

class BlogsState extends Equatable
{
  final BlogsStatus status;
  final List<Blogs> blogs;
  final bool hasReachedMax;
  final String errMessage;

  const BlogsState({
    this.status = BlogsStatus.loading,
    this.blogs= const[],
    this.hasReachedMax=false,
    this.errMessage="",
  });

  BlogsState copyWith({
    BlogsStatus?status,
    List<Blogs>?blogs,
    bool?hasReachedMax,
    String?errMessage,
  })
  {
    return BlogsState(
      status:status ?? this.status,
      blogs:blogs??this.blogs,
      hasReachedMax:hasReachedMax??this.hasReachedMax,
      errMessage:errMessage??this.errMessage,
    );
  }

  @override
  List<Object?> get props => [status, blogs, hasReachedMax, errMessage,];
}