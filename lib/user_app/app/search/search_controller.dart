import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/post_api/post_api.dart';
import 'package:mobilegarage/models/garage_model.dart';

class SearchScreenController extends GetxController {
  static SearchScreenController instance = Get.find();
  TextEditingController searchController = TextEditingController();
  int selectedIndexPrice = 0;
  int selectedIndexClosest = 0;
  int selectedIndexRating = 0;
  int selectedIndexResults = 0;
  String selecetedPrice = '';
  String selecetedPlace = '';
  String selecetedRating = '';

  void updateApplySelections() async {
    selecetedPrice = selectedIndexPrice == 0
        ? ''
        : selectedIndexPrice == 1
            ? 'From low to high'
            : 'From high to low';
    /////////
    selecetedPlace = selectedIndexClosest == 0
        ? ''
        : selectedIndexClosest == 1
            ? 'From the closest to the furthest'
            : 'Random';
    ////////////
    selecetedRating = selectedIndexRating == 0
        ? ''
        : selectedIndexRating == 1
            ? 'From high to low'
            : 'From low to high';

    update();
    // filter  with rating
    if (selectedIndexRating == 2) {
      filteredGarages.sort((a, b) => (double.tryParse(a.rating ?? '0') ?? 0)
          .compareTo(double.tryParse(b.rating ?? '0') ?? 0));
    } else if (selectedIndexRating == 1) {
      filteredGarages.sort((a, b) => (double.tryParse(b.rating ?? '0') ?? 0)
          .compareTo(double.tryParse(a.rating ?? '0') ?? 0));
    }

    // filter with location

    if (selectedIndexClosest == 1) {
      Position position = await _getCurrentLocation();

      double userLat = position.latitude;
      double userLng = position.longitude;
      garages.sort((a, b) {
        double distanceA = calculateDistance(
            userLat,
            userLng,
            double.tryParse(a.lat ?? '0') ?? 0,
            double.tryParse(a.lng ?? '0') ?? 0);
        double distanceB = calculateDistance(
            userLat,
            userLng,
            double.tryParse(b.lat ?? '0') ?? 0,
            double.tryParse(b.lng ?? '0') ?? 0);
        return distanceA.compareTo(distanceB);
      });
    } else if (selectedIndexClosest == 2) {
      garages.shuffle();
    }
    update();
  }

  Future<Position> _getCurrentLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Handle if location service is not enabled
      throw Exception('Location services are disabled');
    }

    // Check for permission to access the location
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    // Get the current position of the user
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  double calculateDistance(
      double userLat, double userLng, double garageLat, double garageLng) {
    var latDistance = (userLat - garageLat).abs();
    var lngDistance = (userLng - garageLng).abs();
    return latDistance + lngDistance;
  }

  void ResetSelections() {
    selecetedPrice = '';
    selecetedPlace = '';
    selecetedRating = '';
    selectIndexPrice(0);
    selectIndexClosest(0);
    selectIndexRating(0);
    update();
  }

  void selectIndexPrice(int index) {
    selectedIndexPrice = index;
    update();
  }

  void selectIndexClosest(int index) {
    selectedIndexClosest = index;
    update();
  }

  void selectIndexRating(int index) {
    selectedIndexRating = index;

    update();
  }

  void selectIndexResults(int index) {
    selectedIndexResults = index;
    update();
  }

  // TODO implementation code //

  List<GarageModel> garages = [];
  List<GarageModel> filteredGarages = [];
  String? searchText = '';
  String selectedCategory = '';

  @override
  void onInit() {
    searchText = Get.parameters['searchtext']?.toString();
    searchController.text = searchText.toString();
    getGarages();
    super.onInit();
  }


  Future getGarages() async {
    var response = await PostApi.getAllGarages(searchText);
    log('$response');
    if (response != {}) {
      garages = (response['garages'] as List<dynamic>)
          .map((postJson) => GarageModel.fromJson(postJson))
          .toList();
      filteredGarages = garages;
      if (garages.isNotEmpty) {
        GarageModel post = garages.first;
        lat = double.tryParse(post.lat!);
        lng = double.tryParse(post.lng!);
        getPlaceName(lat!, lng!);
      }
    }
    update();
  }

  Future getsearchGarages() async {
    var response = await PostApi.getAllGarages(searchController.text);
    log('$response');
    if (response != {}) {
      garages = (response['garages'] as List<dynamic>)
          .map((postJson) => GarageModel.fromJson(postJson))
          .toList();
      update();
      filteredGarages = garages;
      if (garages.isNotEmpty) {
        GarageModel post = garages.first;
        lat = double.tryParse(post.lat!);
        lng = double.tryParse(post.lng!);
        getPlaceName(lat!, lng!);
        update();
      }
    }
    update();
  }
  

  void filterPosts({String? query, String? category}) {
    searchText = query ?? '';
    selectedCategory = category ?? '';

    print(
        'Filtering garages with searchText: $searchText and selectedCategory: $selectedCategory');

    if (searchText!.isEmpty && selectedCategory.isEmpty) {
      filteredGarages = garages;
    } else {
      filteredGarages = garages.where((post) {
        final postName = post.name?.toLowerCase() ?? '';
        // final postCategory = post.subCategory?.name.toLowerCase() ?? '';

        final matchesSearchText =
            searchText!.isEmpty || postName.contains(searchText!.toLowerCase());
        // final matchesCategory = selectedCategory.isEmpty || postCategory.contains(selectedCategory.toLowerCase());

        return matchesSearchText;
      }).toList();
    }

    print('Filtered garages count: ${filteredGarages.length}');
    update();
  }

// Location
  String currentAddress = '';
  double? lat;
  double? lng;

  Future<void> getPlaceName(double latitude, double longitude) async {
    print("sssssssssssssssssssssssslatitude$latitude");
    print("sssssssssssssssssssssssslongitude$longitude");

    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
         update();
    if (placemarks.isNotEmpty) {
     
      Placemark place = placemarks.first;
      currentAddress =
          ' ${place.locality}, ${place.administrativeArea}, ${place.country}';
      update();
      print(
          "dddddddddddddddddddddddddddddddddddddddddddddddddcurrentAddress$currentAddress");
    }
    update();
  }
}
