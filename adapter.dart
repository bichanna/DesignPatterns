/**
 * Written by Nobuharu Shimazu
 * Date: 2022/3/18
 * 
 * Pattern: Adapter
 * (Reusing the code from strategy.dart)
 */

import "strategy.dart";

void makeCharacterFight(Humanoid humanoid) => humanoid.fight();

void main() {
  Humanoid human = Human();
  human.setWeapon(KnifeBehavior());
  makeCharacterFight(human);

  Wimp smallGoblin = SmallGoblin();
  Humanoid smallGoblinAdapter = WimpAdapter(smallGoblin);
  makeCharacterFight(smallGoblinAdapter);
}

class WimpAdapter extends Humanoid {
  Wimp wimp;

  WimpAdapter(this.wimp);

  void fight() => wimp.runAway();
}

/**
 * The abstract class that all wimps inherit
 */
abstract class Wimp {
  WeaponBehavior? weapon;

  void runAway();

  setWeapon(WeaponBehavior wb) => weapon = wb;
}

class SmallGoblin extends Wimp {
  @override
  void runAway() {
    weapon = null;
    print("A small goblin: I can't fight!");
  }
}