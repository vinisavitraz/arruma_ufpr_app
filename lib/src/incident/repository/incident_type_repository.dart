import 'package:arruma_ufpr_app/src/services/remote/http_client/app_http_client.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_types_response_dto.dart';

class IncidentTypeRepository {

  Future<IncidentTypesResponseDTO> getIncidentTypes() async {
    dynamic response = await AppHttpClient.client.get('/incident-type');

    return IncidentTypesResponseDTO.fromJson(response.data);
  }

}