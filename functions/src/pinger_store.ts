import admin = require("firebase-admin");
import { Collections, Paths } from "./constants";
import { DailyCounts, DailyResults, DailyResultsMap, MonthlyCounts, MonthlyResults } from "./types";

export class PingerStore {
  _firestoreInstance!: FirebaseFirestore.Firestore;

  public get _firestore() {
    return (
      this._firestoreInstance || (this._firestoreInstance = admin.firestore())
    );
  }

  public get currentDate(): Date {
    return admin.firestore.Timestamp.now().toDate();
  }

  async getDailyCounts(): Promise<DailyCounts> {
    const dailyCountsSnap = await this._firestore
      .collection(Collections.countsDaily)
      .doc(Paths.all)
      .get();
    return dailyCountsSnap.data() ?? {};
  }

  async setDailyCounts(dailyCounts: DailyCounts) {
    await this._firestore
      .collection(Collections.countsDaily)
      .doc(Paths.all)
      .set(dailyCounts);
  }

  async deleteMonthlyResults(host: string) {
    await this._firestore
      .collection(Collections.resultsMonthly)
      .doc(host)
      .delete();
  }

  async getDailyResults(host: string): Promise<DailyResults> {
    const dailyResultsSnap = await this._firestore
      .collection(Collections.resultsDaily)
      .doc(host)
      .get();
    return dailyResultsSnap.data() ?? {};
  }

  async setDailyResults(host: string, dailyResults: DailyResults) {
    await this._firestore
      .collection(Collections.resultsDaily)
      .doc(host)
      .set(dailyResults);
  }

  async deleteDailyResults(host: string) {
    await this._firestore
      .collection(Collections.resultsDaily)
      .doc(host)
      .delete();
  }

  async setMonthlyCounts(monthlyCounts: MonthlyCounts) {
    await this._firestore
      .collection(Collections.countsMonthly)
      .doc(Paths.all)
      .set(monthlyCounts);
  }

  async setMonthlyResults(host: string, monthlyResults: MonthlyResults) {
    await this._firestore
      .collection(Collections.resultsMonthly)
      .doc(host)
      .set(monthlyResults);
  }

  async getDailyResultsMap(): Promise<DailyResultsMap> {
    const dailyResultsQuery = await this._firestore
      .collection(Collections.resultsDaily)
      .get();
    const dailyResultsMap = {} as DailyResultsMap;
    dailyResultsQuery.docs.forEach((it) => {
      const host = it.ref.path.split("/").pop()!;
      dailyResultsMap[host] = it.data();
    });
    return dailyResultsMap;
  }
}
