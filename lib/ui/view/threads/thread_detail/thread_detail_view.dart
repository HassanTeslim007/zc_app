import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/smart_widgets/thread_card/thread_card_view.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/view/dm_user/icons/zap_icon.dart';
import 'package:hng/ui/view/threads/thread_detail/thread_detail_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../test_data.dart';

class ThreadDetailView extends StatelessWidget {
  const ThreadDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var _scrollController = useScrollController();
    // var _messageController = useTextEditingController();
    ScrollController _scrollController = ScrollController();
    TextEditingController _messageController = TextEditingController();
    return ViewModelBuilder<ThreadDetailViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: CustomText(text: "Threads", fontWeight: FontWeight.bold),
            leading: IconButton(
                onPressed: model.exitPage,
                icon: Icon(
                  Icons.arrow_back_ios,
                )),
          ),
          body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Text("Channel"),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "${userPost[0].channelName}",
                      ),
                    ),
                  ],
                ),
              ),

              ThreadCardView.detail(userPost[0]),
              // SizedBox(height: 10),
              // Padding(
              //     padding: EdgeInsets.all(5),
              //     child: EmojisList(userPost: userPost[1])),
              Divider(
                color: AppColors.borderColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${userPost[0].userThreadPosts!.length} Replies",
                        style: AppTextStyles.body2Bold),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.forward_outlined,
                              color: AppColors.greyishColor,
                            )),
                        IconButton(
                            onPressed: model.showThreadOptions,
                            icon: Icon(Icons.more_vert_rounded,
                                color: AppColors.greyishColor)),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  color: AppColors.borderColor,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: userPost[0].userThreadPosts!.length,
                  itemBuilder: (context, index) => ThreadCardView.threadPost(
                      userPost[0].userThreadPosts![index]),
                ),
              ),
              //message starts here
              Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(height: 0, color: Color(0xFF999999)),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 56,
                              margin: EdgeInsets.only(left: 13.0),
                              alignment: Alignment.centerLeft,
                              child: FocusScope(
                                child: Focus(
                                  onFocusChange: (focus) {
                                    if (focus) {
                                      model.onMessageFieldTap();
                                    } else {
                                      model.onMessageFocusChanged();
                                    }
                                  },
                                  child: TextField(
                                    controller: _messageController,
                                    expands: true,
                                    maxLines: null,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration.collapsed(
                                        hintText: 'Add a Reply',
                                        hintStyle: AppTextStyles.faintBodyText),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !model.isVisible,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.darkGreyColor,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.attach_file_outlined,
                                    color: AppColors.darkGreyColor,
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Visibility(
                          visible: model.isVisible,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        AppIcons.shapezap,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.alternate_email_outlined,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.tag_faces_sharp,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.attach_file_outlined,
                                        color: AppColors.darkGreyColor,
                                      )),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (_messageController.text
                                        .toString()
                                        .isNotEmpty) {
                                      model.addReply(
                                          userPost[0],
                                          TextSpan(
                                              text: _messageController.text,
                                              style: TextStyle(
                                                  color: AppColors
                                                      .deepBlackColor)));

                                      _messageController.text = "";
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      _scrollController.jumpTo(_scrollController
                                          .position.maxScrollExtent);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: AppColors.darkGreyColor,
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ]),
          )),
      viewModelBuilder: () => ThreadDetailViewModel(),
    );
  }
}