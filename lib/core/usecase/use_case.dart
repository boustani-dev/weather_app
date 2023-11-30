import 'package:weather_app/core/resources/data_state.dart';

/// takes a P parameter and returns T value;
/// we extend this class on the Usecase classes.
/// to acheive a unifed design for our usecases. 
abstract class Usecase<T, P> {
  Future<DataState<T>> call(P param);
}
