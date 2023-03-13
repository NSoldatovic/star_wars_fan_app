import 'package:star_wars_fan_app/services/search_resource_service.dart';
import 'package:star_wars_fan_app/services/server_service/server_communication_service.dart';

class AllServices {

  static final AllServices _instance = AllServices._internal();

  late ServerCommunicationService serverCommunicationService;
  late SearchResourceService searchResourceService;

  factory AllServices() {
    return _instance;
  }

  AllServices._internal() {
    serverCommunicationService = ServerCommunicationService();
    searchResourceService = SearchResourceService();
  }

}