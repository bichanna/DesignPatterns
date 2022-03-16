/*
  Written by Nobuharu Shimazu
  Date: 2022/3/16

  Pattern: Observer
*/

void main() {
  Subject nobyTimes = NobyTimes();
  Observer a = SubscriberA();
  Observer b = SubscriberB();

  nobyTimes.registerSubscriber(a);
  nobyTimes.registerSubscriber(b);

  nobyTimes.deliverNews("Mr. Noby Tastes Blue Cheese At Last!");
  nobyTimes.deliverNews("Mr. Noby Starts Learning Design Patterns!");
}

/*
  The interface that NobyTimes class implements
*/
abstract class Subject {
  void registerSubscriber(Observer o);
  void removeSubscriber(Observer o);
  void deliverNews(String news);
}

class NobyTimes implements Subject{
  late List<Observer> subscribers;

  NobyTimes() {
    subscribers = [];
  }

  @override
  void registerSubscriber(Observer o) {
    subscribers.add(o);
  }

  @override
  void removeSubscriber(Observer o) {
    subscribers.remove(o);
  }

  @override
  void deliverNews(String news) {
    subscribers.forEach((s) => s.receive(news));
  }
}

/*
  The interface that all subscribers implement
*/
abstract class Observer {
  void receive(String news);
}

class SubscriberA implements Observer {
  @override
  void receive(String news) {
    print("Subscriber A: I got the news, and it says \"${news}\"");
  }
}

class SubscriberB implements Observer {
  @override
  void receive(String news) {
    print("Subscriber B: So, today's news says \"${news}\"");
  }
}