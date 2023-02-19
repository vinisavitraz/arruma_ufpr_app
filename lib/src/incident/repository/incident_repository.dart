import 'package:arruma_ufpr_app/services/remote/http_client/app_http_client.dart';
import 'package:arruma_ufpr_app/src/incident/dto/request/create_incident_request_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/status_response_dto.dart';
import '../dto/response/incidents_response_dto.dart';

class IncidentRepository {

  Future<IncidentsResponseDTO> getIncidents(String status) async {
    dynamic response = await AppHttpClient.client.get('/incident/status/$status');

    return IncidentsResponseDTO.fromJson(response.data);
  }

  Future<IncidentsResponseDTO> getUserIncidents(String status) async {
    dynamic response = await AppHttpClient.client.get('/incident/user/status/$status');

    return IncidentsResponseDTO.fromJson(response.data);
  }

  Future<IncidentResponseDTO> createIncident(CreateIncidentRequestDTO requestBody) async {
    dynamic response = await AppHttpClient.client.post('/incident', data: requestBody);

    return IncidentResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> assignIncidentToAdmin(int incidentId) async {
    dynamic response = await AppHttpClient.client.put('/incident/assign/$incidentId');

    return StatusResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> closeIncident(int incidentId) async {
    dynamic response = await AppHttpClient.client.put('/incident/close/$incidentId');

    return StatusResponseDTO.fromJson(response.data);
  }

}