import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class UserInfoItem extends StatelessWidget {
  final String label;
  final Widget? content;
  final VoidCallback? onHeaderTap;
  const UserInfoItem(
      {Key? key, required this.label, this.content, this.onHeaderTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ExpandableNotifier(
        controller: ExpandableController(),
        child: ScrollOnExpand(
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              hasIcon: true,
              iconSize: 16.0,
              expandIcon: Icons.add,
              collapseIcon: Icons.remove,
              iconColor: SiteColors.brown,
              alignment: Alignment.centerLeft,
              iconPlacement: ExpandablePanelIconPlacement.left,
              iconPadding: EdgeInsets.only(right: 16.0, top: 2.0),
            ),
            expanded: content ?? Container(),
            collapsed: Container(),
            header: GestureDetector(
              onTap: onHeaderTap,
              child: Text(
                label,
                style: const TextStyle(
                  color: SiteColors.brown,
                  fontSize: FontSizes.regular,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
