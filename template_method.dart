/**
 * Written by Nobuharu Shimazu
 * Date: 2022/3/21
 * 
 * Pattern: Template Method
 */

import "dart:io";

void main() {
  Coffee coffee = Coffee();
  coffee.prepareRecipe();

  print("\n");

  Tea tea = Tea();
  tea.prepareRecipe();
}

/**
 * The abstract class that all cafeine begerage inherit
 */
abstract class CaffeineBeverage {
  void prepareRecipe() {
    boilWater();
    brew();
    pourInCup();
    if (needCondiments()) addCondiments();
  }

  void boilWater() => print("Boiling some water");
  void brew();
  void pourInCup();
  void addCondiments();
  bool needCondiments() => true; // This is a hook; the subclass can decide whether it wants to override or not.
}

class Coffee extends CaffeineBeverage {
  void brew() => print("Brewing coffee in boiling water");
  void pourInCup() => print("Pouring coffee in a cup");
  void addCondiments() => print("Adding sugar and milk");
  bool needCondiments() {
    print("Would you like condiments in your coffee? ");
    
    String? answer = stdin.readLineSync();

    if (answer == null) return false;
    if (answer.startsWith("y")) return true;
    
    return false;
  }
}

class Tea extends CaffeineBeverage {
  void brew() => print("Steeping tea in boiling water");
  void pourInCup() => print("Pouring tea in a cup");
  void addCondiments() => print("Adding lemon");
  bool needCondiments() {
    print("Would you like condiments in your tea? ");
    
    String? answer = stdin.readLineSync();

    if (answer == null) return false;
    if (answer.startsWith("y")) return true;
    
    return false;
  }
}