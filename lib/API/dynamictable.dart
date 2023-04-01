import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:college/API/apiconfig.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef CellsCallback = List<DataCell> Function(dynamic currentRowData);

class DynamicTable extends StatefulWidget {
  const DynamicTable({
    super.key,
    required this.source,
    required this.columns,
  });
  final DynamicDataTableSource source;
  final List<DataColumn> columns;
  @override
  State<DynamicTable> createState() => _DynamicTableState();
}

class _DynamicTableState extends State<DynamicTable> {
  final _rowsPerPage = 1;
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: input(context, "البحث",
                icon: const FaIcon(FontAwesomeIcons.magnifyingGlass)),
          ),
          AdvancedPaginatedDataTable(
            columns: widget.columns
                .map((e) => DataColumn(
                    label: e.label, onSort: setSort, numeric: e.numeric))
                .toList(),
            source: _source,
            loadingWidget: () => progressIndicator(context),
            errorWidget: () => errorIndicator(
                context, "حدث خطأ في التحميل, يرجى اعادة المحاولة"),
            addEmptyRows: false,
            showHorizontalScrollbarAlways: true,
            sortAscending: _sortAsc,
            sortColumnIndex: _sortIndex,
            showFirstLastButtons: true,
            customTableFooter: (source, offset) {
              const maxPagesToShow = 4;
              const maxPagesBeforeCurrent = 1;
              final lastRequestDetails = source.lastDetails!;
              final rowsForPager = lastRequestDetails.filteredRows ??
                  lastRequestDetails.totalRows;
              final totalPages = rowsForPager ~/ _rowsPerPage;
              final currentPage = (offset ~/ _rowsPerPage) + 1;
              List<int> pageList = [];
              if (currentPage > 1) {
                pageList.addAll(
                  List.generate(currentPage - 1, (index) => index + 1),
                );
                //Keep up to 3 pages before current in the list
                pageList.removeWhere(
                  (element) => element < currentPage - maxPagesBeforeCurrent,
                );
              }
              pageList.add(currentPage);
              //Add reminding pages after current to the list
              pageList.addAll(
                List.generate(
                  maxPagesToShow - (pageList.length - 1),
                  (index) => (currentPage + 1) + index,
                ),
              );
              pageList.removeWhere((element) => element > totalPages);

              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: pageList
                    .map(
                      (e) => TextButton(
                        onPressed: e != currentPage
                            ? () {
                                //Start index is zero based
                                source.setNextView(
                                  startIndex: (e - 1) * _rowsPerPage,
                                );
                              }
                            : null,
                        child: Text(
                          e.toString(),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
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
                amountText += ' filtered from ($totalFilter)';
              }

              return amountText;
            },
            rowsPerPage: 1,
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
    var response = await Api().dio.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> rows = response.data as List;
      return RemoteDataSourceDetails(1, rows,
          filteredRows: lastSearchTerm.isNotEmpty ? rows.length : null);
    } else {
      throw Exception('Unable to query remote server');
    }
  }
}
