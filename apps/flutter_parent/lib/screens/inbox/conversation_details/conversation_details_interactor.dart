// Copyright (C) 2020 - present Instructure, Inc.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, version 3 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

import 'package:flutter/cupertino.dart';
import 'package:flutter_parent/models/attachment.dart';
import 'package:flutter_parent/models/conversation.dart';
import 'package:flutter_parent/models/message.dart';
import 'package:flutter_parent/network/api/inbox_api.dart';
import 'package:flutter_parent/network/utils/api_prefs.dart';
import 'package:flutter_parent/screens/dashboard/inbox_notifier.dart';
import 'package:flutter_parent/utils/service_locator.dart';

class ConversationDetailsInteractor {
  Future<Conversation> getConversation(String id) async {
    Conversation conversation = await locator<InboxApi>().getConversation(id, refresh: true);

    // Fetching a conversation automatically marks it as read, so we'll want to update the inbox count badge
    locator<InboxCountNotifier>().update();

    return conversation;
  }

  Future<Conversation> addReply(BuildContext context, Conversation conversation, Message message, bool replyAll) async {
    // TODO: Will be implemented in MBL-13654
    return null;
  }

  String getCurrentUserId() => ApiPrefs.getUser().id;

  void viewAttachment(BuildContext context, Attachment attachment) {
    // TODO: Will be implemented in MBL-13655
  }
}
