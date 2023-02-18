import 'package:arruma_ufpr_app/src/incident/entity/incident.dart';
import 'package:get/get.dart';

class IncidentsPageController extends GetxController {

  final List<Incident> listIncidents = List<Incident>.empty(growable: true).obs;

  @override
  void onReady() async {
    super.onReady();

    fetchIncidents();
  }

  void fetchIncidents() {

    listIncidents.add(Incident(
      title: 'Oi',
      description: 'das',
    ));
  }

}