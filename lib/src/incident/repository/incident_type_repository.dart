import 'package:arruma_ufpr_app/src/incident/dto/request/create_incident_type_request_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/request/update_incident_type_request_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_type_response_dto.dart';
import 'package:arruma_ufpr_app/src/services/remote/http_client/app_http_client.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_types_response_dto.dart';

import '../../user/dto/response/status_response_dto.dart';

class IncidentTypeRepository {

  Future<IncidentTypesResponseDTO> getIncidentTypes() async {
    dynamic response = await AppHttpClient.client.get('/incident-type');

    return IncidentTypesResponseDTO.fromJson(response.data);
  }

  Future<IncidentTypeResponseDTO> getIncidentType(int incidentTypeId) async {
    dynamic response = await AppHttpClient.client.get('/incident-type/$incidentTypeId');

    return IncidentTypeResponseDTO.fromJson(response.data);
  }

  Future<IncidentTypeResponseDTO> createIncidentType(CreateIncidentTypeRequestDTO requestBody) async {
    dynamic response = await AppHttpClient.client.post('/incident-type', data: requestBody);

    return IncidentTypeResponseDTO.fromJson(response.data);
  }

  Future<IncidentTypeResponseDTO> updateIncidentType(UpdateIncidentTypeRequestDTO requestBody) async {
    dynamic response = await AppHttpClient.client.put('/incident-type', data: requestBody);

    return IncidentTypeResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> deleteIncidentType(int incidentTypeId) async {
    dynamic response = await AppHttpClient.client.delete('/incident-type/$incidentTypeId');

    return StatusResponseDTO.fromJson(response.data);
  }

}