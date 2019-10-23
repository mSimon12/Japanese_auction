package auction;

import cartago.Artifact;
import cartago.OPERATION;
import cartago.ObsProperty;

import java.util.ArrayList;

public class buyers extends Artifact {

    private ArrayList<String> members = new ArrayList();

    void init() {
        // creates an observable property called numMsg
        this.defineObsProperty("counter", members.size());
    }

    @OPERATION void join(String name){
        members.add(name);
        ObsProperty prop = getObsProperty("counter");
        prop.updateValue(members.size());
    }

    @OPERATION void exit(String name){
        members.remove(name);
        ObsProperty prop = getObsProperty("counter");
        prop.updateValue(members.size());
    }

    @OPERATION void winner(OpFeedbackParam name){
        name.set(members.get(0))
  }

}