import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../model/item_model.dart';

class MealsBloc {
  final _repository = Repository();
  final _mealsFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMeals => _mealsFetcher.stream;

  fetchDessert() async {
    ItemModel itemModel = await _repository.fetchAllMeals("Dessert");
    _mealsFetcher.sink.add(itemModel);
  }

  fetchSeafood() async {
    ItemModel itemModel = await _repository.fetchAllMeals("Seafood");
    _mealsFetcher.sink.add(itemModel);
  }

  dispose() {
    _mealsFetcher.close();
  }
}
