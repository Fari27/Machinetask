import 'package:sample/src/config/api_service_url.dart';
import 'package:sample/src/core/api_service.dart';
import 'package:sample/src/models/add_employee_model.dart';
import 'package:sample/src/models/designation_model.dart';
import 'package:sample/src/models/get_employees_model.dart';

class EmployeeRepository {
  Future<GetEmployeesModel> getEmployees() async {
    final Map<String, dynamic> resp = await ApiService()
        .getJSONRequestWithJWTToken(url: ApiServiceUrls.viewEmployees);
    return GetEmployeesModel.fromJson(resp);
  }

  Future<AddEmployeesModel> addEmployees({required dynamic postParams}) async {
    final Map<String, dynamic> resp = await ApiService()
        .postRequestWithJWTToken(
            url: ApiServiceUrls.viewEmployees, requestBody: postParams);
    return AddEmployeesModel.fromJson(resp);
  }

  Future<DesignationModel> getDesignation() async {
    final Map<String, dynamic> resp = await ApiService()
        .getJSONRequestWithJWTToken(url: ApiServiceUrls.designations);
    return DesignationModel.fromJson(resp);
  }
}
