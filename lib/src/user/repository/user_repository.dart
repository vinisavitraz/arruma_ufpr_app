import 'package:arruma_ufpr_app/src/services/remote/http_client/app_http_client.dart';
import 'package:arruma_ufpr_app/src/auth/entity/authenticated_user_info.dart';
import 'package:arruma_ufpr_app/src/user/dto/request/update_user_password.dart';
import 'package:arruma_ufpr_app/src/user/dto/response/status_response_dto.dart';
import 'package:arruma_ufpr_app/src/user/dto/response/user_response_dto.dart';
import 'package:arruma_ufpr_app/src/user/entity/user.dart';

class UserRepository {

  Future<AuthenticatedUserInfo> getAuthenticatedUserInfo() async {
    dynamic response = await AppHttpClient.client.get('/auth/authenticated-user-info');

    return AuthenticatedUserInfo.fromJson(response.data);
  }

  Future<UserResponseDTO> updateUser(User user) async {
    dynamic response = await AppHttpClient.client.put('/user', data: user);

    return UserResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> updateUserPassword(UpdateUserPasswordRequestDTO requestBody) async {
    dynamic response = await AppHttpClient.client.put('/user/password', data: requestBody);

    return StatusResponseDTO.fromJson(response.data);
  }

}