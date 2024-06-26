// //upperPartContactInfo
// Container(
// padding: const EdgeInsets.all(8.0),
// decoration: BoxDecoration(
// color: Colors.grey.shade100,
// borderRadius: BorderRadius.circular(10),
// boxShadow: [
// BoxShadow(
// color: Colors.grey.shade500,
// offset: const Offset(3.0, 1.0),
// blurRadius: 5.0,
// spreadRadius: 1.0)
// ]),
// child: Row(
// children: userPostData['uid'] != null
// ? [
// CircleAvatar(
// radius: 30,
// backgroundImage: NetworkImage(
// userPostData['mainPost'])),
// sb20,
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// userPostData['username'],
// style: GoogleFonts.galdeano(
// color: Colors.black,
// letterSpacing: 1,
// wordSpacing: 1,
// fontSize: 18),
// ),
// Text(
// 'Contact info: ${userPostData['userNumber']}',
// style: GoogleFonts.rajdhani(
// color: Colors.black),
// )
// ]),
// ]
//     : [
// const CircleAvatar(
// radius: 30,
// ),
// SizedBox(
// width: MediaQuery.of(context).size.width*.45,
// ),
// Center(
// child: SizedBox(
// height: 40,
// width: 40,
// child: CircularProgressIndicator(
// strokeWidth: 5,
// color: lRed,
// ),
// ),
// )
// ])),