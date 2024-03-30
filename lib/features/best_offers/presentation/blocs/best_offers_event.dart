part of 'best_offers_bloc.dart';





abstract class BestOffersEvent extends Equatable
{
  const BestOffersEvent();

  @override
  List<Object?> get props => [];
}

class GetBestOffersEvent extends BestOffersEvent{}