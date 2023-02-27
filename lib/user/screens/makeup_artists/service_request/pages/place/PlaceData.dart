part of 'PlaceImports.dart';

class PlaceData {
  final GlobalKey<CustomButtonState> btnNextPlace = GlobalKey();
  final GlobalKey<FormState> formAddress = GlobalKey();
  final GlobalKey<DropdownSearchState> areaDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> cityDropKey = GlobalKey();
  final List<String> listMonths = ["يناير","فبراير","مارس","ابريل","مايو","يناير"];
  final List<DropdownModel>? listArea = [];
  DropdownModel? selectedCompany;

  TextEditingController address = TextEditingController();

  // methods

  void nextPlace() {
    ServiceRequestData servicesData = ServiceRequestData();
    servicesData.changePage(2);
  }

  void setAreas() {
  }

  List<DropdownModel> areasList = [
    DropdownModel(id: 1, name: "Cairo"),
    DropdownModel(id: 2, name: "Mansoura"),
  ];

  // List<DropdownModel>? getAreas() {
  //   List<DropdownModel>? list = [];
  //   list.add(DropdownModel(id: 0, name: "Cairo"));
  //   return list;
  // }

  void setArea(DropdownModel? model) {
    selectedCompany = model;
  }
}
