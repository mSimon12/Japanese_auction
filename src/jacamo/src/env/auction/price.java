package auction;

import cartago.Artifact;
import cartago.OPERATION;
import cartago.ObsProperty;


public class price extends Artifact {

    void init() {
        // creates an observable property called numMsg
        //this.defineObsProperty("value",false);
    }

    @OPERATION void start(int value){
        this.defineObsProperty("price",value);
    }

    @OPERATION void inc(int value){
        ObsProperty prop = getObsProperty("price");
        prop.updateValue(prop.intValue()+value);
      }

}