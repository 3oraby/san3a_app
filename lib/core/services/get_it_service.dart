import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:san3a_app/core/api/api_consumer.dart';
import 'package:san3a_app/core/api/dio_consumer.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerSingleton<Connectivity>(Connectivity());

  final dio = Dio();
  final dioConsumer = DioConsumer(dio: dio);
  await dioConsumer.init();
  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<ApiConsumer>(dioConsumer);
}
