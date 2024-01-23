// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr';

  static String m0(days) => "${days} j";

  static String m1(hours) => "${hours} h";

  static String m2(minutes) => "${minutes} m";

  static String m3(count) => "+ ${count} plus";

  static String m4(min, mean, max) =>
      "Min: ${min} ms / Moy: ${mean} ms / Max: ${max} ms";

  static String m5(host) => "${host} [finie]";

  static String m6(current, total) => "Progrès: ${current}/${total}";

  static String m7(host) => "${host} [mise en pause]";

  static String m8(value) => "Résultat dernier: ${value} ms";

  static String m9(host) => "${host} [en cours]";

  static String m10(value) => "${value} x";

  static String m11(value) =>
      "Votre résultat est mieux que ${value}% des autres";

  static String m12(value) =>
      "Valeur de pinger pour les autres est ${value} ms";

  static String m13(value) => "${value} ms";

  static String m14(currentHost, newHost) =>
      "Arrêter la session actuelle ${currentHost} et commencer une nouvelle ${newHost}?";

  static String m15(count) =>
      "${Intl.plural(count, zero: '0 résultats', one: '1 résultat', two: '2 résultats', few: '${count} résultats', many: '${count} résultats', other: '${count} résultats')}";

  static String m16(seconds) => "${seconds} s";

  static String m17(weeks) => "${weeks} s";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appVersion": MessageLookupByLibrary.simpleMessage("Version"),
        "archiveEmptyDesc": MessageLookupByLibrary.simpleMessage(
            "Sauvegardez les résultats après pinger un hôte pour les voir plus tard ici"),
        "archivePageTitle": MessageLookupByLibrary.simpleMessage("Archive"),
        "cancelButtonLabel": MessageLookupByLibrary.simpleMessage("ANNULER"),
        "confirmHostRemoveTitle": MessageLookupByLibrary.simpleMessage(
            "Supprimer les éléments sélectionnés?"),
        "confirmRemoveDesc": MessageLookupByLibrary.simpleMessage(
            "Cette action est irréversible"),
        "confirmResultRemoveTitle":
            MessageLookupByLibrary.simpleMessage("Supprimer ce résultat?"),
        "dataFetchFailedDesc": MessageLookupByLibrary.simpleMessage(
            "Quelque chose s\'est mal passé lors du chargement des données - retentez après quelque temps"),
        "dataFetchFailedTitle": MessageLookupByLibrary.simpleMessage(
            "A échoué de charger des données"),
        "daysSinceNow": m0,
        "enableLocationPromptDesc": MessageLookupByLibrary.simpleMessage(
            "La localisation actuelle sera attachée aux statistiques de session afin de les comparer sur une carte de résultats globale"),
        "enableLocationPromptTitle": MessageLookupByLibrary.simpleMessage(
            "Activer la localisation pour voir votre résultat par rapport aux autres"),
        "favoritesPageTitle": MessageLookupByLibrary.simpleMessage("Favoris"),
        "getStartedButtonLabel":
            MessageLookupByLibrary.simpleMessage("Démarrer"),
        "homeCurrentSubtitle": MessageLookupByLibrary.simpleMessage("Session"),
        "homeFavoritesEmptyPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Marquez les hôtes pingés afin de les accéder rapidement par ici"),
        "homeFavoritesSubtitle":
            MessageLookupByLibrary.simpleMessage("Favoris"),
        "homeIntroDesc": MessageLookupByLibrary.simpleMessage(
            "Ou sautez-la et commencez d\'utiliser l\'appli tout de suite"),
        "homeIntroTitle": MessageLookupByLibrary.simpleMessage(
            "Regardez une introduction brève qui présente les fonctionnalités principales de l\'appli"),
        "homePageTitle": MessageLookupByLibrary.simpleMessage("Pinger"),
        "homePopularSubtitle":
            MessageLookupByLibrary.simpleMessage("Populaires"),
        "homeRecentsEmptyPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Derniers hôtes apparaîtront ici après avoir été pingés"),
        "homeRecentsSubtitle": MessageLookupByLibrary.simpleMessage("Derniers"),
        "hoursSinceNow": m1,
        "infoTrayNetworkDisabled": MessageLookupByLibrary.simpleMessage(
            "La connectivité d\'appareil semble être éteinte. Vérifiez que vous avez l\'accés au réseau afin de pinger des hôtes"),
        "introAdjustSettingsDesc": MessageLookupByLibrary.simpleMessage(
            "Modifiez les paramètres de pinger et les préférences pour adapter le fonctionnement de l\'appli aux vos besoins"),
        "introAdjustSettingsTitle":
            MessageLookupByLibrary.simpleMessage("Réglez les paramètres"),
        "introPingHostDesc": MessageLookupByLibrary.simpleMessage(
            "Soit faites un ping-rapide en appuyant sur le bouton longtemps ou tapez-le pour commencer une nouvelle session"),
        "introPingHostTitle":
            MessageLookupByLibrary.simpleMessage("Pingez l\'hôte"),
        "introSaveResultsDesc": MessageLookupByLibrary.simpleMessage(
            "Archivez les résultats de pinger pour les revoir plus tard et les comparer avec d\'autres utilisateurs de l\'appli"),
        "introSaveResultsTitle":
            MessageLookupByLibrary.simpleMessage("Sauvegardez le résultat"),
        "introSelectHostDesc": MessageLookupByLibrary.simpleMessage(
            "Soit sélectionnez l\'un des hôtes suggérés, trouvez-le parmi les hôtes pingés par les autres utilisateurs ou tapez votre propre"),
        "introSelectHostTitle":
            MessageLookupByLibrary.simpleMessage("Sélectionnez un hôte"),
        "locationAccessDisabledDesc": MessageLookupByLibrary.simpleMessage(
            "Ajustez les paramètres de permissions pour autoriser l\'appli d\'accéder la localisation d\'appareil"),
        "locationAccessDisabledTitle":
            MessageLookupByLibrary.simpleMessage("Localisation désactivée"),
        "minutesSinceNow": m2,
        "moreHostsButtonLabel": MessageLookupByLibrary.simpleMessage("Plus"),
        "moreHostsCountButtonLabel": m3,
        "nothingToShowTitle":
            MessageLookupByLibrary.simpleMessage("Il n\'y a encore rien ici"),
        "notificationAccessDisabledDesc": MessageLookupByLibrary.simpleMessage(
            "Ajustez les paramètres de permissions pour autoriser l\'appli de montrer des notifications"),
        "notificationAccessDisabledTitle":
            MessageLookupByLibrary.simpleMessage("Notifications désactivées"),
        "notificationDoneBody": m4,
        "notificationDoneTitle": m5,
        "notificationPausedBody": m6,
        "notificationPausedTitle": m7,
        "notificationStartedBody": m8,
        "notificationStartedTitle": m9,
        "pingCountLabel": m10,
        "pingFailedCountLabel": MessageLookupByLibrary.simpleMessage("Échoués"),
        "pingGlobalByFrequencyDesc": m11,
        "pingGlobalByFrequencySubtitle":
            MessageLookupByLibrary.simpleMessage("Résultats par la fréquence"),
        "pingGlobalByLocationDesc": m12,
        "pingGlobalByLocationSubtitle": MessageLookupByLibrary.simpleMessage(
            "Résultats par la localisation"),
        "pingGlobalYourResult":
            MessageLookupByLibrary.simpleMessage("Votre résultat"),
        "pingInfoDateLabel": MessageLookupByLibrary.simpleMessage("Date"),
        "pingInfoDurationLabel": MessageLookupByLibrary.simpleMessage("Durée"),
        "pingInfoInfoSubtitle": MessageLookupByLibrary.simpleMessage("Info"),
        "pingInfoSettingsSubtitle":
            MessageLookupByLibrary.simpleMessage("Paramètres"),
        "pingMaxValueLabel": MessageLookupByLibrary.simpleMessage("Max"),
        "pingMeanCountLabel": MessageLookupByLibrary.simpleMessage("Moy"),
        "pingMinCountLabel": MessageLookupByLibrary.simpleMessage("Min"),
        "pingSettingsSheetSubtitle": MessageLookupByLibrary.simpleMessage(
            "Des changes influenceront seulement la session actuelle"),
        "pingSettingsSheetTitle":
            MessageLookupByLibrary.simpleMessage("Paramètres de pinger"),
        "pingSuccessCountLabel":
            MessageLookupByLibrary.simpleMessage("Réussis"),
        "pingSummaryCountLabel":
            MessageLookupByLibrary.simpleMessage("Demandes"),
        "pingSummaryDateLabel": MessageLookupByLibrary.simpleMessage("Date"),
        "pingSummaryDurationLabel":
            MessageLookupByLibrary.simpleMessage("Durée"),
        "pingTotalCountLabel": MessageLookupByLibrary.simpleMessage("Au total"),
        "pingValueLabel": m13,
        "privacyPolicyButtonLabel": MessageLookupByLibrary.simpleMessage(
            "Politique de confidentialité"),
        "recentsPageTitle": MessageLookupByLibrary.simpleMessage("Derniers"),
        "removeHostsPageTitle":
            MessageLookupByLibrary.simpleMessage("Supprimer"),
        "replaceSessionSheetSubtitle": m14,
        "replaceSessionSheetTitle":
            MessageLookupByLibrary.simpleMessage("Une autre session en cours"),
        "resetButtonLabel": MessageLookupByLibrary.simpleMessage("REMETTRE"),
        "resultGlobalEmptyDesc": MessageLookupByLibrary.simpleMessage(
            "Revenez après quelque temps quand il y a des données disponible pour cet hôte"),
        "resultOtherEmptyDesc": MessageLookupByLibrary.simpleMessage(
            "Les autres résultats apparaîtront ici après il\'y en a plus pour cet hôte"),
        "resultPageTitle": MessageLookupByLibrary.simpleMessage("Résultats"),
        "resultResultsSubtitle":
            MessageLookupByLibrary.simpleMessage("Résultats"),
        "resultsGlobalTabLabel":
            MessageLookupByLibrary.simpleMessage("Comparer"),
        "resultsGroupCount": m15,
        "resultsInfoTabLabel": MessageLookupByLibrary.simpleMessage("Plus"),
        "resultsMoreTabLabel": MessageLookupByLibrary.simpleMessage("Autres"),
        "resultsResultsTabLabel":
            MessageLookupByLibrary.simpleMessage("Résultats"),
        "searchHostHint":
            MessageLookupByLibrary.simpleMessage("Rechercher un hôte..."),
        "searchResultsEmptyDesc": MessageLookupByLibrary.simpleMessage(
            "Il n\'y a aucun hôte qui correspond à la requête donnée - vous pouvez toujours le selectionner et essayer de pinger"),
        "searchResultsEmptyTitle":
            MessageLookupByLibrary.simpleMessage("Aucuns résultats trouvés"),
        "secondsSinceNow": m16,
        "sessionAdjustButtonLabel":
            MessageLookupByLibrary.simpleMessage("Régler"),
        "sessionFavoriteButtonLabel":
            MessageLookupByLibrary.simpleMessage("Favori"),
        "sessionPageTitle": MessageLookupByLibrary.simpleMessage("Session"),
        "sessionPingCountsSubtitle":
            MessageLookupByLibrary.simpleMessage("Progrès"),
        "sessionPingValuesSubtitle":
            MessageLookupByLibrary.simpleMessage("Statistiques"),
        "sessionResultsSubtitle":
            MessageLookupByLibrary.simpleMessage("Résultats"),
        "sessionSearchButtonLabel":
            MessageLookupByLibrary.simpleMessage("Réchercher"),
        "sessionStartPromptDesc": MessageLookupByLibrary.simpleMessage(
            "Tapez-le longtemps pour envoyer autant de demandes que vous en avez besoin"),
        "sessionStartPromptTitle": MessageLookupByLibrary.simpleMessage(
            "Tapez sur le bouton afin de commencer une nouvelle session"),
        "sessionSummarySubtitle":
            MessageLookupByLibrary.simpleMessage("Résumé"),
        "settingSheetTitle": MessageLookupByLibrary.simpleMessage(
            "Fournissez une nouvelle valeur"),
        "settingsAttachLocationDesc": MessageLookupByLibrary.simpleMessage(
            "La localisation actuelle sera attachée aux statistiques de session afin de les comparer sur une carte de résultats globale"),
        "settingsAttachLocationTitle":
            MessageLookupByLibrary.simpleMessage("Attacher la localisation"),
        "settingsInfoTraySectionTitle":
            MessageLookupByLibrary.simpleMessage("Panneau d\'informations"),
        "settingsNightModeTitle":
            MessageLookupByLibrary.simpleMessage("Mode nuit"),
        "settingsOtherSectionTitle":
            MessageLookupByLibrary.simpleMessage("Autres"),
        "settingsPageTitle": MessageLookupByLibrary.simpleMessage("Paramètres"),
        "settingsPingCountLabel":
            MessageLookupByLibrary.simpleMessage("Nombre"),
        "settingsPingCountUnit": MessageLookupByLibrary.simpleMessage("x"),
        "settingsPingIntervalLabel":
            MessageLookupByLibrary.simpleMessage("Intervalle"),
        "settingsPingIntervalUnit": MessageLookupByLibrary.simpleMessage("s"),
        "settingsPingPacketSizeLabel":
            MessageLookupByLibrary.simpleMessage("Taille de paquet"),
        "settingsPingPacketSizeUnit": MessageLookupByLibrary.simpleMessage("B"),
        "settingsPingSectionTitle":
            MessageLookupByLibrary.simpleMessage("Pinger"),
        "settingsPingTimeoutLabel":
            MessageLookupByLibrary.simpleMessage("Délai maximum"),
        "settingsPingTimeoutUnit": MessageLookupByLibrary.simpleMessage("s"),
        "settingsRestoreHostDesc": MessageLookupByLibrary.simpleMessage(
            "Une nouvelle session sera automatiquement créée pour le dernier hôte pingé"),
        "settingsRestoreHostTitle":
            MessageLookupByLibrary.simpleMessage("Retenir l\'hôte"),
        "settingsResultsSectionTitle":
            MessageLookupByLibrary.simpleMessage("Résultats"),
        "settingsShareResultsDesc": MessageLookupByLibrary.simpleMessage(
            "Les statistiques de session seront partagées pour permettre aux autres utilisateurs de l\'appli de les comparer avec leurs résultats"),
        "settingsShareResultsLabel":
            MessageLookupByLibrary.simpleMessage("Partager les résultats"),
        "settingsSystemNotificationDesc": MessageLookupByLibrary.simpleMessage(
            "Le statut actuel des sessions en cours apparaîtra sur la barre de notification"),
        "settingsSystemNotificationTitle":
            MessageLookupByLibrary.simpleMessage("Notifications système"),
        "settingsTrayAutoRevealDesc": MessageLookupByLibrary.simpleMessage(
            "Le panneau apparaîtra automatiquement à chaque fois qu\'il y aura un nouvel élément"),
        "settingsTrayAutoRevealTitle":
            MessageLookupByLibrary.simpleMessage("Révéler automatiquement"),
        "settingsTrayEnabledDesc": MessageLookupByLibrary.simpleMessage(
            "Les informations sur l\'appli apparaîtront dans un panneau glissant en bas de l\'écran"),
        "settingsTrayEnabledTitle":
            MessageLookupByLibrary.simpleMessage("Afficher le panneau"),
        "shareLocationButtonLabel":
            MessageLookupByLibrary.simpleMessage("Partager la localisation"),
        "showIntroButtonLabel":
            MessageLookupByLibrary.simpleMessage("Montrer intro"),
        "skipButtonLabel": MessageLookupByLibrary.simpleMessage("SAUTER"),
        "startNowButtonLabel":
            MessageLookupByLibrary.simpleMessage("Démarrer maintenant"),
        "tryAgainButtonLabel": MessageLookupByLibrary.simpleMessage("Retenter"),
        "viewTypeChartLabel": MessageLookupByLibrary.simpleMessage("Graph"),
        "viewTypeGaugleLabel": MessageLookupByLibrary.simpleMessage("Compteur"),
        "viewTypeListLabel": MessageLookupByLibrary.simpleMessage("Liste"),
        "viewTypeMax": MessageLookupByLibrary.simpleMessage("Max"),
        "viewTypeMean": MessageLookupByLibrary.simpleMessage("Moy"),
        "viewTypeMin": MessageLookupByLibrary.simpleMessage("Min"),
        "weeksSinceNow": m17
      };
}
