package pattern.Strategy.animals.behaviors;

import pattern.Strategy.animal.behavior.*;

/**
 * Created by root on 14-4-1.
 */
public class Quack implements QuackBehavior {

    public void quack(){
        System.out.println("Quack");
    }

}