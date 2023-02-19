import 'package:arruma_ufpr_app/services/remote/http_client/app_http_client.dart';
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

}