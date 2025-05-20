import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/services/offer_service.dart';

import 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  final OfferService service;

  OfferCubit(this.service) : super(OfferInitial());

  void getOffers() async {
    emit(OfferLoading());
    try {
      final offers = await service.fetchOffers();
      emit(OfferLoaded(offers));
    } catch (e) {
      emit(OfferError(e.toString()));
    }
  }
}
