import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../model/item_model.dart';

class SearchBloc{
  final _repository = Repository();
  final _searchFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get searchMeal => _searchFetcher.stream;

  searchMealsByName(String name) async {
    ItemModel itemModel = await _repository.searchMeals(name);
    _searchFetcher.sink.add(itemModel);
  }

  dispose() {
    _searchFetcher.close();
  }
}