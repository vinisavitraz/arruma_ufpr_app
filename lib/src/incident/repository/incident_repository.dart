import 'package:arruma_ufpr_app/src/services/remote/http_client/app_http_client.dart';
import 'package:arruma_ufpr_app/src/incident/dto/request/create_incident_request_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/incident_response_dto.dart';
import 'package:arruma_ufpr_app/src/incident/dto/response/status_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<StatusResponseDTO> addImageToIncident(int incidentId, XFile file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });
    dynamic response = await AppHttpClient.client.put('/incident/image/$incidentId', data: data);
    print(response.data);
    return StatusResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> assignIncidentToAdmin(int incidentId) async {
    dynamic response = await AppHttpClient.client.put('/incident/assign/$incidentId');

    return StatusResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> closeIncident(int incidentId) async {
    dynamic response = await AppHttpClient.client.put('/incident/close/$incidentId');

    return StatusResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> reopenIncident(int incidentId) async {
    dynamic response = await AppHttpClient.client.put('/incident/re-open/$incidentId');

    return StatusResponseDTO.fromJson(response.data);
  }

  Future<StatusResponseDTO> setIncidentRating(int incidentId, int rating) async {
    dynamic response = await AppHttpClient.client.put('/incident/set-rating/$rating/incident/$incidentId');

    return StatusResponseDTO.fromJson(response.data);
  }

}