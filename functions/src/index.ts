import admin = require("firebase-admin");
import functions = require("firebase-functions");
import handlers = require("./handlers");
import { Intervals, Paths, Regions } from "./constants";
import { Session } from "./types";

admin.initializeApp();

exports.updateDailyData = functions
  .region(Regions.euWest3)
  .firestore.document(Paths.session)
  .onCreate((snapshot, _) => {
    const session = snapshot.data() as Session;
    return Promise.all([
      handlers.updateDailyCounts(session),
      handlers.updateDailyResults(session),
    ]);
  });

exports.resfreshMonthlyData = functions
  .region(Regions.euWest3)
  .pubsub.schedule(Intervals.refreshDataInterval)
  .onRun((_) =>
    Promise.all([
      handlers.refreshMonthlyCounts(),
      handlers.refreshMonthlyResults(),
    ])
  );
