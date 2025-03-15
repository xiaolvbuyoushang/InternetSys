package tools;

import java.util.ArrayList;

//import BeanProcess.CompanyPro;
//import model.Company;
import BeanProcess.TaskOnePro;
//import BeanProcess.UserPro;
import model.TaskOne;
//import model.User;

public class Test {

    public static void main(String[] args) {
        TaskOnePro taskOnePro = new TaskOnePro();
        ArrayList<TaskOne> al = taskOnePro.getTaskPageByTime(1, "2019-12-03", "2019-12-20");
        System.out.println(al);
//		UserPro userPro = new UserPro();
//		ArrayList<User> users = userPro.getUserPageByComID(3,1);
//		System.out.println(users);
//		TypeSelect select = new TypeSelect();
//		String name = select.companyNameSelect(1);
//		CompanyPro companyPro = new CompanyPro();
//		String comName = companyPro.getNameByID(1);
//		System.out.println(name+"\t"+comName);
//		ArrayList<Company> list = companyPro.getCompanysPageByID(1, 1);
//		System.out.println(list);

    }

}
