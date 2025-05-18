import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/product_provider.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({super.key});

  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  double _minPrice = 0;
  double _maxPrice = 250000;
  String _selectedCategory = 'Tous';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    final categories = provider.categories;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Filtres",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0073C0), // bleu
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Catégorie",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF0073C0),
              ),
            ),
          ),
          DropdownButton<String>(
            value: _selectedCategory,
            dropdownColor: Colors.blue[50],
            iconEnabledColor: Color(0xFF0073C0),
            style: GoogleFonts.poppins(color: Color(0xFF0073C0), fontSize: 14),
            isExpanded: true,
            items:
                categories
                    .map(
                      (cat) => DropdownMenuItem(
                        value: cat,
                        child: Text(cat, style: GoogleFonts.poppins()),
                      ),
                    )
                    .toList(),
            onChanged: (value) => setState(() => _selectedCategory = value!),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Prix (en DA)",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF0073C0),
              ),
            ),
          ),
          RangeSlider(
            values: RangeValues(_minPrice, _maxPrice),
            min: 0,
            max: 250000,
            divisions: 20,
            labels: RangeLabels(
              '${_minPrice.toInt()} DA',
              '${_maxPrice.toInt()} DA',
            ),
            activeColor: Color(0xFF0073C0),
            inactiveColor: Colors.blue[100],
            onChanged: (RangeValues values) {
              setState(() {
                _minPrice = values.start;
                _maxPrice = values.end;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0073C0),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              provider.setPriceFilter(_minPrice, _maxPrice);
              provider.setCategoryFilter(_selectedCategory);
              Navigator.pop(context);
            },
            child: Text(
              "Appliquer",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
