package model;

public class Company {

    private int companyID;
    private String companyName;
    private String address;
    private int typeID;
    private String monitorName;
    private String phone;

    public String getMonitorName() {
        return monitorName;
    }

    public void setMonitorName(String monitorName) {
        this.monitorName = monitorName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getCompanyID() {
        return companyID;
    }

    public void setCompanyID(int companyID) {
        this.companyID = companyID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    @Override
    public String toString() {
        return "Company [companyID=" + companyID + ", companyName=" + companyName + ", address=" + address + ", typeID="
                + typeID + ", monitorName=" + monitorName + ", phone=" + phone + "]";
    }

}
