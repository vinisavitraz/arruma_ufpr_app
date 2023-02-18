import 'package:arruma_ufpr_app/services/remote/http_client/app_http_client.dart';
import 'package:arruma_ufpr_app/src/auth/dto/request/auth_user_request_dto.dart';
import 'package:arruma_ufpr_app/src/auth/dto/response/auth_response_dto.dart';

class AuthRepository {

  Future<AuthResponseDTO> authUser(AuthUserRequestDTO requestBody) async {
    print('authUser');
    dynamic response = await AppHttpClient.client.post('/auth', data: requestBody);
    print(response.data);
    return AuthResponseDTO.fromJson(response.data);
  }

  // Future<void> saveUserToken(AuthResponseDTO authResponseDTO) async {
  //   Token token = Token(
  //       token: authResponseDTO.token,
  //       tokenExpirationDate: authResponseDTO.tokenExpirationDate
  //   );
  //   await Cache.saveObject('token', token);
  // }
  //
  // Future<UserInfo> getActiveUserInfo() async {
  //   dynamic response = await AppHttpClient.client.get('/ws/auth/authenticated-user-info');
  //   print(response.data);
  //   return UserInfo.fromJson(response.data['user_info']);
  // }
  //
  // Future<LogoutUserResponseDTO> logoutUser() async {
  //   var response = await AppHttpClient.client.post('/ws/auth/logout', data: {});
  //
  //   return LogoutUserResponseDTO.fromJson(response.data);
  // }
  //
  // Future<void> removeToken() async {
  //   await Cache.delete('token');
  // }
  //
  // Future<Token?> getActiveTokenFromInternalCache() async {
  //   dynamic tokenCache = Cache.get('token');
  //
  //   if (tokenCache == null) {
  //     return null;
  //   }
  //
  //   Token? token = Token.fromJson(tokenCache);
  //
  //   return token;
  // }
  //
  // Future<bool> validateToken(Token token) async {
  //   DateTime expirationDate = DateTime.parse(token.tokenExpirationDate);
  //   DateTime now = DateTime.now();
  //
  //   if (expirationDate.isBefore(now)) {
  //     removeToken();
  //     return false;
  //   }
  //
  //   dynamic response = await AppHttpClient.client.get('/ws/auth/validate-token');
  //   ValidateTokenResponseDTO validateTokenResponseDTO = ValidateTokenResponseDTO.fromJson(response.data);
  //
  //   if (!validateTokenResponseDTO.valid) {
  //     removeToken();
  //     return false;
  //   }
  //
  //   Token renewedToken = Token(
  //       token: token.token,
  //       tokenExpirationDate: validateTokenResponseDTO.tokenExpirationDate!
  //   );
  //
  //   await Cache.saveObject('token', renewedToken);
  //
  //   return true;
  // }
  //
  // Future<UpdateUserPasswordResponseDTO> updateUserPassword(UpdateUserPasswordRequestDTO updateUserPasswordRequestDTO) async {
  //   var response = await AppHttpClient.client.put('/ws/auth/update-password', data: updateUserPasswordRequestDTO);
  //   UpdateUserPasswordResponseDTO updateUserPasswordResponseDTO = UpdateUserPasswordResponseDTO.fromJson(response.data);
  //
  //   Token renewedToken = Token(
  //       token: updateUserPasswordResponseDTO.token!,
  //       tokenExpirationDate: updateUserPasswordResponseDTO.tokenExpirationDate!
  //   );
  //
  //   await Cache.saveObject('token', renewedToken);
  //
  //   return updateUserPasswordResponseDTO;
  // }
  //
  // Future<UpdateUserPasswordResponseDTO> resetUserPassword(ResetUserPasswordRequestDTO resetUserPasswordRequestDTO) async {
  //   var response = await AppHttpClient.client.put('/ws/auth/reset-password', data: resetUserPasswordRequestDTO);
  //   UpdateUserPasswordResponseDTO updateUserPasswordResponseDTO = UpdateUserPasswordResponseDTO.fromJson(response.data);
  //
  //   Token renewedToken = Token(
  //       token: updateUserPasswordResponseDTO.token!,
  //       tokenExpirationDate: updateUserPasswordResponseDTO.tokenExpirationDate!
  //   );
  //
  //   await Cache.saveObject('token', renewedToken);
  //
  //   return updateUserPasswordResponseDTO;
  // }

}