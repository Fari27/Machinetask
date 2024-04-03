import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sample/src/base/base_page.dart';
import 'package:sample/src/blocs/employee_bloc/employee_bloc.dart';
import 'package:sample/src/blocs/login_bloc/login_bloc.dart';
import 'package:sample/src/util/app_colors.dart';
import 'package:sample/src/util/app_enums.dart';
import 'package:sample/src/util/app_sizes.dart';
import 'package:sample/src/util/input_validator.dart';
import 'package:sample/src/widgets/button_widget.dart';
import 'package:sample/src/widgets/dropdown_widget.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  EmployeeBloc? employeeBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employeeBloc = BlocProvider.of<EmployeeBloc>(context);
    employeeBloc?.add(GetDesignationEvent());
    employeeBloc
        ?.add(DropdownDataEvent(dropDownSelect: DropDownItems(titleId: 348)));
    employeeBloc?.add(DropdownGenderDataEvent(
        gendeDdropDownSelect: DropDownItems(titleId: 1)));
  }

  final TextEditingController _firstNameField = TextEditingController();
  final TextEditingController _secondNameField = TextEditingController();
  final TextEditingController _mobileNumberField = TextEditingController();
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _addressField = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  DateTime? _selectedDate;
  DropDownItems? selectedCategory;
  DropDownItems? genderSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: _getBody(context),
      padding: EdgeInsets.only(
          right: AppWidgetSizes.dimen_16,
          left: AppWidgetSizes.dimen_16,
          top: AppWidgetSizes.dimen_16,
          bottom: AppWidgetSizes.dimen_16),
      menuRequired: false,
      appBarType: AppBarType.backWithTitle,
      title: 'Add an employee',
      footer: _savebutton(),
    );
  }

  _getBody(BuildContext context) {
    return Column(children: [
      _renderimage(),
      AppWidgetSizes.verticalSpace10,
      _firstnamefield(),
      AppWidgetSizes.verticalSpace10,
      _lastnamefield(),
      AppWidgetSizes.verticalSpace10,
      _mobilenumberfield(),
      AppWidgetSizes.verticalSpace10,
      _emailfield(),
      AppWidgetSizes.verticalSpace10,
      _addressfield(),
      AppWidgetSizes.verticalSpace10,
      _dateofbirthfeld(),
      AppWidgetSizes.verticalSpace10,
      _designationfield(),
      AppWidgetSizes.verticalSpace10,
      _genderfield(),
      AppWidgetSizes.verticalSpace10,
    ]);
  }

  _renderimage() {
    return Image.network(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png',
      height: AppWidgetSizes.dimen_100,
      width: AppWidgetSizes.dimen_100,
    );
  }

  _firstnamefield() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('First Name',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400, color: Appcolors.blackColor)),
        AppWidgetSizes.verticalSpace10,
        Container(
          height: AppWidgetSizes.dimen_50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.cyan, width: 0.5),
              color: Appcolors.textWhiteColor(context),
              boxShadow: [
                BoxShadow(
                    color: Appcolors.textColor(context).withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0.0, 0.75))
              ]),
          child: Padding(
            padding: EdgeInsets.only(
                left: AppWidgetSizes.dimen_16, right: AppWidgetSizes.dimen_16),
            child: TextField(
              onChanged: (val) {},
              cursorColor: Appcolors.blackColor,
              controller: _firstNameField,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLength: 15,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Appcolors.textLightGrayColor(context),
                    fontSize: AppWidgetSizes.fontSize14),
                labelText: 'Enter Name',
                border: InputBorder.none,
                counterText: '',
              ),
            ),
          ),
        ),
      ],
    );
  }

  _lastnamefield() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Last Name',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400, color: Appcolors.blackColor)),
        AppWidgetSizes.verticalSpace10,
        Container(
          height: AppWidgetSizes.dimen_50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.cyan, width: 0.5),
              color: Appcolors.textWhiteColor(context),
              boxShadow: [
                BoxShadow(
                    color: Appcolors.textColor(context).withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0.0, 0.75))
              ]),
          child: Padding(
            padding: EdgeInsets.only(
                left: AppWidgetSizes.dimen_16, right: AppWidgetSizes.dimen_16),
            child: TextField(
              onChanged: (val) {},
              cursorColor: Appcolors.blackColor,
              controller: _secondNameField,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLength: 15,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Appcolors.textLightGrayColor(context),
                    fontSize: AppWidgetSizes.fontSize14),
                labelText: 'Enter Name',
                border: InputBorder.none,
                counterText: '',
              ),
            ),
          ),
        ),
      ],
    );
  }

  _mobilenumberfield() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mobile Number',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400, color: Appcolors.blackColor)),
        AppWidgetSizes.verticalSpace10,
        Container(
          height: AppWidgetSizes.dimen_50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.cyan, width: 0.5),
              color: Appcolors.textWhiteColor(context),
              boxShadow: [
                BoxShadow(
                    color: Appcolors.textColor(context).withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0.0, 0.75))
              ]),
          child: Padding(
            padding: EdgeInsets.only(
                left: AppWidgetSizes.dimen_16, right: AppWidgetSizes.dimen_16),
            child: TextField(
              onChanged: (val) {},
              inputFormatters: InputValidator.mobileNumberValidator(),
              cursorColor: Appcolors.blackColor,
              controller: _mobileNumberField,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLength: 15,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Appcolors.textLightGrayColor(context),
                    fontSize: AppWidgetSizes.fontSize14),
                labelText: 'Enter Mobile Number',
                border: InputBorder.none,
                counterText: '',
              ),
            ),
          ),
        ),
      ],
    );
  }

  _emailfield() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Enter Mail Address',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400, color: Appcolors.blackColor)),
        AppWidgetSizes.verticalSpace10,
        Container(
          height: AppWidgetSizes.dimen_50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.cyan, width: 0.5),
              color: Appcolors.textWhiteColor(context),
              boxShadow: [
                BoxShadow(
                    color: Appcolors.textColor(context).withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0.0, 0.75))
              ]),
          child: Padding(
            padding: EdgeInsets.only(
                left: AppWidgetSizes.dimen_16, right: AppWidgetSizes.dimen_16),
            child: TextField(
              onChanged: (val) {},
              inputFormatters: InputValidator.userIdValidator(),
              cursorColor: Appcolors.blackColor,
              controller: _emailField,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLength: 15,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Appcolors.textLightGrayColor(context),
                    fontSize: AppWidgetSizes.fontSize14),
                labelText: 'Enter Mail Address',
                border: InputBorder.none,
                counterText: '',
              ),
            ),
          ),
        ),
      ],
    );
  }

  _addressfield() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: AppWidgetSizes.dimen_10,
        ),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: AppWidgetSizes.dimen_100,
              decoration: BoxDecoration(
                color: Appcolors.textWhiteColor(context),
                borderRadius: BorderRadius.circular(AppWidgetSizes.dimen_8),
                border: Border.all(color: Colors.cyan, width: 0.5),
              ),
              alignment: Alignment.centerLeft,
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppWidgetSizes.dimen_16,
                  ),
                  child: TextFormField(
                    onChanged: (value) {},
                    enableInteractiveSelection: false,
                    enableSuggestions: false,
                    autocorrect: false,
                    autofocus: false,
                    enabled: true,
                    maxLines: 3,
                    maxLength: 50,
                    controller: _addressField,
                    textCapitalization: TextCapitalization.none,
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.done,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Appcolors.textColor(context)),
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Enter address',
                        hintStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Appcolors.textLightGrayColor(context),
                                  fontSize: AppWidgetSizes.fontSize14,
                                ),
                        counterText: ''),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _dateofbirthfeld() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date of birth',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400, color: Appcolors.blackColor)),
        AppWidgetSizes.verticalSpace10,
        Container(
          height: AppWidgetSizes.dimen_50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.cyan, width: 0.5),
              color: Appcolors.textWhiteColor(context),
              boxShadow: [
                BoxShadow(
                    color: Appcolors.textColor(context).withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0.0, 0.75))
              ]),
          child: Padding(
            padding: EdgeInsets.only(
                left: AppWidgetSizes.dimen_16, right: AppWidgetSizes.dimen_16),
            child: TextFormField(
              controller: _dateController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_month_rounded),
                  onPressed: () => _selectDate(context),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
        DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
  }

  _designationfield() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) {
      return current is GetDesignationState || current is DropdownDataState;
    }, builder: (context, state) {
      if (state is GetDesignationState) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Designation',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w400, color: Appcolors.blackColor)),
          AppWidgetSizes.verticalSpace10,
          DropDownWidget(
            initialIndex: 0,
            dropDownItems: (state.resp ?? [])
                .map((e) => DropDownItems(title: e.name, titleId: e.id))
                .toList(),
            initialDropDownValue: (category) {
              selectedCategory = category;
            },
            onDropDownValueChange: (category) {
              selectedCategory = category;
              context
                  .read<EmployeeBloc>()
                  .add(DropdownDataEvent(dropDownSelect: selectedCategory!));
            },
          ),
        ]);
      }
      return Container();
    });
  }

  _genderfield() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
         buildWhen: (previous, current) {
      return  current is GenderDropdownDataState;},
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Gender',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w400, color: Appcolors.blackColor)),
          AppWidgetSizes.verticalSpace10,
          DropDownWidget(
            initialIndex: 0,
            dropDownItems: (employeeBloc?.genderList ?? [])
                .map((e) => DropDownItems(title: e.name, titleId: e.id))
                .toList(),
            initialDropDownValue: (category) {
              genderSelectedCategory = category;
            },
            onDropDownValueChange: (category) {
              genderSelectedCategory = category;
              context.read<EmployeeBloc>().add(DropdownGenderDataEvent(
                  gendeDdropDownSelect: genderSelectedCategory!));
            },
          ),
        ]);
      },
    );
  }

  _savebutton() {
    return Wrap(children: [
      Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppWidgetSizes.dimen_16),
            child: (_firstNameField.text.isNotEmpty &&
                    _secondNameField.text.isNotEmpty &&
                    _dateController.text.isNotEmpty &&
                    _emailField.text.isNotEmpty &&
                    _mobileNumberField.text.isNotEmpty &&
                    _addressField.text.isNotEmpty)
                ? ButtonWidget(
                    text: 'Save',
                    buttonState: ElevatedButtonState.active,
                    onPressed: () {
                      var arg = {
                        "first_name": _firstNameField.text,
                        "last_name": _secondNameField.text,
                        "join_date": "12345678Np",
                        "date_of_birth": _dateController.text,
                        "designation_id": selectedCategory?.titleId.toString(),
                        "gender": genderSelectedCategory?.titleId.toString(),
                        "email": _emailField.text,
                        "mobile": _mobileNumberField.text,
                        "landline": _mobileNumberField.text,
                        "present_address": _addressField.text,
                        "permanent_address": "",
                        "status": "",
                        "profile_picture": "",
                        "resume": "",
                      };

                      context
                          .read<EmployeeBloc>()
                          .add(AddEmployeeEvent(reqParams: arg));
                    })
                : ButtonWidget(
                    text: 'Save',
                    buttonState: ElevatedButtonState.disable,
                    onPressed: () {},
                  ),
          ),
        ],
      ),
    ]);
  }
}
