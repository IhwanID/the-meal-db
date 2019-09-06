import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../model/meals.dart';

class DetailBloc{
  final _repository = Repository();
  final _detailFetcher = PublishSubject<MealsResult>();

  Observable<MealsResult> get detailMeals => _detailFetcher.stream;

  fetchDetailMeals(String mealsId) async {
    MealsResult mealsDetail = await _repository.fetchDetailMeals(mealsId);
    _detailFetcher.sink.add(mealsDetail);
  }

  dispose() {
    _detailFetcher.close();
  }
}