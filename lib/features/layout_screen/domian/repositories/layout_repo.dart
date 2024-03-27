import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/layout_model.dart';

abstract class LayoutRepository
{
  Future<Either<String,LayOutModel>>fetchLayoutData();
}