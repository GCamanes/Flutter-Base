import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/context.extension.dart';
import 'package:flutter_base/core/utils/ui.constants.dart';

class HomeTileWidget extends StatelessWidget {
  const HomeTileWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  void _goToNext(BuildContext context) => log('Some action on tile $title');

  @override
  Widget build(BuildContext context) {
    /// Main widget
    return GestureDetector(
      onTap: () => _goToNext(context),
      child: Container(
        padding: const EdgeInsets.all(UIConstants.innerPadding),
        height: 75,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: <Widget>[
            Text(
              context.trad.data,
              // We don't want UI issues with long title
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(width: UIConstants.innerPadding),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
