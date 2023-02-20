import 'package:arruma_ufpr_app/src/services/remote/http_client/app_http_client.dart';
import 'package:arruma_ufpr_app/src/incident/dto/request/create_incident_interaction_request_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_interaction_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_interactions_response_dto.dart';

class IncidentInteractionRepository {

  Future<IncidentInteractionsResponseDTO> getIncidentInteractions(int incidentId) async {
    dynamic response = await AppHttpClient.client.get('/incident/interaction/$incidentId');

    return IncidentInteractionsResponseDTO.fromJson(response.data);
  }

  Future<IncidentInteractionResponseDTO> createIncidentInteraction(CreateIncidentInteractionRequestDTO requestBody) async {
    dynamic response = await AppHttpClient.client.post('/incident/interaction', data: requestBody);

    return IncidentInteractionResponseDTO.fromJson(response.data);
  }

}