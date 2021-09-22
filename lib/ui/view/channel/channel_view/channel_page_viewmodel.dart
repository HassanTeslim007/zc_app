import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends BaseViewModel {

    //final navigator = locator<NavigationService>();
    final _navigationService = locator<NavigationService>();

   navigateToChannelInfoScreen(int numberOfMembers, List<ChannelMembermodel> channelMembers,
   
   ChannelModel channelDetail) {
    
    NavigationService().navigateTo(Routes.channelInfoView,arguments: ChannelInfoViewArguments(
      numberOfMembers: numberOfMembers, channelMembers: channelMembers,channelDetail: channelDetail));
   
  }


  void goBack() {
    NavigationService().back();
  
}
  // navigateToChannelInfo() {
  //   _navigationService.navigateTo(Routes.channelInfoView);
  // }

  navigateToAddPeople() {
    _navigationService.navigateTo(Routes.addPeopleView);
  }

}
// import 'package:hng/ui/view/channel/channel_view/channel_page_view.form.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';

// class ChannelPageViewModel extends FormViewModel {
//   String? get message => editorValue!.trim();

//   final _navigationService = locator<NavigationService>();

//   Future navigateToChannelInfo() async{
//    await _navigationService.navigateTo(Routes.channelInfoView);
//   }

//   Future navigateToAddPeople()async {

//     await _navigationService.navigateTo(Routes.addPeopleView);

//   }

//   @override
//   void setFormStatus() {}
// }
