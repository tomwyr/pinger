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

  static m5(host) => "${host} [done]";

  static m6(current, total) => "Progress: ${current}/${total}";

  static m7(host) => "${host} [paused]";

  static m8(value) => "Last result: ${value} ms";

  static m9(host) => "${host} [in progress]";

  static m10(value) => "${value} x";

  static m11(value) => "Your result is better than ${value}% of others";

  static m12(value) => "Ping value for others is ${value} ms";

  static m13(value) => "${value} ms";

  static m14(currentHost, newHost) => "Stop current session ${currentHost} and start new one ${newHost}?";

  static m15(count) => "${Intl.plural(count, zero: '0 results', one: '1 result', two: '2 results', few: '${count} results', many: '${count} results', other: '${count} results')}";

  static m16(seconds) => "${seconds} s";

  static m17(weeks) => "${weeks} w";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appVersion" : MessageLookupByLibrary.simpleMessage("Version"),
    "archiveEmptyDesc" : MessageLookupByLibrary.simpleMessage("Save results after pinging a host to see them later here"),
    "archivePageTitle" : MessageLookupByLibrary.simpleMessage("Archive"),
    "cancelButtonLabel" : MessageLookupByLibrary.simpleMessage("CANCEL"),
    "confirmHostRemoveTitle" : MessageLookupByLibrary.simpleMessage("Remove selected items?"),
    "confirmRemoveDesc" : MessageLookupByLibrary.simpleMessage("This action is irreversible"),
    "confirmResultRemoveTitle" : MessageLookupByLibrary.simpleMessage("Delete this result?"),
    "dataFetchFailedDesc" : MessageLookupByLibrary.simpleMessage("Something went wrong when getting the data - try again after some time"),
    "dataFetchFailedTitle" : MessageLookupByLibrary.simpleMessage("Could not fetch data"),
    "daysSinceNow" : m0,
    "enableLocationPromptDesc" : MessageLookupByLibrary.simpleMessage("Current location will be attached to session statistics in order to comapre them on global results map"),
    "enableLocationPromptTitle" : MessageLookupByLibrary.simpleMessage("Enable location to see your result compared with others"),
    "favoritesPageTitle" : MessageLookupByLibrary.simpleMessage("Favorites"),
    "getStartedButtonLabel" : MessageLookupByLibrary.simpleMessage("Get started"),
    "homeCurrentSubtitle" : MessageLookupByLibrary.simpleMessage("Session"),
    "homeFavoritesEmptyPlaceholder" : MessageLookupByLibrary.simpleMessage("Bookmark pinged hosts to quickly access them from here"),
    "homeFavoritesSubtitle" : MessageLookupByLibrary.simpleMessage("Favorites"),
    "homeIntroDesc" : MessageLookupByLibrary.simpleMessage("Or skip intro and start using the app right away"),
    "homeIntroTitle" : MessageLookupByLibrary.simpleMessage("See short intro that presents main functionalities of the app"),
    "homePageTitle" : MessageLookupByLibrary.simpleMessage("Pinger"),
    "homePopularSubtitle" : MessageLookupByLibrary.simpleMessage("Popular"),
    "homeRecentsEmptyPlaceholder" : MessageLookupByLibrary.simpleMessage("Latest hosts will show up here after they are pinged"),
    "homeRecentsSubtitle" : MessageLookupByLibrary.simpleMessage("Recents"),
    "hoursSinceNow" : m1,
    "introAdjustSettingsDesc" : MessageLookupByLibrary.simpleMessage("Change ping settings and preferences to adjust app behavior to your needs"),
    "introAdjustSettingsTitle" : MessageLookupByLibrary.simpleMessage("Adjust settings"),
    "introPingHostDesc" : MessageLookupByLibrary.simpleMessage("Either perform a quick ping by long pressing ping button or tap it to start new session"),
    "introPingHostTitle" : MessageLookupByLibrary.simpleMessage("Ping host"),
    "introSaveResultsDesc" : MessageLookupByLibrary.simpleMessage("Archive ping results to get back to them later and compare them with other app users"),
    "introSaveResultsTitle" : MessageLookupByLibrary.simpleMessage("Save results"),
    "introSelectHostDesc" : MessageLookupByLibrary.simpleMessage("Either pick one of suggested hosts, find it among hosts pinged by other users or enter your own"),
    "introSelectHostTitle" : MessageLookupByLibrary.simpleMessage("Select host"),
    "locationAccessDisabledDesc" : MessageLookupByLibrary.simpleMessage("Change permission settings to allow the app to detect device location"),
    "locationAccessDisabledTitle" : MessageLookupByLibrary.simpleMessage("Location disabled"),
    "minutesSinceNow" : m2,
    "moreHostsButtonLabel" : MessageLookupByLibrary.simpleMessage("More"),
    "moreHostsCountButtonLabel" : m3,
    "nothingToShowTitle" : MessageLookupByLibrary.simpleMessage("There is nothing here yet"),
    "notificationAccessDisabledDesc" : MessageLookupByLibrary.simpleMessage("Change permission settings to allow the app to show notifications"),
    "notificationAccessDisabledTitle" : MessageLookupByLibrary.simpleMessage("Notifications disabled"),
    "notificationDoneBody" : m4,
    "notificationDoneTitle" : m5,
    "notificationPausedBody" : m6,
    "notificationPausedTitle" : m7,
    "notificationStartedBody" : m8,
    "notificationStartedTitle" : m9,
    "pingCountLabel" : m10,
    "pingFailedCountLabel" : MessageLookupByLibrary.simpleMessage("Failed"),
    "pingGlobalByFrequencyDesc" : m11,
    "pingGlobalByFrequencySubtitle" : MessageLookupByLibrary.simpleMessage("Results by frequency"),
    "pingGlobalByLocationDesc" : m12,
    "pingGlobalByLocationSubtitle" : MessageLookupByLibrary.simpleMessage("Results by location"),
    "pingGlobalYourResult" : MessageLookupByLibrary.simpleMessage("Your result"),
    "pingInfoDateLabel" : MessageLookupByLibrary.simpleMessage("Date"),
    "pingInfoDurationLabel" : MessageLookupByLibrary.simpleMessage("Duration"),
    "pingInfoInfoSubtitle" : MessageLookupByLibrary.simpleMessage("Info"),
    "pingInfoSettingsSubtitle" : MessageLookupByLibrary.simpleMessage("Settings"),
    "pingMaxValueLabel" : MessageLookupByLibrary.simpleMessage("Max"),
    "pingMeanCountLabel" : MessageLookupByLibrary.simpleMessage("Mean"),
    "pingMinCountLabel" : MessageLookupByLibrary.simpleMessage("Min"),
    "pingSettingsSheetSubtitle" : MessageLookupByLibrary.simpleMessage("Changes will affect only current sesion"),
    "pingSettingsSheetTitle" : MessageLookupByLibrary.simpleMessage("Ping settings"),
    "pingSuccessCountLabel" : MessageLookupByLibrary.simpleMessage("Success"),
    "pingSummaryCountLabel" : MessageLookupByLibrary.simpleMessage("Requests"),
    "pingSummaryDateLabel" : MessageLookupByLibrary.simpleMessage("Date"),
    "pingSummaryDurationLabel" : MessageLookupByLibrary.simpleMessage("Duration"),
    "pingTotalCountLabel" : MessageLookupByLibrary.simpleMessage("Total"),
    "pingValueLabel" : m13,
    "recentsPageTitle" : MessageLookupByLibrary.simpleMessage("Recents"),
    "removeHostsPageTitle" : MessageLookupByLibrary.simpleMessage("Remove"),
    "replaceSessionSheetSubtitle" : m14,
    "replaceSessionSheetTitle" : MessageLookupByLibrary.simpleMessage("Another session in progress"),
    "resetButtonLabel" : MessageLookupByLibrary.simpleMessage("RESET"),
    "resultGlobalEmptyDesc" : MessageLookupByLibrary.simpleMessage("Check again after some time when there is data available for this host"),
    "resultOtherEmptyDesc" : MessageLookupByLibrary.simpleMessage("Other results will show up here once there are more of them for this host"),
    "resultPageTitle" : MessageLookupByLibrary.simpleMessage("Results"),
    "resultResultsSubtitle" : MessageLookupByLibrary.simpleMessage("Results"),
    "resultsGlobalTabLabel" : MessageLookupByLibrary.simpleMessage("Compare"),
    "resultsGroupCount" : m15,
    "resultsInfoTabLabel" : MessageLookupByLibrary.simpleMessage("More"),
    "resultsMoreTabLabel" : MessageLookupByLibrary.simpleMessage("Other"),
    "resultsResultsTabLabel" : MessageLookupByLibrary.simpleMessage("Results"),
    "searchHostHint" : MessageLookupByLibrary.simpleMessage("Search for host..."),
    "searchResultsEmptyDesc" : MessageLookupByLibrary.simpleMessage("There are no hosts matching given query - you can still select and try to ping it"),
    "searchResultsEmptyTitle" : MessageLookupByLibrary.simpleMessage("No results found"),
    "secondsSinceNow" : m16,
    "sessionAdjustButtonLabel" : MessageLookupByLibrary.simpleMessage("Adjust"),
    "sessionFavoriteButtonLabel" : MessageLookupByLibrary.simpleMessage("Favorite"),
    "sessionPageTitle" : MessageLookupByLibrary.simpleMessage("Session"),
    "sessionPingCountsSubtitle" : MessageLookupByLibrary.simpleMessage("Progress"),
    "sessionPingValuesSubtitle" : MessageLookupByLibrary.simpleMessage("Statistics"),
    "sessionResultsSubtitle" : MessageLookupByLibrary.simpleMessage("Results"),
    "sessionSearchButtonLabel" : MessageLookupByLibrary.simpleMessage("Search"),
    "sessionStartPromptDesc" : MessageLookupByLibrary.simpleMessage("Long press button to send as many requests as needed"),
    "sessionStartPromptTitle" : MessageLookupByLibrary.simpleMessage("Tap button to start new session"),
    "sessionSummarySubtitle" : MessageLookupByLibrary.simpleMessage("Summary"),
    "settingSheetTitle" : MessageLookupByLibrary.simpleMessage("Provide new value"),
    "settingsAttachLocationDesc" : MessageLookupByLibrary.simpleMessage("Current location will be attached to session statistics in order to compare them on global results map"),
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
    "settingsRestoreHostDesc" : MessageLookupByLibrary.simpleMessage("New session will be automatically created for latest pinged host"),
    "settingsRestoreHostTitle" : MessageLookupByLibrary.simpleMessage("Remember host"),
    "settingsResultsSectionTitle" : MessageLookupByLibrary.simpleMessage("Results"),
    "settingsShareResultsDesc" : MessageLookupByLibrary.simpleMessage("Session statistics will be shared in order to allow other app users to compare them with their results"),
    "settingsShareResultsLabel" : MessageLookupByLibrary.simpleMessage("Share results"),
    "settingsSystemNotificationDesc" : MessageLookupByLibrary.simpleMessage("Current status of running ping sessions will appear in system tray"),
    "settingsSystemNotificationTitle" : MessageLookupByLibrary.simpleMessage("System notification"),
    "shareLocationButtonLabel" : MessageLookupByLibrary.simpleMessage("Share location"),
    "showIntroButtonLabel" : MessageLookupByLibrary.simpleMessage("Show intro"),
    "skipButtonLabel" : MessageLookupByLibrary.simpleMessage("SKIP"),
    "startNowButtonLabel" : MessageLookupByLibrary.simpleMessage("Start now"),
    "tryAgainButtonLabel" : MessageLookupByLibrary.simpleMessage("Try again"),
    "viewTypeChartLabel" : MessageLookupByLibrary.simpleMessage("Chart"),
    "viewTypeGaugleLabel" : MessageLookupByLibrary.simpleMessage("Meter"),
    "viewTypeListLabel" : MessageLookupByLibrary.simpleMessage("List"),
    "viewTypeMax" : MessageLookupByLibrary.simpleMessage("Max"),
    "viewTypeMean" : MessageLookupByLibrary.simpleMessage("Mean"),
    "viewTypeMin" : MessageLookupByLibrary.simpleMessage("Min"),
    "weeksSinceNow" : m17
  };
}
