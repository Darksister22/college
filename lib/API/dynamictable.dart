import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:college/API/apiconfig.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef CellsCallback = List<DataCell> Function(dynamic currentRowData);

class DynamicTable extends StatefulWidget {
  const DynamicTable(
      {super.key,
      required this.source,
      required this.columns,
      required this.add,
      required this.label});
  final DynamicDataTableSource source;
  final List<DataColumn> columns;
  final Function add;
  final String label;
  @override
  State<DynamicTable> createState() => _DynamicTableState();
}

class _DynamicTableState extends State<DynamicTable> {
  var _rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  late DynamicDataTableSource _source; //the source of the data table.
  var _sortIndex = 0;
  var _sortAsc = true; //determine how to sort.
  final _searchController = TextEditingController(); //used for search
  @override
  void initState() {
    super.initState();
    _source = widget.source;
  }

  void setSort(int i, bool asc) => setState(() {
        _sortIndex = i;
        _sortAsc = asc;
      });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: input(context, "البحث",
                        controller: _searchController,
                        icon: const FaIcon(FontAwesomeIcons.magnifyingGlass)),
                  ),
                ),
                iconLabelButton(widget.add, widget.label, FontAwesomeIcons.plus)
              ],
            ),
          ),
          AdvancedPaginatedDataTable(
            addEmptyRows: false,
            source: _source,
            showHorizontalScrollbarAlways: true,
            sortAscending: _sortAsc,
            sortColumnIndex: _sortIndex,
            showFirstLastButtons: true,
            rowsPerPage: _rowsPerPage,
            availableRowsPerPage: const [10],
            onRowsPerPageChanged: (newRowsPerPage) {
              if (newRowsPerPage != null) {
                setState(() {
                  _rowsPerPage = newRowsPerPage;
                });
              }
            },
            columns: widget.columns
                .map((e) => DataColumn(
                    label: e.label, onSort: setSort, numeric: e.numeric))
                .toList(),

            loadingWidget: () => progressIndicator(context),
            errorWidget: () => errorIndicator(
                context, "حدث خطأ في التحميل, يرجى اعادة المحاولة"),
            //Optianl override to support custom data row text / translation
            getFooterRowText:
                (startRow, pageSize, totalFilter, totalRowsWithoutFilter) {
              final localizations = MaterialLocalizations.of(context);
              var amountText = localizations.pageRowsInfoTitle(
                startRow,
                pageSize,
                totalFilter ?? totalRowsWithoutFilter,
                false,
              );

              if (totalFilter != null) {
                //Filtered data source show addtional information
                amountText += ' filtered from ($totalRowsWithoutFilter)';
              }

              return amountText;
            },
          ),
        ],
      ),
    );
  }
}

class DynamicDataTableSource extends AdvancedDataTableSource<dynamic> {
  DynamicDataTableSource({required this.cells, required this.uri});

  CellsCallback cells;
  String uri;

  List<String> selectedIds = [];
  String lastSearchTerm = '';

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: cells(lastDetails!.rows[index]));
  }

  @override
  int get selectedRowCount => selectedIds.length;

  // ignore: avoid_positional_boolean_parameters
  void selectedRow(String id, bool newSelectState) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }

  void filterServerSide(String filterQuery) {
    lastSearchTerm = filterQuery.toLowerCase().trim();
    setNextView();
  }

  @override
  Future<RemoteDataSourceDetails<dynamic>> getNextPage(
    NextPageRequest pageRequest,
  ) async {
    final queryParameter = <String, dynamic>{
      'page': (pageRequest.offset / pageRequest.pageSize + 1).toInt(),
      'pageSize': pageRequest.pageSize.toString(),
    };
    var response = await Api().dio.get(uri, queryParameters: queryParameter);
    if (response.statusCode == 200) {
      List<dynamic> rows = response.data['data'] as List;
      return RemoteDataSourceDetails(response.data['total'], rows,
          filteredRows: lastSearchTerm.isNotEmpty ? rows.length : null);
    } else {
      throw Exception('Unable to query remote server');
    }
  }
}
