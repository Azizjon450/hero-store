import 'package:hero_app/data/network/app_api.dart';

import '../request/request.dart';
import '../responses/responses.dart';

abstract class RemoteDatSource {
  Future<AuthenticationResponce> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDatSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponce> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest.email, loginRequest.password, loginRequest.imei, loginRequest.deviceType);
  }
}
