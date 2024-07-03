import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../impVariable.dart';
import '../../themes/theme.dart';

class propertyTypeSearch extends StatefulWidget {
  TextEditingController textController;
  propertyTypeSearch({super.key, required this.textController});

  @override
  State<propertyTypeSearch> createState() => _propertyTypeSearchState();
}

class _propertyTypeSearchState extends State<propertyTypeSearch> {
  final String hint = 'Property Type';

  final icon = Icons.real_estate_agent_outlined;
  final List item =  [
    'Residential',
    'Apartment',
    'Office',
  ];
  String? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: lRed,
            width: .5,
          )
      ),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.only(
              left: .0, right: .0, top: 8.0, bottom: 8.0),
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: [
                CircleAvatar(
                  backgroundColor: lRed,
                  child: const Icon(
                    color: Colors.white,
                    Icons.real_estate_agent_outlined,
                  ),
                ),
                sb10,
                Expanded(
                  child: Text(
                    hint,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[800]
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: item
                .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[700]
                ),
                overflow: TextOverflow.fade,
              ),
            ))
                .toList(),
            value: controller,
            onChanged: (value) {
              setState(() {
                controller = value as String;
                widget.textController.text = controller!;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14), color: Colors.white),
            ),
            iconStyleData:  IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: lRed,
              ),
              iconEnabledColor: lRed,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: MediaQuery.of(context).size.width,
              padding: null,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: Colors.white),
              elevation: 8,
              offset: const Offset(-20, 0),
              scrollbarTheme: const ScrollbarThemeData(
                radius: Radius.circular(40),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ),
    );
  }
}
