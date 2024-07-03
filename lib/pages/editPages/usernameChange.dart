import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../impVariable.dart';
import '../../resources/auth.dart';
import '../../themes/theme.dart';
import '../../widgets/textInput.dart';

class usernameChange extends StatefulWidget {
  const usernameChange({super.key});

  @override
  State<usernameChange> createState() => _usernameChangeState();
}

class _usernameChangeState extends State<usernameChange> {
  bool isLoading = false;
  void setNewUserName() async {
    setState(() {
      isLoading = true;
    });
    String res =
    await AuthMethods().userRename(userName: textEditingController.text);

    if (res != 'success') {
      setState(() {
        isLoading = false;
      });
      setState(() {
        Navigator.of(context).pop();
      });
    } else {
      setState(() {
        isLoading = false;
      });
      setState(() {
        Navigator.of(context).pop();
      });
    }
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(4.0, 4.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '  Reset your Username',
                              style: GoogleFonts.poppins(
                                  fontSize: 24, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      textInput(
                        controller: textEditingController,
                        hinty: 'Enter new Username',
                        icon: Icons.emoji_emotions_outlined,
                        obscureText: false,
                        textInputType: TextInputType.name,
                        textCapitalization: TextCapitalization.characters,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                highlightColor: pRed,
                                icon:  Text(
                                  'CANCEL',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                            ),
                          ),
                          sb10,
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 18,),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 65,
                              child: isLoading
                                  ? Center(
                                child: CircularProgressIndicator(
                                  color: lRed,
                                  strokeWidth: 4,
                                ),
                              )
                                  : InkWell(
                                onTap: setNewUserName,
                                highlightColor: pRed,
                                child: Icon(
                                  Icons.navigate_next_rounded,
                                  color: lRed,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
