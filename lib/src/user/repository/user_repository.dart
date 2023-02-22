import 'package:arruma_ufpr_app/src/services/remote/http_client/app_http_client.dart';
import 'package:arruma_ufpr_app/src/auth/entity/authenticated_user_info.dart';
import 'package:arruma_ufpr_app/src/user/dto/request/requet_reset_password_request_dto.dart';
import 'package:arruma_ufpr_app/src/user/dto/request/update_user_password_request_dto.dart';
import 'package:arruma_ufpr_app/src/user/dto/response/status_response_dto.dart';
import 'package:arruma_ufpr_app/src/user/dto/response/user_response_dto.dart';
import 'package:arruma_ufpr_app/src/user/entity/user.dart';
import '../dto/response/users_response_dto.dart';
import '../entity/user_with_password.dart';

class UserRepository {

  Future<AuthenticatedUserInfo> getAuthenticatedUserInfo() async {
    dynamic response = await AppHttpClient.client.get('/auth/authenticated-user-info');

    return AuthenticatedUserInfo.fromJson(response.data);
  }

  Future<UsersResponseDTO> getUsers() async {
    dynamic response = await AppHttpClient.client.get('/user');

    return UsersResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> getUserByEmail(String email) async {
    dynamic response = await AppHttpClient.client.get('/user/email/$email');

    return StatusResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> getUserByDocument(String document) async {
    dynamic response = await AppHttpClient.client.get('/user/document/$document');

    return StatusResponseDTO.fromJson(response.data);
  }

  Future<UserResponseDTO> getUser(int userId) async {
    dynamic response = await AppHttpClient.client.get('/user/$userId');

    return UserResponseDTO.fromJson(response.data);
  }

  Future<UserResponseDTO> registerUser(UserWithPassword user) async {
    dynamic response = await AppHttpClient.client.post('/user/register', data: user);

    return UserResponseDTO.fromJson(response.data);
  }

  Future<UserResponseDTO> createUser(User user) async {
    dynamic response = await AppHttpClient.client.post('/user', data: user);

    return UserResponseDTO.fromJson(response.data);
  }

  Future<UserResponseDTO> updateUser(User user) async {
    dynamic response = await AppHttpClient.client.put('/user', data: user);

    return UserResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> updateUserPassword(UpdateUserPasswordRequestDTO requestBody) async {
    dynamic response = await AppHttpClient.client.put('/user/password', data: requestBody);

    return StatusResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> requestResetUserPassword(RequestResetPasswordRequestDTO requestBody) async {
    dynamic response = await AppHttpClient.client.post('/user/reset-password', data: requestBody);

    return StatusResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> deleteUser(int userId) async {
    dynamic response = await AppHttpClient.client.delete('/user/$userId');

    return StatusResponseDTO.fromJson(response.data);
  }

}