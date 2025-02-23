import 'package:eliachar_feig/models/filters.dart';
import 'package:eliachar_feig/ui_components/round_rect_button.dart';
import '../packages/default_packages.dart';
import '../packages/utlis_packages.dart';

class HorizontalFilterList extends StatefulWidget {
  final List<Filters> filters;
  final void Function(Filters filter) onSelect;
  final Color? borderColor;
  final Color? selectedColorBG;
  final Color? unSelectedColorBG;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final bool isMultiSelect;
  final int? selectedIndex;
  final bool isDarkMode;

  const HorizontalFilterList({
    super.key,
    required this.filters,
    required this.onSelect,
    this.isMultiSelect = false,
    this.borderColor,
    this.selectedColorBG,
    this.unSelectedColorBG,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.selectedIndex,
    required this.isDarkMode,
  });

  @override
  HorizontalFilterListState createState() => HorizontalFilterListState();
}

class HorizontalFilterListState extends State<HorizontalFilterList> {
  int? selectedIndex;

  void selectFilter(int index) {
    if (!widget.isMultiSelect) {
      setState(() {
        selectedIndex = index;
      });
    }

    widget.onSelect(widget.filters[index]);
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 5,
        children: widget.filters.asMap().entries.map((entry) {
          int index = entry.key;
          Filters filter = entry.value;
          final isSelected = widget.isMultiSelect ? filter.isSelected : index == selectedIndex;
          return SelectableRectButton(
            text: filter.label,
            borderColor: widget.borderColor ?? (widget.isDarkMode ? Colors.white : AppColors.darkGrayishBlue),
            selectedColorBG: widget.selectedColorBG ?? (widget.isDarkMode ? Colors.white : Colors.black),
            unSelectedColorBG: widget.unSelectedColorBG ?? (widget.isDarkMode ? Colors.grey.shade700 : Colors.white),
            selectedTextColor: widget.selectedTextColor ?? (widget.isDarkMode ? Colors.black : Colors.white),
            unselectedTextColor: widget.unselectedTextColor ?? (widget.isDarkMode ? Colors.white : Colors.black),
            isSelected: isSelected,
            borderRadius: 5,
            onPressed: () {
              selectFilter(index);
            },
          );
        }).toList(),
      ),
    );
  }
}
