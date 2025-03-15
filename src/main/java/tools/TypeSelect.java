package tools;

import BeanProcess.CompanyPro;
import BeanProcess.CompanyTypePro;
import BeanProcess.UserPro;

public class TypeSelect {

    public String companyTypeSelect(int companyid) {
        String type = "";
        CompanyPro companyPro = new CompanyPro();
        int typeid = companyPro.getTypeIDByID(companyid);
        CompanyTypePro typePro = new CompanyTypePro();
        type = typePro.getTypeName(typeid);
        return type;
    }

    public int getCompanyID(String name) {
        int id = 0;

        return id;
    }

    public String statusChange(int taskstatus) {
        String status = "";
        if (taskstatus == 0) {
            status = "未处理";
        } else {
            status = "已处理";
        }
        return status;
    }

    public String companyNameSelect(int companyid) {
        String name = "";
        CompanyPro companyPro = new CompanyPro();
        name = companyPro.getNameByID(companyid);
        return name;
    }

    public String userGrant(int userStatus) {
        String userStaString = "";
        if (userStatus == 1) {
            userStaString = "可以登录";
        } else {
            userStaString = "限制登录";
        }
        return userStaString;
    }

    public String selectUserNameByUserID(int userid) {
        UserPro userPro = new UserPro();
        String userName = userPro.getUserNameByUserid(userid);
        return userName;
    }

//	public static void main(String[] argss) {
//		System.out.println(new TypeSelect().userNameSelect(1));
//		
//	}
}
