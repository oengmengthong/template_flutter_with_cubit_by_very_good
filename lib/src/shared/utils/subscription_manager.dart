import 'dart:async';

class SubscriptionManager {
  List<StreamSubscription> subscriptions = [];

  void add(StreamSubscription subscription) {
    subscriptions.add(subscription);
  }

  Future<void> cancelAll() async {
    for (var subscription in subscriptions) {
      await subscription.cancel();
    }
  }
}
