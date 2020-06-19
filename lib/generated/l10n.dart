// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Archive`
  String get archivePageTitle {
    return Intl.message(
      'Archive',
      name: 'archivePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `There't nothing here yet`
  String get nothingToShowTitle {
    return Intl.message(
      'There\'t nothing here yet',
      name: 'nothingToShowTitle',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favoritesPageTitle {
    return Intl.message(
      'Favorites',
      name: 'favoritesPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pinger`
  String get homePageTitle {
    return Intl.message(
      'Pinger',
      name: 'homePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search host to ping`
  String get searchHostHint {
    return Intl.message(
      'Search host to ping',
      name: 'searchHostHint',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to remove selected hosts?`
  String get confirmHostRemoveTitle {
    return Intl.message(
      'Do you want to remove selected hosts?',
      name: 'confirmHostRemoveTitle',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get removeHostsTitle {
    return Intl.message(
      'Remove',
      name: 'removeHostsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Start now`
  String get startNowButtonLabel {
    return Intl.message(
      'Start now',
      name: 'startNowButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Show intro`
  String get showIntroButtonLabel {
    return Intl.message(
      'Show intro',
      name: 'showIntroButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `SKIP`
  String get skipButtonLabel {
    return Intl.message(
      'SKIP',
      name: 'skipButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL`
  String get cancelButtonLabel {
    return Intl.message(
      'CANCEL',
      name: 'cancelButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsPageTitle {
    return Intl.message(
      'Settings',
      name: 'settingsPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save results after pinging a host or let the app make it each time automatically in settings`
  String get archiveEmptyDesc {
    return Intl.message(
      'Save results after pinging a host or let the app make it each time automatically in settings',
      name: 'archiveEmptyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Use search field above to choose host to ping or see intro explaining app concept`
  String get homeIntroDesc {
    return Intl.message(
      'Use search field above to choose host to ping or see intro explaining app concept',
      name: 'homeIntroDesc',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get searchResultsEmptyTitle {
    return Intl.message(
      'No results found',
      name: 'searchResultsEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `We could not find anything for given query but you can still use it as host`
  String get searchResultsEmptyDesc {
    return Intl.message(
      'We could not find anything for given query but you can still use it as host',
      name: 'searchResultsEmptyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgainButtonLabel {
    return Intl.message(
      'Try again',
      name: 'tryAgainButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this result?`
  String get confirmResultRemoveTitle {
    return Intl.message(
      'Do you want to delete this result?',
      name: 'confirmResultRemoveTitle',
      desc: '',
      args: [],
    );
  }

  /// `This actions is irreversible`
  String get confirmRemoveDesc {
    return Intl.message(
      'This actions is irreversible',
      name: 'confirmRemoveDesc',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get resultsMoreTabLabel {
    return Intl.message(
      'More',
      name: 'resultsMoreTabLabel',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get resultsInfoTabLabel {
    return Intl.message(
      'Info',
      name: 'resultsInfoTabLabel',
      desc: '',
      args: [],
    );
  }

  /// `Global`
  String get resultsGlobalTabLabel {
    return Intl.message(
      'Global',
      name: 'resultsGlobalTabLabel',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get resultsResultsTabLabel {
    return Intl.message(
      'Results',
      name: 'resultsResultsTabLabel',
      desc: '',
      args: [],
    );
  }

  /// `Recents`
  String get recentsPageTitle {
    return Intl.message(
      'Recents',
      name: 'recentsPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `RESET`
  String get resetButtonLabel {
    return Intl.message(
      'RESET',
      name: 'resetButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get sessionEditButtonLabel {
    return Intl.message(
      'Edit',
      name: 'sessionEditButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get sessionFavoriteButtonLabel {
    return Intl.message(
      'Favorite',
      name: 'sessionFavoriteButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Adjust`
  String get sessionAdjustButtonLabel {
    return Intl.message(
      'Adjust',
      name: 'sessionAdjustButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Ping settings`
  String get pingSettingsSheetTitle {
    return Intl.message(
      'Ping settings',
      name: 'pingSettingsSheetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Changes will be applied only for current sesion`
  String get pingSettingsSheetSubtitle {
    return Intl.message(
      'Changes will be applied only for current sesion',
      name: 'pingSettingsSheetSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Tap button to start pinging`
  String get sessionStartPromptTitle {
    return Intl.message(
      'Tap button to start pinging',
      name: 'sessionStartPromptTitle',
      desc: '',
      args: [],
    );
  }

  /// `Long press the button to quickly ping the host just a several times`
  String get sessionStartPromptDesc {
    return Intl.message(
      'Long press the button to quickly ping the host just a several times',
      name: 'sessionStartPromptDesc',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get getStartedButtonLabel {
    return Intl.message(
      'Get started',
      name: 'getStartedButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Select host`
  String get introSelectHostTitle {
    return Intl.message(
      'Select host',
      name: 'introSelectHostTitle',
      desc: '',
      args: [],
    );
  }

  /// `Either pick one of the search results or enter your own host and confirm your choice`
  String get introSelectHostDesc {
    return Intl.message(
      'Either pick one of the search results or enter your own host and confirm your choice',
      name: 'introSelectHostDesc',
      desc: '',
      args: [],
    );
  }

  /// `Adjust settings`
  String get introAdjustSettingsTitle {
    return Intl.message(
      'Adjust settings',
      name: 'introAdjustSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change host monitoring preferences and behavior of entire application`
  String get introAdjustSettingsDesc {
    return Intl.message(
      'Change host monitoring preferences and behavior of entire application',
      name: 'introAdjustSettingsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Ping host`
  String get introPingHostTitle {
    return Intl.message(
      'Ping host',
      name: 'introPingHostTitle',
      desc: '',
      args: [],
    );
  }

  /// `Either perform a quick ping by long pressing play button or tap it to start ping session`
  String get introPingHostDesc {
    return Intl.message(
      'Either perform a quick ping by long pressing play button or tap it to start ping session',
      name: 'introPingHostDesc',
      desc: '',
      args: [],
    );
  }

  /// `Save results`
  String get introSaveResultsTitle {
    return Intl.message(
      'Save results',
      name: 'introSaveResultsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Archive ping results to review them later and compare them with rest of the world`
  String get introSaveResultsDesc {
    return Intl.message(
      'Archive ping results to review them later and compare them with rest of the world',
      name: 'introSaveResultsDesc',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get moreHostsButtonLabel {
    return Intl.message(
      'More',
      name: 'moreHostsButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `+ {count} more`
  String moreHostsCountButtonLabel(Object count) {
    return Intl.message(
      '+ $count more',
      name: 'moreHostsCountButtonLabel',
      desc: '',
      args: [count],
    );
  }

  /// `Favorites`
  String get homeFavoritesSubtitle {
    return Intl.message(
      'Favorites',
      name: 'homeFavoritesSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Bookmark pinged hosts to access them easily`
  String get homeFavoritesEmptyPlaceholder {
    return Intl.message(
      'Bookmark pinged hosts to access them easily',
      name: 'homeFavoritesEmptyPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Recents`
  String get homeRecentsSubtitle {
    return Intl.message(
      'Recents',
      name: 'homeRecentsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Latest host will show up here after you ping one`
  String get homeRecentsEmptyPlaceholder {
    return Intl.message(
      'Latest host will show up here after you ping one',
      name: 'homeRecentsEmptyPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get homePopularSubtitle {
    return Intl.message(
      'Popular',
      name: 'homePopularSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Current`
  String get homeCurrentSubtitle {
    return Intl.message(
      'Current',
      name: 'homeCurrentSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{count} results`
  String resultsGroupCount(Object count) {
    return Intl.message(
      '$count results',
      name: 'resultsGroupCount',
      desc: '',
      args: [count],
    );
  }

  /// `{weeks} w`
  String weeksSinceNow(Object weeks) {
    return Intl.message(
      '$weeks w',
      name: 'weeksSinceNow',
      desc: '',
      args: [weeks],
    );
  }

  /// `{days} d`
  String daysSinceNow(Object days) {
    return Intl.message(
      '$days d',
      name: 'daysSinceNow',
      desc: '',
      args: [days],
    );
  }

  /// `{hours} h`
  String hoursSinceNow(Object hours) {
    return Intl.message(
      '$hours h',
      name: 'hoursSinceNow',
      desc: '',
      args: [hours],
    );
  }

  /// `{minutes} m`
  String minutesSinceNow(Object minutes) {
    return Intl.message(
      '$minutes m',
      name: 'minutesSinceNow',
      desc: '',
      args: [minutes],
    );
  }

  /// `{seconds} s`
  String secondsSinceNow(Object seconds) {
    return Intl.message(
      '$seconds s',
      name: 'secondsSinceNow',
      desc: '',
      args: [seconds],
    );
  }

  /// `Another session running`
  String get replaceSessionSheetTitle {
    return Intl.message(
      'Another session running',
      name: 'replaceSessionSheetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to stop current session for {currentHost} and start new one for {newHost}?`
  String replaceSessionSheetSubtitle(Object currentHost, Object newHost) {
    return Intl.message(
      'Do you want to stop current session for $currentHost and start new one for $newHost?',
      name: 'replaceSessionSheetSubtitle',
      desc: '',
      args: [currentHost, newHost],
    );
  }

  /// `Provide new value`
  String get settingSheetTitle {
    return Intl.message(
      'Provide new value',
      name: 'settingSheetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ping`
  String get settingsPingSectionTitle {
    return Intl.message(
      'Ping',
      name: 'settingsPingSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get settingsOtherSectionTitle {
    return Intl.message(
      'Other',
      name: 'settingsOtherSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get settingsResultsSectionTitle {
    return Intl.message(
      'Results',
      name: 'settingsResultsSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get appVersion {
    return Intl.message(
      'Version',
      name: 'appVersion',
      desc: '',
      args: [],
    );
  }

  /// `Share results`
  String get settingsShareResultsLabel {
    return Intl.message(
      'Share results',
      name: 'settingsShareResultsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Results statistics will be sent to allow other application users to compare their results`
  String get settingsShareResultsDesc {
    return Intl.message(
      'Results statistics will be sent to allow other application users to compare their results',
      name: 'settingsShareResultsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Attach location`
  String get settingsAttachLocationTitle {
    return Intl.message(
      'Attach location',
      name: 'settingsAttachLocationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Current location will be attached to statistics data to allow present it on global results map`
  String get settingsAttachLocationDesc {
    return Intl.message(
      'Current location will be attached to statistics data to allow present it on global results map',
      name: 'settingsAttachLocationDesc',
      desc: '',
      args: [],
    );
  }

  /// `Night mode`
  String get settingsNightModeTitle {
    return Intl.message(
      'Night mode',
      name: 'settingsNightModeTitle',
      desc: '',
      args: [],
    );
  }

  /// `System notification`
  String get settingsSystemNotificationTitle {
    return Intl.message(
      'System notification',
      name: 'settingsSystemNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Application will show current status of running session in system tray`
  String get settingsSystemNotificationDesc {
    return Intl.message(
      'Application will show current status of running session in system tray',
      name: 'settingsSystemNotificationDesc',
      desc: '',
      args: [],
    );
  }

  /// `Restore host`
  String get settingsRestoreHostTitle {
    return Intl.message(
      'Restore host',
      name: 'settingsRestoreHostTitle',
      desc: '',
      args: [],
    );
  }

  /// `Application will automatically proceed to new session with latest host`
  String get settingsRestoreHostDesc {
    return Intl.message(
      'Application will automatically proceed to new session with latest host',
      name: 'settingsRestoreHostDesc',
      desc: '',
      args: [],
    );
  }

  /// `Timeout`
  String get settingsPingTimeoutLabel {
    return Intl.message(
      'Timeout',
      name: 'settingsPingTimeoutLabel',
      desc: '',
      args: [],
    );
  }

  /// `s`
  String get settingsPingTimeoutUnit {
    return Intl.message(
      's',
      name: 'settingsPingTimeoutUnit',
      desc: '',
      args: [],
    );
  }

  /// `Interval`
  String get settingsPingIntervalLabel {
    return Intl.message(
      'Interval',
      name: 'settingsPingIntervalLabel',
      desc: '',
      args: [],
    );
  }

  /// `s`
  String get settingsPingIntervalUnit {
    return Intl.message(
      's',
      name: 'settingsPingIntervalUnit',
      desc: '',
      args: [],
    );
  }

  /// `Count`
  String get settingsPingCountLabel {
    return Intl.message(
      'Count',
      name: 'settingsPingCountLabel',
      desc: '',
      args: [],
    );
  }

  /// `x`
  String get settingsPingCountUnit {
    return Intl.message(
      'x',
      name: 'settingsPingCountUnit',
      desc: '',
      args: [],
    );
  }

  /// `Packet size`
  String get settingsPingPacketSizeLabel {
    return Intl.message(
      'Packet size',
      name: 'settingsPingPacketSizeLabel',
      desc: '',
      args: [],
    );
  }

  /// `B`
  String get settingsPingPacketSizeUnit {
    return Intl.message(
      'B',
      name: 'settingsPingPacketSizeUnit',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get sessionResultsSubtitle {
    return Intl.message(
      'Results',
      name: 'sessionResultsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Gauge`
  String get viewTypeGaugleLabel {
    return Intl.message(
      'Gauge',
      name: 'viewTypeGaugleLabel',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get viewTypeListLabel {
    return Intl.message(
      'List',
      name: 'viewTypeListLabel',
      desc: '',
      args: [],
    );
  }

  /// `Chart`
  String get viewTypeChartLabel {
    return Intl.message(
      'Chart',
      name: 'viewTypeChartLabel',
      desc: '',
      args: [],
    );
  }

  /// `Max`
  String get viewTypeMax {
    return Intl.message(
      'Max',
      name: 'viewTypeMax',
      desc: '',
      args: [],
    );
  }

  /// `Mean`
  String get viewTypeMean {
    return Intl.message(
      'Mean',
      name: 'viewTypeMean',
      desc: '',
      args: [],
    );
  }

  /// `Min`
  String get viewTypeMin {
    return Intl.message(
      'Min',
      name: 'viewTypeMin',
      desc: '',
      args: [],
    );
  }

  /// `{value} ms`
  String pingValueLabel(Object value) {
    return Intl.message(
      '$value ms',
      name: 'pingValueLabel',
      desc: '',
      args: [value],
    );
  }

  /// `{value} x`
  String pingCountLabel(Object value) {
    return Intl.message(
      '$value x',
      name: 'pingCountLabel',
      desc: '',
      args: [value],
    );
  }

  /// `Summary`
  String get sessionSummarySubtitle {
    return Intl.message(
      'Summary',
      name: 'sessionSummarySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get sessionPingCountsSubtitle {
    return Intl.message(
      'Progress',
      name: 'sessionPingCountsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Ping`
  String get sessionPingValuesSubtitle {
    return Intl.message(
      'Ping',
      name: 'sessionPingValuesSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get pingSuccessCountLabel {
    return Intl.message(
      'Success',
      name: 'pingSuccessCountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get pingFailedCountLabel {
    return Intl.message(
      'Failed',
      name: 'pingFailedCountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get pingTotalCountLabel {
    return Intl.message(
      'Total',
      name: 'pingTotalCountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Min`
  String get pingMinCountLabel {
    return Intl.message(
      'Min',
      name: 'pingMinCountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Mean`
  String get pingMeanCountLabel {
    return Intl.message(
      'Mean',
      name: 'pingMeanCountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Max`
  String get pingMaxValueLabel {
    return Intl.message(
      'Max',
      name: 'pingMaxValueLabel',
      desc: '',
      args: [],
    );
  }

  /// `Session`
  String get sessionPageTitle {
    return Intl.message(
      'Session',
      name: 'sessionPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get resultResultsSubtitle {
    return Intl.message(
      'Results',
      name: 'resultResultsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Other results will show up here once you finish at least one ping for this host`
  String get resultOtherEmptyDesc {
    return Intl.message(
      'Other results will show up here once you finish at least one ping for this host',
      name: 'resultOtherEmptyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get resultPageTitle {
    return Intl.message(
      'Result',
      name: 'resultPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ping count`
  String get pingSummaryCountLabel {
    return Intl.message(
      'Ping count',
      name: 'pingSummaryCountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get pingSummaryDurationLabel {
    return Intl.message(
      'Duration',
      name: 'pingSummaryDurationLabel',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get pingSummaryDateLabel {
    return Intl.message(
      'Date',
      name: 'pingSummaryDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Check again after some time when there's data available for this host`
  String get resultGlobalEmptyDesc {
    return Intl.message(
      'Check again after some time when there\'s data available for this host',
      name: 'resultGlobalEmptyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Share location`
  String get shareLocationButtonLabel {
    return Intl.message(
      'Share location',
      name: 'shareLocationButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Could not fetch data`
  String get dataFetchFailedTitle {
    return Intl.message(
      'Could not fetch data',
      name: 'dataFetchFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong when getting the data - try again after some time`
  String get dataFetchFailedDesc {
    return Intl.message(
      'Something went wrong when getting the data - try again after some time',
      name: 'dataFetchFailedDesc',
      desc: '',
      args: [],
    );
  }

  /// `Enable location to see your result compared with others`
  String get enableLocationPromptTitle {
    return Intl.message(
      'Enable location to see your result compared with others',
      name: 'enableLocationPromptTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your location will be used to match it with your result and to present it for other users.`
  String get enableLocationPromptDesc {
    return Intl.message(
      'Your location will be used to match it with your result and to present it for other users.',
      name: 'enableLocationPromptDesc',
      desc: '',
      args: [],
    );
  }

  /// `Your result`
  String get pingGlobalYourResult {
    return Intl.message(
      'Your result',
      name: 'pingGlobalYourResult',
      desc: '',
      args: [],
    );
  }

  /// `Results by location`
  String get pingGlobalByLocationSubtitle {
    return Intl.message(
      'Results by location',
      name: 'pingGlobalByLocationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Results by frequency`
  String get pingGlobalByFrequencySubtitle {
    return Intl.message(
      'Results by frequency',
      name: 'pingGlobalByFrequencySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Ping value for others was {value} ms`
  String pingGlobalByLocationDesc(Object value) {
    return Intl.message(
      'Ping value for others was $value ms',
      name: 'pingGlobalByLocationDesc',
      desc: '',
      args: [value],
    );
  }

  /// `Your ping was better than {value}% of others`
  String pingGlobalByFrequencyDesc(Object value) {
    return Intl.message(
      'Your ping was better than $value% of others',
      name: 'pingGlobalByFrequencyDesc',
      desc: '',
      args: [value],
    );
  }

  /// `Info`
  String get pingInfoInfoSubtitle {
    return Intl.message(
      'Info',
      name: 'pingInfoInfoSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get pingInfoDateLabel {
    return Intl.message(
      'Date',
      name: 'pingInfoDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get pingInfoDurationLabel {
    return Intl.message(
      'Duration',
      name: 'pingInfoDurationLabel',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get pingInfoSettingsSubtitle {
    return Intl.message(
      'Settings',
      name: 'pingInfoSettingsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Ping started`
  String get notificationStartedTitle {
    return Intl.message(
      'Ping started',
      name: 'notificationStartedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Last result: {value} ms`
  String notificationStartedBody(Object value) {
    return Intl.message(
      'Last result: $value ms',
      name: 'notificationStartedBody',
      desc: '',
      args: [value],
    );
  }

  /// `Ping paused`
  String get notificationPausedTitle {
    return Intl.message(
      'Ping paused',
      name: 'notificationPausedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Progress: {current}/{total}`
  String notificationPausedBody(Object current, Object total) {
    return Intl.message(
      'Progress: $current/$total',
      name: 'notificationPausedBody',
      desc: '',
      args: [current, total],
    );
  }

  /// `Ping done`
  String get notificationDoneTitle {
    return Intl.message(
      'Ping done',
      name: 'notificationDoneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Min: {min} ms / Mean: {mean} ms / Max: {max} ms`
  String notificationDoneBody(Object min, Object mean, Object max) {
    return Intl.message(
      'Min: $min ms / Mean: $mean ms / Max: $max ms',
      name: 'notificationDoneBody',
      desc: '',
      args: [min, mean, max],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}