/*
  Written by Nobuharu Shimazu
  Date: 2022/3/16

  Pattern: Observer (pull)
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
  String getNews();
}

class NobyTimes implements Subject{
  late List<Observer> subscribers;
  late String news;

  NobyTimes() {
    subscribers = [];
    news = "";
  }

  @override
  void registerSubscriber(Observer o) {
    subscribers.add(o);
    o.register(this);
  }

  @override
  void removeSubscriber(Observer o) {
    subscribers.remove(o);
  }

  @override
  void deliverNews(String news) {
    this.news = news;
    subscribers.forEach((s) => s.update());
  }

  @override
  String getNews() => news;
}

/*
  The interface that all subscribers implement
*/
abstract class Observer {
  late Subject subject;
  
  void update();
  void register(Subject s);
}

class SubscriberA implements Observer {
  late Subject subject;

  @override
  void register(Subject s) {
    subject = s;
  }

  @override
  void update() {
    print("Subscriber A: I got the news, and it says \"${subject.getNews()}\"");
  }
}

class SubscriberB implements Observer {
  late Subject subject;
  
  @override register(Subject s) {
    subject = s;
  }

  @override
  void update() {
    print("Subscriber B: So, today's news says \"${subject.getNews()}\"");
  }
}