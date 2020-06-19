// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(days) => "${days} d";

  static m1(hours) => "${hours} h";

  static m2(minutes) => "${minutes} m";

  static m3(count) => "+ ${count} more";

  static m4(min, mean, max) => "Min: ${min} ms / Mean: ${mean} ms / Max: ${max} ms";

  static m5(current, total) => "Progress: ${current}/${total}";

  static m6(value) => "Last result: ${value} ms";

  static m7(value) => "${value} x";

  static m8(value) => "Your ping was better than ${value}% of others";

  static m9(value) => "Ping value for others was ${value} ms";

  static m10(value) => "${value} ms";

  static m11(currentHost, newHost) => "Do you want to stop current session for ${currentHost} and start new one for ${newHost}?";

  static m12(count) => "${count} results";

  static m13(seconds) => "${seconds} s";

  static m14(weeks) => "${weeks} w";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appVersion" : MessageLookupByLibrary.simpleMessage("Version"),
    "archiveEmptyDesc" : MessageLookupByLibrary.simpleMessage("Save results after pinging a host or let the app make it each time automatically in settings"),
    "archivePageTitle" : MessageLookupByLibrary.simpleMessage("Archive"),
    "cancelButtonLabel" : MessageLookupByLibrary.simpleMessage("CANCEL"),
    "confirmHostRemoveTitle" : MessageLookupByLibrary.simpleMessage("Do you want to remove selected hosts?"),
    "confirmRemoveDesc" : MessageLookupByLibrary.simpleMessage("This actions is irreversible"),
    "confirmResultRemoveTitle" : MessageLookupByLibrary.simpleMessage("Do you want to delete this result?"),
    "dataFetchFailedDesc" : MessageLookupByLibrary.simpleMessage("Something went wrong when getting the data - try again after some time"),
    "dataFetchFailedTitle" : MessageLookupByLibrary.simpleMessage("Could not fetch data"),
    "daysSinceNow" : m0,
    "enableLocationPromptDesc" : MessageLookupByLibrary.simpleMessage("Your location will be used to match it with your result and to present it for other users."),
    "enableLocationPromptTitle" : MessageLookupByLibrary.simpleMessage("Enable location to see your result compared with others"),
    "favoritesPageTitle" : MessageLookupByLibrary.simpleMessage("Favorites"),
    "getStartedButtonLabel" : MessageLookupByLibrary.simpleMessage("Get started"),
    "homeCurrentSubtitle" : MessageLookupByLibrary.simpleMessage("Current"),
    "homeFavoritesEmptyPlaceholder" : MessageLookupByLibrary.simpleMessage("Bookmark pinged hosts to access them easily"),
    "homeFavoritesSubtitle" : MessageLookupByLibrary.simpleMessage("Favorites"),
    "homeIntroDesc" : MessageLookupByLibrary.simpleMessage("Use search field above to choose host to ping or see intro explaining app concept"),
    "homePageTitle" : MessageLookupByLibrary.simpleMessage("Pinger"),
    "homePopularSubtitle" : MessageLookupByLibrary.simpleMessage("Popular"),
    "homeRecentsEmptyPlaceholder" : MessageLookupByLibrary.simpleMessage("Latest host will show up here after you ping one"),
    "homeRecentsSubtitle" : MessageLookupByLibrary.simpleMessage("Recents"),
    "hoursSinceNow" : m1,
    "introAdjustSettingsDesc" : MessageLookupByLibrary.simpleMessage("Change host monitoring preferences and behavior of entire application"),
    "introAdjustSettingsTitle" : MessageLookupByLibrary.simpleMessage("Adjust settings"),
    "introPingHostDesc" : MessageLookupByLibrary.simpleMessage("Either perform a quick ping by long pressing play button or tap it to start ping session"),
    "introPingHostTitle" : MessageLookupByLibrary.simpleMessage("Ping host"),
    "introSaveResultsDesc" : MessageLookupByLibrary.simpleMessage("Archive ping results to review them later and compare them with rest of the world"),
    "introSaveResultsTitle" : MessageLookupByLibrary.simpleMessage("Save results"),
    "introSelectHostDesc" : MessageLookupByLibrary.simpleMessage("Either pick one of the search results or enter your own host and confirm your choice"),
    "introSelectHostTitle" : MessageLookupByLibrary.simpleMessage("Select host"),
    "minutesSinceNow" : m2,
    "moreHostsButtonLabel" : MessageLookupByLibrary.simpleMessage("More"),
    "moreHostsCountButtonLabel" : m3,
    "nothingToShowTitle" : MessageLookupByLibrary.simpleMessage("There\'t nothing here yet"),
    "notificationDoneBody" : m4,
    "notificationDoneTitle" : MessageLookupByLibrary.simpleMessage("Ping done"),
    "notificationPausedBody" : m5,
    "notificationPausedTitle" : MessageLookupByLibrary.simpleMessage("Ping paused"),
    "notificationStartedBody" : m6,
    "notificationStartedTitle" : MessageLookupByLibrary.simpleMessage("Ping started"),
    "pingCountLabel" : m7,
    "pingFailedCountLabel" : MessageLookupByLibrary.simpleMessage("Failed"),
    "pingGlobalByFrequencyDesc" : m8,
    "pingGlobalByFrequencySubtitle" : MessageLookupByLibrary.simpleMessage("Results by frequency"),
    "pingGlobalByLocationDesc" : m9,
    "pingGlobalByLocationSubtitle" : MessageLookupByLibrary.simpleMessage("Results by location"),
    "pingGlobalYourResult" : MessageLookupByLibrary.simpleMessage("Your result"),
    "pingInfoDateLabel" : MessageLookupByLibrary.simpleMessage("Date"),
    "pingInfoDurationLabel" : MessageLookupByLibrary.simpleMessage("Duration"),
    "pingInfoInfoSubtitle" : MessageLookupByLibrary.simpleMessage("Info"),
    "pingInfoSettingsSubtitle" : MessageLookupByLibrary.simpleMessage("Settings"),
    "pingMaxValueLabel" : MessageLookupByLibrary.simpleMessage("Max"),
    "pingMeanCountLabel" : MessageLookupByLibrary.simpleMessage("Mean"),
    "pingMinCountLabel" : MessageLookupByLibrary.simpleMessage("Min"),
    "pingSettingsSheetSubtitle" : MessageLookupByLibrary.simpleMessage("Changes will be applied only for current sesion"),
    "pingSettingsSheetTitle" : MessageLookupByLibrary.simpleMessage("Ping settings"),
    "pingSuccessCountLabel" : MessageLookupByLibrary.simpleMessage("Success"),
    "pingSummaryCountLabel" : MessageLookupByLibrary.simpleMessage("Ping count"),
    "pingSummaryDateLabel" : MessageLookupByLibrary.simpleMessage("Date"),
    "pingSummaryDurationLabel" : MessageLookupByLibrary.simpleMessage("Duration"),
    "pingTotalCountLabel" : MessageLookupByLibrary.simpleMessage("Total"),
    "pingValueLabel" : m10,
    "recentsPageTitle" : MessageLookupByLibrary.simpleMessage("Recents"),
    "removeHostsTitle" : MessageLookupByLibrary.simpleMessage("Remove"),
    "replaceSessionSheetSubtitle" : m11,
    "replaceSessionSheetTitle" : MessageLookupByLibrary.simpleMessage("Another session running"),
    "resetButtonLabel" : MessageLookupByLibrary.simpleMessage("RESET"),
    "resultGlobalEmptyDesc" : MessageLookupByLibrary.simpleMessage("Check again after some time when there\'s data available for this host"),
    "resultOtherEmptyDesc" : MessageLookupByLibrary.simpleMessage("Other results will show up here once you finish at least one ping for this host"),
    "resultPageTitle" : MessageLookupByLibrary.simpleMessage("Result"),
    "resultResultsSubtitle" : MessageLookupByLibrary.simpleMessage("Results"),
    "resultsGlobalTabLabel" : MessageLookupByLibrary.simpleMessage("Global"),
    "resultsGroupCount" : m12,
    "resultsInfoTabLabel" : MessageLookupByLibrary.simpleMessage("Info"),
    "resultsMoreTabLabel" : MessageLookupByLibrary.simpleMessage("More"),
    "resultsResultsTabLabel" : MessageLookupByLibrary.simpleMessage("Results"),
    "searchHostHint" : MessageLookupByLibrary.simpleMessage("Search host to ping"),
    "searchResultsEmptyDesc" : MessageLookupByLibrary.simpleMessage("We could not find anything for given query but you can still use it as host"),
    "searchResultsEmptyTitle" : MessageLookupByLibrary.simpleMessage("No results found"),
    "secondsSinceNow" : m13,
    "sessionAdjustButtonLabel" : MessageLookupByLibrary.simpleMessage("Adjust"),
    "sessionEditButtonLabel" : MessageLookupByLibrary.simpleMessage("Edit"),
    "sessionFavoriteButtonLabel" : MessageLookupByLibrary.simpleMessage("Favorite"),
    "sessionPageTitle" : MessageLookupByLibrary.simpleMessage("Session"),
    "sessionPingCountsSubtitle" : MessageLookupByLibrary.simpleMessage("Progress"),
    "sessionPingValuesSubtitle" : MessageLookupByLibrary.simpleMessage("Ping"),
    "sessionResultsSubtitle" : MessageLookupByLibrary.simpleMessage("Results"),
    "sessionStartPromptDesc" : MessageLookupByLibrary.simpleMessage("Long press the button to quickly ping the host just a several times"),
    "sessionStartPromptTitle" : MessageLookupByLibrary.simpleMessage("Tap button to start pinging"),
    "sessionSummarySubtitle" : MessageLookupByLibrary.simpleMessage("Summary"),
    "settingSheetTitle" : MessageLookupByLibrary.simpleMessage("Provide new value"),
    "settingsAttachLocationDesc" : MessageLookupByLibrary.simpleMessage("Current location will be attached to statistics data to allow present it on global results map"),
    "settingsAttachLocationTitle" : MessageLookupByLibrary.simpleMessage("Attach location"),
    "settingsNightModeTitle" : MessageLookupByLibrary.simpleMessage("Night mode"),
    "settingsOtherSectionTitle" : MessageLookupByLibrary.simpleMessage("Other"),
    "settingsPageTitle" : MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsPingCountLabel" : MessageLookupByLibrary.simpleMessage("Count"),
    "settingsPingCountUnit" : MessageLookupByLibrary.simpleMessage("x"),
    "settingsPingIntervalLabel" : MessageLookupByLibrary.simpleMessage("Interval"),
    "settingsPingIntervalUnit" : MessageLookupByLibrary.simpleMessage("s"),
    "settingsPingPacketSizeLabel" : MessageLookupByLibrary.simpleMessage("Packet size"),
    "settingsPingPacketSizeUnit" : MessageLookupByLibrary.simpleMessage("B"),
    "settingsPingSectionTitle" : MessageLookupByLibrary.simpleMessage("Ping"),
    "settingsPingTimeoutLabel" : MessageLookupByLibrary.simpleMessage("Timeout"),
    "settingsPingTimeoutUnit" : MessageLookupByLibrary.simpleMessage("s"),
    "settingsRestoreHostDesc" : MessageLookupByLibrary.simpleMessage("Application will automatically proceed to new session with latest host"),
    "settingsRestoreHostTitle" : MessageLookupByLibrary.simpleMessage("Restore host"),
    "settingsResultsSectionTitle" : MessageLookupByLibrary.simpleMessage("Results"),
    "settingsShareResultsDesc" : MessageLookupByLibrary.simpleMessage("Results statistics will be sent to allow other application users to compare their results"),
    "settingsShareResultsLabel" : MessageLookupByLibrary.simpleMessage("Share results"),
    "settingsSystemNotificationDesc" : MessageLookupByLibrary.simpleMessage("Application will show current status of running session in system tray"),
    "settingsSystemNotificationTitle" : MessageLookupByLibrary.simpleMessage("System notification"),
    "shareLocationButtonLabel" : MessageLookupByLibrary.simpleMessage("Share location"),
    "showIntroButtonLabel" : MessageLookupByLibrary.simpleMessage("Show intro"),
    "skipButtonLabel" : MessageLookupByLibrary.simpleMessage("SKIP"),
    "startNowButtonLabel" : MessageLookupByLibrary.simpleMessage("Start now"),
    "tryAgainButtonLabel" : MessageLookupByLibrary.simpleMessage("Try again"),
    "viewTypeChartLabel" : MessageLookupByLibrary.simpleMessage("Chart"),
    "viewTypeGaugleLabel" : MessageLookupByLibrary.simpleMessage("Gauge"),
    "viewTypeListLabel" : MessageLookupByLibrary.simpleMessage("List"),
    "viewTypeMax" : MessageLookupByLibrary.simpleMessage("Max"),
    "viewTypeMean" : MessageLookupByLibrary.simpleMessage("Mean"),
    "viewTypeMin" : MessageLookupByLibrary.simpleMessage("Min"),
    "weeksSinceNow" : m14
  };
}
