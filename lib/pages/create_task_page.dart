//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CreateTaskPage extends StatefulWidget {
//   CreateTaskPage({Key? key}) : super(key: key);
//
//   @override
//   State<CreateTaskPage> createState() => _CreateTaskPageState();
// }
//
// class _CreateTaskPageState extends State<CreateTaskPage> {
//
//   final TextEditingController titleTextController = TextEditingController();
//   final TextEditingController detailsTextController = TextEditingController();
//
//   @override
//   void initState() {
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("AppBar"),
//         backgroundColor: Colors.white,
//         centerTitle: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               //SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: TextFormField(
//
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               TextFormField(
//
//               )
//               // if(widget.isDetailPage && detailsTextController.text.length<300) SizedBox(height: 140),
//               SizedBox(height: 20),
//               // SizedBox(height: 25),
//               // Row(
//               //   children: [
//               //     SizedBox(width: 15,),
//               //     Text(
//               //       getString("tags") +
//               //           " - " +
//               //           '${getTagCount(tags.length)}',
//               //       style: TextStyle().mediumLightGreyTextStyle,
//               //     ),
//               //   ],
//               // ),
//               widget.isDetailPage ?
//               widget.noteData != null && widget.noteData!.tags != null && widget.noteData!.tags!.isNotEmpty ?
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Text(getString("tagged_contacto"),textAlign: TextAlign.start,style: TextStyle().boldSubtitleTextStyleForNotes,),
//                   ),
//                   IgnorePointer(
//                     ignoring: widget.isDetailPage,
//                     child: InkWell(
//                       child: Container(
//                         padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
//                         color: Colors.transparent,
//                         child: IgnorePointer(
//                           child: CustomTextInput(
//                             hintTextString: getString("tag_contacto"),
//                             labelText: _getTagList(),
//                             inputType: widget.isDetailPage? InputType.Default : InputType.Add,
//                             textEditController:addTagsTextEditingController,
//                             readOnly: true,
//                             showCursor: false,
//                             onFieldSubmitted: (v) {},
//                           ),
//                         ),
//                       ),
//                       onTap: () {
//                         showDialog<List<SearchUserItemResponse>>(
//                           context: context,
//                           barrierDismissible: true,
//                           builder: (BuildContext context) {
//                             return BackdropFilter(
//                               filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                               child: ShareCardSelectionPage(
//                                       (List<SearchUserItemResponse> selectedItems) {
//                                     Navigator.pop(context, selectedItems);
//                                     tags = selectedItems;
//                                     setState(() {});
//                                   },
//                                   pageRoleTitle: 'tag_contacto',
//                                   currentItems: tags),
//                             );
//                           },
//                         ).then((value) {
//                           setState(() {
//                             if (value != null) {
//                               tags = value;
//                             }
//                           });
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ) : SizedBox() :
//               widget.isOnline ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   tags.isNotEmpty ?
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Text(getString("tagged_contacto"),textAlign: TextAlign.start,style: TextStyle().boldSubtitleTextStyleForNotes,),
//                   ) : SizedBox(),
//                   InkWell(
//                     child: Container(
//                       padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
//                       color: Colors.transparent,
//                       child: IgnorePointer(
//                         child: CustomTextInput(
//                           hintTextString: getString("tag_contacto"),
//                           labelText: _getTagList(),
//                           inputType: widget.isDetailPage? InputType.Default : InputType.Add,
//                           textEditController:addTagsTextEditingController,
//                           readOnly: true,
//                           showCursor: false,
//                           onFieldSubmitted: (v) {},
//                         ),
//                       ),
//                     ),
//                     onTap: () {
//                       showDialog<List<SearchUserItemResponse>>(
//                         context: context,
//                         barrierDismissible: true,
//                         builder: (BuildContext context) {
//                           return BackdropFilter(
//                             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                             child: ShareCardSelectionPage(
//                                     (List<SearchUserItemResponse> selectedItems) {
//                                   Navigator.pop(context, selectedItems);
//                                   tags = selectedItems;
//                                   setState(() {});
//                                 },
//                                 pageRoleTitle: 'tag_contacto',
//                                 currentItems: tags),
//                           );
//                         },
//                       ).then((value) {
//                         setState(() {
//                           if (value != null) {
//                             tags = value;
//                           }
//                         });
//                       });
//                     },
//                   ),
//                 ],
//               ) : SizedBox() ,
//               widget.isDetailPage ?
//               widget.noteData != null && widget.noteData!.sharedWith != null && widget.noteData!.sharedWith!.isNotEmpty ?
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Text(getString("shared_with"),textAlign: TextAlign.start,style: TextStyle().boldSubtitleTextStyleForNotes,),
//                   ),
//                   IgnorePointer(
//                     ignoring: widget.isDetailPage,
//                     child: InkWell(
//                       child: Container(
//                         padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
//                         color: Colors.transparent,
//                         child: IgnorePointer(
//                           child: CustomTextInput(
//                             hintTextString: getString("shared_with"),
//                             labelText: _getParticipantsList(),
//                             inputType: widget.isDetailPage? InputType.Default : InputType.Add,
//                             textEditController:addParticipantsTextEditingController,
//                             readOnly: true,
//                             showCursor: false,
//                             onFieldSubmitted: (v) {},
//                           ),
//                         ),
//                       ),
//                       onTap: () {
//                         showDialog<List<SearchUserItemResponse>>(
//                           context: context,
//                           barrierDismissible: true,
//                           builder: (BuildContext context) {
//                             return BackdropFilter(
//                               filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                               child: ShareCardSelectionPage(
//                                       (List<SearchUserItemResponse> selectedItems) {
//                                     Navigator.pop(context, selectedItems);
//                                     sharedWith = selectedItems;
//                                     setState(() {});
//                                   },
//                                   pageRoleTitle: 'shared_with',
//                                   currentItems: sharedWith),
//                             );
//                           },
//                         ).then((value) {
//                           setState(() {
//                             if (value != null) {
//                               sharedWith = value;
//                             }
//                           });
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ) : SizedBox() :
//               widget.isOnline ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   sharedWith.isNotEmpty ?
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Text(getString("shared_with"),textAlign: TextAlign.start,style: TextStyle().boldSubtitleTextStyleForNotes,),
//                   ) : SizedBox(),
//                   InkWell(
//                     child: Container(
//                       padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
//                       color: Colors.transparent,
//                       child: IgnorePointer(
//                         child: CustomTextInput(
//                           hintTextString: getString("shared_with"),
//                           labelText: _getParticipantsList(),
//                           inputType: widget.isDetailPage? InputType.Default : InputType.Add,
//                           textEditController:addParticipantsTextEditingController,
//                           readOnly: true,
//                           showCursor: false,
//                           onFieldSubmitted: (v) {},
//                         ),
//                       ),
//                     ),
//                     onTap: () {
//                       showDialog<List<SearchUserItemResponse>>(
//                         context: context,
//                         barrierDismissible: true,
//                         builder: (BuildContext context) {
//                           return BackdropFilter(
//                             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                             child: ShareCardSelectionPage(
//                                     (List<SearchUserItemResponse> selectedItems) {
//                                   Navigator.pop(context, selectedItems);
//                                   sharedWith = selectedItems;
//                                   setState(() {});
//                                 },
//                                 pageRoleTitle: 'shared_with',
//                                 currentItems: sharedWith),
//                           );
//                         },
//                       ).then((value) {
//                         setState(() {
//                           if (value != null) {
//                             sharedWith = value;
//                           }
//                         });
//                       });
//                     },
//                   ),
//                 ],
//               ) : SizedBox(),
//               widget.isDetailPage ?
//               widget.noteData != null && widget.noteData!.createdAt != null ?
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         text: getString("date") + ": ",
//                         style: TextStyle().flameBoldStyle,
//                         children: [
//                           TextSpan(
//                             text: toSimpleDateString(widget.noteData?.createdAt),
//                             style: TextStyle().colorVampireGreyTextFieldStyle,
//                           ),
//                         ],
//                       ),
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         text: getString("time") + ": ",
//                         style: TextStyle().flameBoldStyle,
//                         children: [
//                           TextSpan(
//                             text: toStringWithOnlyTimeFormatForUtcTimeZone(widget.noteData?.createdAt),
//                             style: TextStyle().colorVampireGreyTextFieldStyle,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20,)
//                   ],
//                 ),
//               ) : Container() : Container(),
//               widget.isDetailPage?
//               SizedBox():
//               // widget.noteData != null && widget.noteData?.id != null ?
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 150, 0, 48),
//                 child: Builder(builder: (bContext) {
//                   return Container(
//                     child: Center(
//                       child: ElevatedButton(
//                         child: Text(getString('save_first_letter_caps')),
//                         onPressed: () async {
//                           if (titleTextController.text != '') {
//                             if(widget.noteData != null && widget.noteData?.id != null ) {
//                               NotesEditingRequest notesEditingRequest = NotesEditingRequest();
//                               notesEditingRequest.noteTitle = titleTextController.text;
//                               notesEditingRequest.noteDescription = detailsTextController.text;
//                               notesEditingRequest.noteId = noteId;
//                               notesEditingRequest.tags = tags.map((e) => e.id ?? "").toList();
//                               notesEditingRequest.sharedWith = sharedWith.map((e) => e.id ?? "").toList();
//                               await BlocProvider.of<NotesAddingCubit>(context).editNotes(notesEditingRequest,isOnline: widget.isOnline);
//                             }else{
//                               NotesAddingRequest noteAddRequest = NotesAddingRequest();
//                               noteAddRequest.noteTitle = titleTextController.text;
//                               noteAddRequest.noteDescription = detailsTextController.text;
//                               noteAddRequest.tags = tags.map((e) => e.id ?? "").toList();
//                               noteAddRequest.sharedWith = sharedWith.map((e) => e.id ?? "").toList();
//                               await BlocProvider.of<NotesAddingCubit>(context).addNotes(noteAddRequest, isOnline: widget.isOnline);
//                             }
//                           } else {
//                             locate<AppScaffoldManager>().showSnackBar(getString('note_title_validation'));
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: AppColors.flame,
//                           // padding: EdgeInsets.symmetric(horizontal: 35)
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }