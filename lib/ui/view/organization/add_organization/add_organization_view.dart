import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';

import 'add_organization_viewmodel.dart';

//The Add Organization page, where user can add a new organization
//The route to this page is '/add-organization-view'
class AddOrganizationView extends StatelessWidget {
  const AddOrganizationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddOrganizationViewModel>.reactive(
      //this parameter allows us to reuse the view model to persist the state
      disposeViewModel: false,
      //initialise the view model only once
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => AddOrganizationViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: ZuriAppBar(
            leading: Icons.arrow_back_ios,
            orgTitle: Text(
              AddWorkspaces,
              style:
                  AppTextStyles.heading4,
            ),
            whiteBackground: true,
            leadingPress: model.back,
          ),
          body: InkWell(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(children: [
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.whiteColor,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                   ],
                    ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => model.navigateToSelectEmail(
                            OrganizationSwitchMethod.signIn),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.grid_view,
                              ),
                              const SizedBox(width: 16),
                              Text(SignInNewOrg, style: AppTextStyles.heading9),
                            ],
                          ),
                        ),
                      ),
                      const Divider(color: AppColors.dividerColor),
                      InkWell(
                        onTap: () => model.navigateToSelectEmail(
                            OrganizationSwitchMethod.join),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.add_box_outlined,
                              ),
                              const SizedBox(width: 16),
                              Text(JoinAnotherOrg,
                                  style: AppTextStyles.heading9),
                            ],
                          ),
                        ),
                      ),
                      const Divider(color: AppColors.dividerColor),
                      InkWell(
                        onTap: () => model.navigateToSelectEmail(
                            OrganizationSwitchMethod.create),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.edit_outlined,
                              ),
                              const SizedBox(width: 16),
                              Text(CreateNewOrg, style: AppTextStyles.heading9),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
