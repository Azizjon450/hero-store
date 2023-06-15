import 'package:dartz/dartz.dart';
import 'package:hero_app/data/data_source/remote_data_source.dart';
import 'package:hero_app/data/mapper/mapper.dart';
import 'package:hero_app/data/network/error_handler.dart';
import 'package:hero_app/data/network/failure.dart';
import 'package:hero_app/data/network/network_info.dart';
import 'package:hero_app/data/request/request.dart';
import 'package:hero_app/domain/model.dart';
import 'package:hero_app/domain/repository.dart';
import 'package:hero_app/data/mapper/mapper.dart';

class RepositoryImpl extends Repository {
  RemoteDatSource _remoteDatSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDatSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      //its safe to call the Api
      try {
        final response = await _remoteDatSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) //success
        {
          //return data(success)
          //return right
          return Right(response.toDomain());
        } else {
          //return bussine. logic error
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      //return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
