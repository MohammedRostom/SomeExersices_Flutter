// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_applicatioaserwerwr/controller/cartController.dart';
// import 'package:flutter_applicatioaserwerwr/controller/note_viewContrloller.dart';
// import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
// import 'package:get/get.dart';

// class note_view extends StatelessWidget {
//   const note_view({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: GetBuilder<note_viewContrloller>(
//         init: note_viewContrloller(),
//         builder: (controller) => flotingAciton(
//           context,
//           controller,
//         ),
//       ),
//       appBar: AppBar(),
//       body: GetBuilder<note_viewContrloller>(
//           init: note_viewContrloller(),
//           builder: (ControllerNote) {
//             return ListView.builder(
//                 itemCount: ControllerNote.AllNoteList.length,
//                 itemBuilder: (_, index) {
//                   return Dismissible(
//                     key: UniqueKey(),
//                     background: Container(
//                       color: Colors.red,
//                       alignment: Alignment.centerRight,
//                       width: double.infinity,
//                       child: const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Icon(
//                           Icons.delete_forever,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     onDismissed: (dira) {
//                       ControllerNote.deleate(
//                           ControllerNote.AllNoteList[index]!.id!);
//                       print(ControllerNote.id);
//                     },
//                     child: listile(
//                       model: ControllerNote.AllNoteList[index]!,
//                       ControllerNote: ControllerNote,
//                       idndex: index,
//                     ),
//                   );
//                 });
//           }),
//     );
//   }

// //method FloatingActionButton
//   FloatingActionButton flotingAciton(
//       BuildContext context, note_viewContrloller controller) {
//     return FloatingActionButton(
//       onPressed: () {
//         showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//                   content: Form(
//                     key: controller.Key,
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           onSaved: (value) {
//                             controller.title = value;
//                           },
//                           decoration: const InputDecoration(),
//                         ),
//                         TextFormField(
//                           onSaved: (value) {
//                             controller.subtitle = value;
//                           },
//                           decoration: const InputDecoration(),
//                         ),
//                         ElevatedButton(
//                             onPressed: () {
//                               controller.Key.currentState!.save();
//                               NotModel noteOPJ = NotModel(
//                                   title: controller.title,
//                                   subTitle: controller.subtitle);
//                               controller.addNote(noteOPJ);
//                               Get.back();
//                             },
//                             child: const Text("Save"))
//                       ],
//                     ),
//                   ),
//                 ));
//       },
//       child: const Text("Add"),
//     );
//   }
// }

// //widgwt
// class listile extends StatelessWidget {
//   listile({
//     super.key,
//     required this.model,
//     required this.ControllerNote,
//     this.idndex,
//   });
//   final NotModel model;
//   note_viewContrloller? ControllerNote;
//   final dynamic? idndex;
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: const Icon(
//         Icons.note,
//         size: 50,
//       ),
//       trailing: IconButton(
//           onPressed: () {
//             showDialog(
//                 context: context,
//                 builder: (_) => AlertDialog(
//                       content: Form(
//                         key: ControllerNote!.Key,
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               initialValue:
//                                   ControllerNote!.AllNoteList[idndex]!.title!,
//                               onSaved: (value) {
//                                 ControllerNote!.title = value;
//                               },
//                               decoration: const InputDecoration(),
//                             ),
//                             TextFormField(
//                               initialValue: ControllerNote!
//                                   .AllNoteList[idndex]!.subTitle!,
//                               onSaved: (value) {
//                                 ControllerNote!.subtitle = value;
//                               },
//                               decoration: const InputDecoration(),
//                             ),
//                             ElevatedButton(
//                                 onPressed: () async {
//                                   ControllerNote!.Key.currentState!.save();
//                                   NotModel newOPject = NotModel(
//                                       title: ControllerNote!.title,
//                                       subTitle: ControllerNote!.subtitle);
//                                   await ControllerNote!.UpdateNote(newOPject);
//                                   Get.back();
//                                 },
//                                 child: const Text("Savidit"))
//                           ],
//                         ),
//                       ),
//                     ));
//           },
//           icon: const Icon(Icons.edit)),
//       title: Text("${model.title}"),
//       subtitle: Text("${model.subTitle}"),
//     );
//   }
// }
