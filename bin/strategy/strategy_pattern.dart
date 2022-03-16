/*
  Written by Nobuharu Shimazu
  Date: 2022/3/16
  
  Pattern: Strategy
*/

void main() {
  Character elfA = Elf();
  elfA.setWeapon(SwordBehavior());
  elfA.fight();

  Character humanB = Human();
  humanB.setWeapon(KnifeBehavior());
  humanB.fight();

  Character trollC = Troll();
  trollC.setWeapon(AxeBehavior());
  trollC.fight();
}

/*
  The interface that all weapon behavior classes implement
*/
abstract class WeaponBehavior {
  String useWeapon();
}

class SwordBehavior implements WeaponBehavior {
  @override
  String useWeapon() => "Swing, swing! Swinging a Sword!";
}

class AxeBehavior implements WeaponBehavior {
  @override
  String useWeapon() => "Chop, chop! Chopping with an Axe!";
}

class KnifeBehavior implements WeaponBehavior {
  @override
  String useWeapon() => "Cutting with a Knife!";
}


/*
  The abstract class that all character classes inherit
*/
abstract class Character {
  WeaponBehavior? weapon;

  void fight();

  setWeapon(WeaponBehavior wb) => weapon = wb;
}

class Human extends Character {
  @override
  void fight() {
    print("A human: ${weapon?.useWeapon()}");
  }
}

class Troll extends Character {
  @override
  void fight() {
    print("A troll: ${weapon?.useWeapon()}");
  }
}

class Elf extends Character {
  @override
  void fight() {
    print("An elf: ${weapon?.useWeapon()}");
  }
}