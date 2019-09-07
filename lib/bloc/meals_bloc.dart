import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../model/item_model.dart';

class MealsBloc {
  final _repository = Repository();
  final _mealsFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMeals => _mealsFetcher.stream;

  fetchAllMeals(String type) async {
    ItemModel itemModel = await _repository.fetchAllMeals(type);
    _mealsFetcher.sink.add(itemModel);
  }

  dispose() {
    _mealsFetcher.close();
  }
}
