import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../impVariable.dart';
import '../../themes/theme.dart';

class locationSearch extends StatefulWidget {
  TextEditingController controller;
   locationSearch({super.key, required this.controller});

  @override
  State<locationSearch> createState() => _locationSearchState();
}

class _locationSearchState extends State<locationSearch> {
  final String hint = 'Location';

  final icon = Icons.location_on_outlined;
  final List item = [
    'Arusha, Arusha District',
    'Arusha, Arusha City Council',
    'Arusha, Karatu ',
    'Arusha, Longido ',
    'Arusha, Meru ',
    'Arusha, Kwa Mrefu ',
    'Arusha, Ngulelo ',
    'Arusha, Sanawari ',
    'Arusha, Clocktower ',
    'Arusha, Ngarenaro ',
    'Arusha, Moshono',
    'Arusha, Kinondoni',
    'Arusha, Uzunguni',
    'Dar es Salaam, Ilala',
    'Dar es Salaam, Ubungo',
    'Dar es Salaam, Temeke ',
    'Dar es Salaam, Kigamboni',
    'Dar es Salaam, Mbezi',
    'Dar es Salaam, Goba',
    'Dar es Salaam, Kinondoni',
    'Dar es Salaam, Upanga',
    'Dar es Salaam, Posta',
    'Dar es Salaam, Masaki',
    'Mwanza, Ilemela',
    'Mwanza, Kwimba',
    'Mwanza, Magu',
    'Mwanza, Misungwi',
    'Mwanza, Nyamagana',
    'Mwanza,  Sengerema',
    'Mwanza, Ukerewe',
    'Kilimanjaro, Mwanga',
    'Kilimanjaro, Moshi Rural',
    'Kilimanjaro, Moshi Urban',
    'Kilimanjaro, Hai',
    'Kilimanjaro, Siha',
    'Kilimanjaro Rombo'
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                widget.controller.text = controller!;
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
