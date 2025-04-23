import 'package:flutter/material.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';

void openNotificationSheet(BuildContext context) {
  showModalBottomSheet(
    // the bottom sheet
    context: context,
    backgroundColor: Theme.of(context).cardColor,
    isScrollControlled: true, // Makes the bottom sheet more flexible
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => NotificationWidget(),
  );
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      height: MediaQuery.of(context).size.height * 0.85,
      padding: EdgeInsets.all(16),
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: Text(
                     AppLocalizations.of(context)!.notifications,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert_outlined),
                ),
              ],
            ),
            SizedBox(height: 10),
            TabBar(
              indicatorColor: Colors.green,
              tabs: [Tab(text: AppLocalizations.of(context)!.allTab), Tab(text: AppLocalizations.of(context)!.unreadTab), Tab(text: AppLocalizations.of(context)!.readTab)],
            ),
            SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: [
                  _buildNotificationList( context),
                  _buildNotificationList( context),
                  _buildNotificationList( context),
                ],
              ),
            ),
      
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(BuildContext context, ) {
  return ListView(
    children: [
      _buildNotificationItem(
        AppLocalizations.of(context)!.delayed_order_title,
        AppLocalizations.of(context)!.delayed_order_subTitle,

      ),
      _buildNotificationItem(
        AppLocalizations.of(context)!.promotional_offer_title,
                AppLocalizations.of(context)!.promotional_offer_subTitle,


      ),
      _buildNotificationItem(
        AppLocalizations.of(context)!.out_for_delivery_title,
        AppLocalizations.of(context)!.out_for_delivery_subTitle,


      
      ),
      _buildNotificationItem(
        AppLocalizations.of(context)!.order_confirmation_title,
          AppLocalizations.of(context)!.order_confirmation_subTitle,

        
      ),
      _buildNotificationItem(
        AppLocalizations.of(context)!.delivered_title,
        AppLocalizations.of(context)!.delivered_subTitle,

        
      ),
    ],
  );
}


  Widget _buildNotificationItem(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: () {},
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
