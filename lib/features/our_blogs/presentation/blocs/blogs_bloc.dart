import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/blogs_model.dart';
import '../../domain/repositories/blogs_repository.dart';

part 'blogs_event.dart';
part 'blogs_state.dart';

class BlogsBloc extends Bloc<BlogsEvent, BlogsState> {
  final BlogsRepository blogsRepository;
  BlogsBloc({required this.blogsRepository}) : super(const BlogsState()) {
    on<BlogsEvent>((event, emit)async {
   if(event is GetBlogsEvent)
   {
     if (state.hasReachedMax == true) {
       return;
     }
     if (state.status == BlogsStatus.loading) {
       var results = await blogsRepository.fetchBlogs();
       results.fold(
             (errorMessage) => emit(
           state.copyWith(
             status: BlogsStatus.error,
             errMessage: errorMessage,
           ),
         ),
             (blogs) => emit(
           state.copyWith(
             status: BlogsStatus.success,
             blogs: blogs,
             hasReachedMax: false,
           ),
         ),
       );
     } else {
       var results = await blogsRepository.fetchBlogs(
           startIndex: state.blogs.length);
       results.fold(
             (errorMessage) => emit(
           state.copyWith(
             status: BlogsStatus.error,
             errMessage: errorMessage,
           ),
         ),
             (blogs) {
               blogs.isEmpty ? emit(state.copyWith(hasReachedMax: true))
               :
           emit(state.copyWith(
             status: BlogsStatus.success,
             blogs: List.of(state.blogs)..addAll(blogs),
             hasReachedMax: false,
           ),
           );
         },
       );
     }
   }
    },
      transformer:droppable(),
   );
  }
}
