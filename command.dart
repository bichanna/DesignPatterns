/**
 * Written by Nobuharu Shimazu
 * Date: 2022/3/18
 * 
 * Pattern: Command
 */

void main() { // <- customer
  Waitress waitress = Waitress();
  Cook cook = Cook();

  Command order = Order("Cheese Burger", cook);
  Command anotherCommand = Payment([order], waitress);

  waitress.takeCommand(order);
  waitress.takeCommand(anotherCommand);
}

/**
 * The interface that all Command classes implements
 */
abstract class Command {
  void execute();
}

class Order implements Command {
  String orderSlip;
  Cook cook;

  Order(this.orderSlip, this.cook);

  void execute() => cook.action(orderSlip);
}

class Payment implements Command {
  List<Command> commands;
  Waitress waitress;

  Payment(this.commands, this.waitress);

  void execute() => waitress.handlePayment(commands);
}



class Waitress {
  void takeCommand(Command command) {
    command.execute();
  }

  void handlePayment(List<Command> commands) => print("Handling payment...");
}

class Cook {
  void action(String order) => print("Cooking $order in the kitchen");
}