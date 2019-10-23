package auction;

import cartago.*;

import java.util.ArrayList;

public class buyers extends Artifact {

    private ArrayList<String> members = new ArrayList();

    void init() {
        this.defineObsProperty("count", members.size());
    }

    @OPERATION void join(String name){
        members.add(name);
        ObsProperty prop = getObsProperty("count");
        prop.updateValue(members.size());
    }

    @OPERATION void exit(String name){
        if(members.size() > 1)
            members.remove(name);
        ObsProperty prop = getObsProperty("count");
        prop.updateValue(members.size());
    }

    @OPERATION void winner(OpFeedbackParam name){
        name.set(members.get(0));
        signal("win",members.get(0));
    }

}