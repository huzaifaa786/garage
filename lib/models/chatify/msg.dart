class Msg {
  String? id;
  String? body;
  String? from_id;
  String? to_id;
  String? file_name;
  String? file_title;
  String? file_type;
  DateTime? dateTime;
  String? location;
  double? lat;
  double? lng;

  Msg(massage,{this.lat, this.lng}) {
    id = massage['id'];
    body = massage['body'];
    from_id = massage['from_id'].toString();
    to_id = massage['to_id'].toString();
    file_name = massage['attachment'] != null
        ? massage['attachment']['file'] ?? ''
        : '';
    file_title = massage['attachment'] != null
        ? massage['attachment']['title'] ?? ''
        : '';
    file_type = massage['attachment'] != null
        ? massage['attachment']['type'] ?? ''
        : '';
    dateTime = DateTime.parse(massage['created_at']).toLocal();
    location = massage['location'] ?? '';

    // // Parse lat and lng from location if available
    // if (location!.isNotEmpty) {
    //   List<String> latLng = location!.split(',');
    //   if (latLng.length == 2) {
    //     lat = double.tryParse(latLng[0].trim());
    //     lng = double.tryParse(latLng[1].trim());
    //   }
    // }
  }
}
