part of 'best_offers_bloc.dart';



enum BestOffersStatus {initial,loading, success,error}

class BestOffersState extends Equatable
{
  final BestOffersStatus status;
  final List<BestOffers> bestOffers;
  final bool hasReachedMax;
  final String errMessage;

  const BestOffersState({
    this.status = BestOffersStatus.loading,
    this.bestOffers= const[],
    this.hasReachedMax=false,
    this.errMessage="",
  });

  BestOffersState copyWith({
    BestOffersStatus?status,
    List<BestOffers>?bestOffers,
    bool?hasReachedMax,
    String?errMessage,
  })
  {
    return BestOffersState(
      status:status ?? this.status,
      bestOffers:bestOffers??this.bestOffers,
      hasReachedMax:hasReachedMax??this.hasReachedMax,
      errMessage:errMessage??this.errMessage,
    );
  }

  @override
  List<Object?> get props => [status, bestOffers, hasReachedMax, errMessage,];
}