// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
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
  String get localeName => 'pl';

  static m0(days) => "${days} d";

  static m1(hours) => "${hours} g";

  static m2(minutes) => "${minutes} m";

  static m3(count) => "+ ${count} więcej";

  static m4(min, mean, max) => "Min: ${min} ms / Śred: ${mean} ms / Maks: ${max} ms";

  static m5(host) => "${host} [zakończone]";

  static m6(current, total) => "Postęp: ${current}/${total}";

  static m7(host) => "${host} [zatrzymane]";

  static m8(value) => "Ostatni wynik: ${value} ms";

  static m9(host) => "${host} [w trakcie]";

  static m10(value) => "${value} x";

  static m11(value) => "Twój wynik jest lepszy, niż ${value}% innych";

  static m12(value) => "Wynik pingowania innych to ${value} ms";

  static m13(value) => "${value} ms";

  static m14(currentHost, newHost) => "Zatrzymać obecną sesję ${currentHost} i uruchomić nową ${newHost}?";

  static m15(count) => "${Intl.plural(count, zero: '0 wyników', one: '1 wynik', two: '2 wyniki', few: '${count} wyniki', many: '${count} wyników', other: '${count} wyników')}";

  static m16(seconds) => "${seconds} s";

  static m17(weeks) => "${weeks} t";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appVersion" : MessageLookupByLibrary.simpleMessage("Wersja"),
    "archiveEmptyDesc" : MessageLookupByLibrary.simpleMessage("Zapisz wyniki pingowania hosta, aby zobaczyć je później w tym miejscu"),
    "archivePageTitle" : MessageLookupByLibrary.simpleMessage("Archiwum"),
    "cancelButtonLabel" : MessageLookupByLibrary.simpleMessage("ANULUJ"),
    "confirmHostRemoveTitle" : MessageLookupByLibrary.simpleMessage("Usunąć zaznaczone elementy?"),
    "confirmRemoveDesc" : MessageLookupByLibrary.simpleMessage("Tej akcji nie można cofnąć"),
    "confirmResultRemoveTitle" : MessageLookupByLibrary.simpleMessage("Usunąć wyniki?"),
    "dataFetchFailedDesc" : MessageLookupByLibrary.simpleMessage("Coś poszło nie tak podczas pobierania danych - spróbuj ponownie za jakiś czas"),
    "dataFetchFailedTitle" : MessageLookupByLibrary.simpleMessage("Nie udało się pobrać danych"),
    "daysSinceNow" : m0,
    "enableLocationPromptDesc" : MessageLookupByLibrary.simpleMessage("Obecna pozycja zostanie dołączona do statystyk sesji, aby porównać je z innymi na mapie świata"),
    "enableLocationPromptTitle" : MessageLookupByLibrary.simpleMessage("Udostępnij pozycję, aby porównać swoje wyniki z innymi"),
    "favoritesPageTitle" : MessageLookupByLibrary.simpleMessage("Ulubione"),
    "getStartedButtonLabel" : MessageLookupByLibrary.simpleMessage("Rozpocznij"),
    "homeCurrentSubtitle" : MessageLookupByLibrary.simpleMessage("Sesja"),
    "homeFavoritesEmptyPlaceholder" : MessageLookupByLibrary.simpleMessage("Zapisz pingowanego hosta, aby mieć do niego szybki dostęp"),
    "homeFavoritesSubtitle" : MessageLookupByLibrary.simpleMessage("Ulubione"),
    "homeIntroDesc" : MessageLookupByLibrary.simpleMessage("Lub pomiń je i zacznij korzystać z aplikacji od razu"),
    "homeIntroTitle" : MessageLookupByLibrary.simpleMessage("Zobacz krótkie wprowadzenie dostępnych funkcjonalności"),
    "homePageTitle" : MessageLookupByLibrary.simpleMessage("Pinger"),
    "homePopularSubtitle" : MessageLookupByLibrary.simpleMessage("Najczęstsze"),
    "homeRecentsEmptyPlaceholder" : MessageLookupByLibrary.simpleMessage("Ostatnie pingowane hosty pojawią się w tym miejscu"),
    "homeRecentsSubtitle" : MessageLookupByLibrary.simpleMessage("Ostatnie"),
    "hoursSinceNow" : m1,
    "infoTrayNetworkDisabled" : MessageLookupByLibrary.simpleMessage("Łączność urządzenia nie jest włączona. Upewnij się, że posiadasz dostęp do sieci, aby móc pingować hosty"),
    "introAdjustSettingsDesc" : MessageLookupByLibrary.simpleMessage("Zmień ustawienia pingowania i preferencje, aby dostosować zachowanie aplikacji"),
    "introAdjustSettingsTitle" : MessageLookupByLibrary.simpleMessage("Dostosuj ustawienia"),
    "introPingHostDesc" : MessageLookupByLibrary.simpleMessage("Wykonaj szybkie pingowanie przytrzymując przycisk lub naciśnij go, aby rozpocząć nową sesję"),
    "introPingHostTitle" : MessageLookupByLibrary.simpleMessage("Pinguj hosta"),
    "introSaveResultsDesc" : MessageLookupByLibrary.simpleMessage("Zapisz wyniki pingowania, aby wrócić do nich później i porównać z innymi użytkownikami"),
    "introSaveResultsTitle" : MessageLookupByLibrary.simpleMessage("Zapisz wyniki"),
    "introSelectHostDesc" : MessageLookupByLibrary.simpleMessage("Wybierz hosta spośród proponowanych, znajdź go wśród hostów pingowanych przez innych lub wybierz własny"),
    "introSelectHostTitle" : MessageLookupByLibrary.simpleMessage("Wybierz hosta"),
    "locationAccessDisabledDesc" : MessageLookupByLibrary.simpleMessage("Zmień ustawienia uprawnień, aby zezwolić na dostęp do lokalizacji urządzenia"),
    "locationAccessDisabledTitle" : MessageLookupByLibrary.simpleMessage("Lokalizacja wyłączona"),
    "minutesSinceNow" : m2,
    "moreHostsButtonLabel" : MessageLookupByLibrary.simpleMessage("Więcej"),
    "moreHostsCountButtonLabel" : m3,
    "nothingToShowTitle" : MessageLookupByLibrary.simpleMessage("Nic jeszcze tutaj nie ma"),
    "notificationAccessDisabledDesc" : MessageLookupByLibrary.simpleMessage("Zmień ustawienia uprawnień, aby zezwolić na wyświetlanie powiadomień"),
    "notificationAccessDisabledTitle" : MessageLookupByLibrary.simpleMessage("Powiadomienia wyłączone"),
    "notificationDoneBody" : m4,
    "notificationDoneTitle" : m5,
    "notificationPausedBody" : m6,
    "notificationPausedTitle" : m7,
    "notificationStartedBody" : m8,
    "notificationStartedTitle" : m9,
    "pingCountLabel" : m10,
    "pingFailedCountLabel" : MessageLookupByLibrary.simpleMessage("Nieudane"),
    "pingGlobalByFrequencyDesc" : m11,
    "pingGlobalByFrequencySubtitle" : MessageLookupByLibrary.simpleMessage("Wyniki dla częstotliwości"),
    "pingGlobalByLocationDesc" : m12,
    "pingGlobalByLocationSubtitle" : MessageLookupByLibrary.simpleMessage("Wyniki dla lokalizacji"),
    "pingGlobalYourResult" : MessageLookupByLibrary.simpleMessage("Twój wynik"),
    "pingInfoDateLabel" : MessageLookupByLibrary.simpleMessage("Data"),
    "pingInfoDurationLabel" : MessageLookupByLibrary.simpleMessage("Czas trwania"),
    "pingInfoInfoSubtitle" : MessageLookupByLibrary.simpleMessage("Informacje"),
    "pingInfoSettingsSubtitle" : MessageLookupByLibrary.simpleMessage("Ustawienia"),
    "pingMaxValueLabel" : MessageLookupByLibrary.simpleMessage("Maks"),
    "pingMeanCountLabel" : MessageLookupByLibrary.simpleMessage("Śred"),
    "pingMinCountLabel" : MessageLookupByLibrary.simpleMessage("Min"),
    "pingSettingsSheetSubtitle" : MessageLookupByLibrary.simpleMessage("Zmiany zostaną zastosowane tylko w obecnej sesji"),
    "pingSettingsSheetTitle" : MessageLookupByLibrary.simpleMessage("Ustawienia pingowania"),
    "pingSuccessCountLabel" : MessageLookupByLibrary.simpleMessage("Udane"),
    "pingSummaryCountLabel" : MessageLookupByLibrary.simpleMessage("Zapytania"),
    "pingSummaryDateLabel" : MessageLookupByLibrary.simpleMessage("Data"),
    "pingSummaryDurationLabel" : MessageLookupByLibrary.simpleMessage("Czas trwania"),
    "pingTotalCountLabel" : MessageLookupByLibrary.simpleMessage("Razem"),
    "pingValueLabel" : m13,
    "recentsPageTitle" : MessageLookupByLibrary.simpleMessage("Ostatnie"),
    "removeHostsPageTitle" : MessageLookupByLibrary.simpleMessage("Usun"),
    "replaceSessionSheetSubtitle" : m14,
    "replaceSessionSheetTitle" : MessageLookupByLibrary.simpleMessage("Inna sesja jest uruchomiona"),
    "resetButtonLabel" : MessageLookupByLibrary.simpleMessage("PRZYWRÓĆ"),
    "resultGlobalEmptyDesc" : MessageLookupByLibrary.simpleMessage("Sprawdź ponowanie za jakiś czas, kiedy pojawią się dane dla tego hosta"),
    "resultOtherEmptyDesc" : MessageLookupByLibrary.simpleMessage("Inne wyniki pojawią się w tym miejscu, kiedy zostaną zapisane dla tego hosta"),
    "resultPageTitle" : MessageLookupByLibrary.simpleMessage("Wyniki"),
    "resultResultsSubtitle" : MessageLookupByLibrary.simpleMessage("Wyniki"),
    "resultsGlobalTabLabel" : MessageLookupByLibrary.simpleMessage("Porównaj"),
    "resultsGroupCount" : m15,
    "resultsInfoTabLabel" : MessageLookupByLibrary.simpleMessage("Więcej"),
    "resultsMoreTabLabel" : MessageLookupByLibrary.simpleMessage("Inne"),
    "resultsResultsTabLabel" : MessageLookupByLibrary.simpleMessage("Wyniki"),
    "searchHostHint" : MessageLookupByLibrary.simpleMessage("Wyszukaj hosta..."),
    "searchResultsEmptyDesc" : MessageLookupByLibrary.simpleMessage("Brak wyników pasujących do podanego hosta - możesz nadal wybrać go i spróbować pingować"),
    "searchResultsEmptyTitle" : MessageLookupByLibrary.simpleMessage("Nic nie znaleziono"),
    "secondsSinceNow" : m16,
    "sessionAdjustButtonLabel" : MessageLookupByLibrary.simpleMessage("Dostosuj"),
    "sessionFavoriteButtonLabel" : MessageLookupByLibrary.simpleMessage("Ulubione"),
    "sessionPageTitle" : MessageLookupByLibrary.simpleMessage("Sesja"),
    "sessionPingCountsSubtitle" : MessageLookupByLibrary.simpleMessage("Postęp"),
    "sessionPingValuesSubtitle" : MessageLookupByLibrary.simpleMessage("Statystyki"),
    "sessionResultsSubtitle" : MessageLookupByLibrary.simpleMessage("Wyniki"),
    "sessionSearchButtonLabel" : MessageLookupByLibrary.simpleMessage("Wyszukaj"),
    "sessionStartPromptDesc" : MessageLookupByLibrary.simpleMessage("Przytrzymaj przycisk, aby wysłać tyle zapytań ile potrzebujesz"),
    "sessionStartPromptTitle" : MessageLookupByLibrary.simpleMessage("Naciśnij przycisk, aby rozpocząć sesję"),
    "sessionSummarySubtitle" : MessageLookupByLibrary.simpleMessage("Podsumowanie"),
    "settingSheetTitle" : MessageLookupByLibrary.simpleMessage("Podaj nową wartość"),
    "settingsAttachLocationDesc" : MessageLookupByLibrary.simpleMessage("Obecna pozycja zostanie dołączona do statystyk sesji, aby porównać je z innymi na mapie świata"),
    "settingsAttachLocationTitle" : MessageLookupByLibrary.simpleMessage("Udostępnij pozycję"),
    "settingsInfoTraySectionTitle" : MessageLookupByLibrary.simpleMessage("Panel powiadomień"),
    "settingsNightModeTitle" : MessageLookupByLibrary.simpleMessage("Tryb nocny"),
    "settingsOtherSectionTitle" : MessageLookupByLibrary.simpleMessage("Inne"),
    "settingsPageTitle" : MessageLookupByLibrary.simpleMessage("Ustawienia"),
    "settingsPingCountLabel" : MessageLookupByLibrary.simpleMessage("Ilość"),
    "settingsPingCountUnit" : MessageLookupByLibrary.simpleMessage("x"),
    "settingsPingIntervalLabel" : MessageLookupByLibrary.simpleMessage("Interwał"),
    "settingsPingIntervalUnit" : MessageLookupByLibrary.simpleMessage("s"),
    "settingsPingPacketSizeLabel" : MessageLookupByLibrary.simpleMessage("Rozmiar pakietu"),
    "settingsPingPacketSizeUnit" : MessageLookupByLibrary.simpleMessage("B"),
    "settingsPingSectionTitle" : MessageLookupByLibrary.simpleMessage("Pingowanie"),
    "settingsPingTimeoutLabel" : MessageLookupByLibrary.simpleMessage("Maks. czas zapytania"),
    "settingsPingTimeoutUnit" : MessageLookupByLibrary.simpleMessage("s"),
    "settingsRestoreHostDesc" : MessageLookupByLibrary.simpleMessage("Nowa sesja zostanie automatycznie utworzona dla ostatniego hosta"),
    "settingsRestoreHostTitle" : MessageLookupByLibrary.simpleMessage("Zapamiętaj hosta"),
    "settingsResultsSectionTitle" : MessageLookupByLibrary.simpleMessage("Wyniki"),
    "settingsShareResultsDesc" : MessageLookupByLibrary.simpleMessage("Statystyki sesji zostaną udostępnione, aby umożliwić innym użytkownikom porównanie ich ze swoimi wynikami"),
    "settingsShareResultsLabel" : MessageLookupByLibrary.simpleMessage("Udostępnij wyniki"),
    "settingsSystemNotificationDesc" : MessageLookupByLibrary.simpleMessage("Aktualny status uruchomionej sesji pojawi się w powiadomieniach systemowych"),
    "settingsSystemNotificationTitle" : MessageLookupByLibrary.simpleMessage("Powiadomienie systemowe"),
    "settingsTrayAutoRevealDesc" : MessageLookupByLibrary.simpleMessage("Panel pokaże się automatycznie, jeżeli pojawi się w nim nowy element"),
    "settingsTrayAutoRevealTitle" : MessageLookupByLibrary.simpleMessage("Wysuń automatycznie"),
    "settingsTrayEnabledDesc" : MessageLookupByLibrary.simpleMessage("Informacje o stanie aplikacji będą pojawiać się w wysuwanym panelu u dołu ekranu"),
    "settingsTrayEnabledTitle" : MessageLookupByLibrary.simpleMessage("Wyświetl panel"),
    "shareLocationButtonLabel" : MessageLookupByLibrary.simpleMessage("Udostępnij pozycję"),
    "showIntroButtonLabel" : MessageLookupByLibrary.simpleMessage("Wprowadzenie"),
    "skipButtonLabel" : MessageLookupByLibrary.simpleMessage("POMIŃ"),
    "startNowButtonLabel" : MessageLookupByLibrary.simpleMessage("Rozpocznij"),
    "tryAgainButtonLabel" : MessageLookupByLibrary.simpleMessage("Spróbuj ponownie"),
    "viewTypeChartLabel" : MessageLookupByLibrary.simpleMessage("Wykres"),
    "viewTypeGaugleLabel" : MessageLookupByLibrary.simpleMessage("Licznik"),
    "viewTypeListLabel" : MessageLookupByLibrary.simpleMessage("Lista"),
    "viewTypeMax" : MessageLookupByLibrary.simpleMessage("Maks"),
    "viewTypeMean" : MessageLookupByLibrary.simpleMessage("Śred"),
    "viewTypeMin" : MessageLookupByLibrary.simpleMessage("Min"),
    "weeksSinceNow" : m17
  };
}
