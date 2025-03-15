package model;

public class CompanyType {

    private int typeid;
    private String type;

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "CompanyType [typeid=" + typeid + ", type=" + type + "]";
    }


}
