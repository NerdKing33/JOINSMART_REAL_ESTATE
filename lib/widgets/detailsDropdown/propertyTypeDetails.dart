import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/theme.dart';

class propertyTypeDetails extends StatefulWidget {
  TextEditingController textController = TextEditingController();
  propertyTypeDetails({
    super.key,
  required this.textController,
  });

  @override
  State<propertyTypeDetails> createState() => _propertyTypeDetailsState();
}

class _propertyTypeDetailsState extends State<propertyTypeDetails> {
  final String hint = 'Property Type';

  final icon = Icons.real_estate_agent_outlined;
  final List item = [
    'Residential',
    'Apartment',
    'Office',
  ];
  String? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
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
                left: 15.0, right: 15.0, top: 8.0, bottom: 8.0),
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children: [
                  Icon(
                    icon,
                    color: lRed,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
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
                      color: Colors.grey[800]
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
                width: 190,
                height: 50,
                padding: const EdgeInsets.only(
                    left: 14,
                    right: 14
                ),
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
                maxHeight: 300,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0), color: Colors.white),
                elevation: 0,
                useRootNavigator: false,
                offset: const Offset(-20, 0),
                scrollbarTheme: const ScrollbarThemeData(
                  radius: Radius.circular(15.0),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 50,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
