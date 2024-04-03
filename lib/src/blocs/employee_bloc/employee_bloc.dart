import 'package:bloc/bloc.dart';
import 'package:sample/src/models/add_employee_model.dart';
import 'package:sample/src/models/designation_model.dart';
import 'package:sample/src/models/get_employees_model.dart';
import 'package:sample/src/repositories/employee_repository.dart';
import 'package:sample/src/util/app_enums.dart';
import 'package:sample/src/widgets/dropdown_widget.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  List<GenderModel> genderList = [
    GenderModel(id: 1, name: 'male'),
    GenderModel(id: 2, name: 'female')
  ];
  EmployeeBloc() : super(EmployeeInitial()) {
    on<GetEmployeeEvent>((event, emit) async {
      await _handleGetEmployee(event, emit);
    });
    on<AddEmployeeEvent>((event, emit) async {
      await _handleAddEmployee(event, emit);
    });
    on<GetDesignationEvent>((event, emit) async {
      await _handleGetDesignation(event, emit);
    });
      on<DropdownDataEvent>((event, emit) async{
     await _dropDownData(event, emit);
    });
       on<DropdownGenderDataEvent>((event, emit) async{
     await _genderdropdowndata(event, emit);
    });
  }

  Future<void> _handleGetEmployee(
      GetEmployeeEvent event, Emitter<EmployeeState> emit) async {
    try {
      final GetEmployeesModel getEmployeesModel =
          await EmployeeRepository().getEmployees();

      emit(GetEmployeeState(
          status: ApiRequestStatus.success,
          resp: getEmployeesModel.data?.data ?? []));
    } catch (e) {
      print("object");
    }
  }

  Future<void> _handleAddEmployee(
      AddEmployeeEvent event, Emitter<EmployeeState> emit) async {
    try {
      final AddEmployeesModel employeeResponse =
          await EmployeeRepository().addEmployees(postParams: event.reqParams);

      emit(AddEmployeeState(
          status: ApiRequestStatus.success, resp: employeeResponse));
    } catch (e) {
      print("object");
    }
  }

    _dropDownData(DropdownDataEvent event, Emitter<EmployeeState> emit) {
    final selectedCategory = event.dropDownSelect;

    
    emit(DropdownDataState(dropDownSelect: selectedCategory));
  }

   _genderdropdowndata(DropdownGenderDataEvent event, Emitter<EmployeeState> emit) {
    final genderselectedCategory = event.gendeDdropDownSelect;

    
    emit(GenderDropdownDataState(gendeDdropDownSelect: genderselectedCategory));
  }

  

  Future<void> _handleGetDesignation(
      GetDesignationEvent event, Emitter<EmployeeState> emit) async {
    try {
      final DesignationModel designationModel =
          await EmployeeRepository().getDesignation();

      emit(GetDesignationState(
          status: ApiRequestStatus.success,
          resp: designationModel.data?.data ?? []));
    } catch (e) {
      print("object");
    }
  }
}
