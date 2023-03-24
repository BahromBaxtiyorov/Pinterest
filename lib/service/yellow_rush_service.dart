import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../core/dio/apis.dart';
import '../core/dio/dio_error_exceptions.dart';
import '../models/yellow_rush_model.dart';
import '../utils/log_service.dart';

class YellowRushService {
  static Future<Either<String, List<YellowRushModel>>> getPhotos(int page) async {
    try {
      Response response = await Dio().get(
          //'${Endpoints.CollentionPhotos}?page=$page&per_page=10&order_by=ASC',
          '${Endpoints.CollentionPhotos}3326482/photos?page=$page&per_page=30&order_by=ASC',
          options: Options(headers: {
            'x-api-key': Endpoints.apiKey,
            'Authorization': 'Bearer ${Endpoints.token}'
          }));
      Log.w(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<YellowRushModel> photos = [];
        for (var e in (response.data as List)) {
          photos.add(YellowRushModel.fromJson(e));
        }
        return right(photos);
      } else {
        Log.e(DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if (DioExceptions.fromDioError(e).toString() == 'Unauthorized') {
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e(m.toString());
      return left(m.toString());
    }
  }
}