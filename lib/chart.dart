import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';



/// The home page of the application which hosts the datagrid.
class table extends StatefulWidget {
  /// Creates the home page.
  table({Key? key}) : super(key: key);

  @override
  _tableState createState() => _tableState();
}

class _tableState extends State<table> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: Container(
        child: SfDataGrid(
          source: employeeDataSource,
          columnWidthMode: ColumnWidthMode.none,
          frozenColumnsCount: 1,
          columns: <GridColumn>[
            GridTextColumn(
                columnName: 'id',
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'ID',
                    ))),
            GridTextColumn(
                columnName: 'name',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('Name'))),
            GridTextColumn(
                columnName: 'name2',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('Name'))),
            GridTextColumn(
                columnName: 'name3',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('Name'))),
            GridTextColumn(
                columnName: 'name4',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('Name'))),
            GridTextColumn(
                columnName: 'name5',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('Name'))),
            GridTextColumn(
                columnName: 'designation',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Designation',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridTextColumn(
                columnName: 'salary',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('Salary'))),
          ],
        ),
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'name2', value: e.name),
              DataGridCell<String>(columnName: 'name3', value: e.name),
              DataGridCell<String>(columnName: 'name4', value: e.name),
              DataGridCell<String>(columnName: 'name5', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}