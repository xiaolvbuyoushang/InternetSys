package controller;

import BeanProcess.CompanyPro;
import BeanProcess.CompanyTypePro;
import model.Company;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

// CompanyProcessServlet类，继承自HttpServlet，用于处理与公司信息相关的请求
public class CompanyProcessServlet extends HttpServlet {
    // 序列化版本号，用于确保反序列化和序列化的兼容性
    private static final long serialVersionUID = 1L;

    // 构造函数，调用父类构造函数
    public CompanyProcessServlet() {
        super();
        // 通常在此处不需要额外的初始化代码，默认构造函数可以调用super()
    }

    // 处理GET请求的方法
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取请求中的flag参数，用于标识不同的业务操作
        String flag = (String) request.getParameter("flag");
        String info = "";

        // 根据flag的值进行不同的业务逻辑处理
        if (flag.equals("fenye")) { // 分页查询操作
            // 获取当前页码
            String s_pageNow = request.getParameter("pageNow");
            try {
                // 将当前页码字符串转换为整数
                int pageNow = Integer.parseInt(s_pageNow);
                // 创建CompanyPro对象，用于处理公司相关业务逻辑
                CompanyPro ubc = new CompanyPro();
                // 通过分页获取公司列表
                ArrayList<Company> aList = ubc.getCompanysByPage(pageNow);
                // 获取总页数
                int pageCount = ubc.getPageCount();

                // 将相关数据设置到请求属性中，以便在后续的JSP页面中使用
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");

                // 转发请求到adminfiles/companyinfo.jsp页面进行显示
                request.getRequestDispatcher("adminfiles/companyinfo.jsp").forward(request, response);
            } catch (Exception e) {
                // 如果发生异常，打印异常堆栈信息
                e.printStackTrace();
            }
        } else if (flag.equals("delCompany")) { // 删除公司操作
            // 获取要删除的公司ID
            String companyId = request.getParameter("companyId");
            // 创建CompanyPro对象，用于处理公司相关业务逻辑
            CompanyPro ubc = new CompanyPro();
            // 调用delCompany方法删除公司
            boolean b = ubc.delCompany(companyId);
            if (b == true) { // 如果删除成功
                info = "删除成功";
                request.setAttribute("info", info);
                // 转发请求到admin/select.jsp页面
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
            } else {
                // 如果删除失败，直接转发请求到admin/select.jsp页面
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
            }
        } else if (flag.equals("addCom")) { // 添加公司操作
            // 获取表单提交的公司名称，并对字符编码进行转换
            String comName = request.getParameter("name");
            comName = new String(comName.getBytes("iso-8859-1"), "utf-8");
            // 获取表单提交的公司地址，并对字符编码进行转换
            String address = request.getParameter("phone");
            address = new String(address.getBytes("iso-8859-1"), "utf-8");
            // 获取表单提交的公司类型名称，并对字符编码进行转换
            String typeName = request.getParameter("companytype");
            typeName = new String(typeName.getBytes("iso-8859-1"), "utf-8");
            // 获取表单提交的公司状态，并对字符编码进行转换
            String monName = request.getParameter("status");
            monName = new String(monName.getBytes("iso-8859-1"), "utf-8");
            // 获取表单提交的公司电话，并对字符编码进行转换
            String phone = request.getParameter("level");
            phone = new String(phone.getBytes("iso-8859-1"), "utf-8");

            // 打印添加公司的信息，用于调试
            System.out.println("addcom: " + comName + " " + address + " " + typeName + " ");
            // 创建CompanyTypePro对象，用于处理公司类型相关业务逻辑
            CompanyTypePro typePro = new CompanyTypePro();
            // 根据公司类型名称获取公司类型ID
            int typeid = typePro.getTypeID(typeName);
            // 创建CompanyPro对象，用于处理公司相关业务逻辑
            CompanyPro ubc = new CompanyPro();
            // 调用addCompany方法添加公司
            boolean b = ubc.addCompany(comName, address, typeid, monName, phone);
            if (b) { // 如果添加成功
                // 转发请求到admin/select.jsp页面
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
            } else {
                // 如果添加失败，转发请求到admin/select.jsp页面
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
            }
        } else if (flag.equals("updateCom")) { // 更新公司信息操作
            // 获取要更新的公司ID
            int copanyID = Integer.parseInt(request.getParameter("id"));
            // 获取表单提交的公司名称，并对字符编码进行转换
            String name = request.getParameter("name");
            name = new String(name.getBytes("iso-8859-1"), "utf-8");
            System.out.println("updateCom test: " + name);
            // 获取表单提交的公司地址，并对字符编码进行转换
            String comaddress = request.getParameter("phone");
            comaddress = new String(comaddress.getBytes("iso-8859-1"), "utf-8");
            // 获取表单提交的公司类型名称，并对字符编码进行转换
            String comType = request.getParameter("companytype");
            comType = new String(comType.getBytes("iso-8859-1"), "utf-8");
            // 创建CompanyTypePro对象，用于处理公司类型相关业务逻辑
            CompanyTypePro companyPro = new CompanyTypePro();
            // 根据公司类型名称获取公司类型ID
            int typeid = companyPro.getTypeID(comType);
            // 获取表单提交的公司状态
            String monName = request.getParameter("status");
            // 获取表单提交的公司电话
            String phone = request.getParameter("password");
            // 创建CompanyPro对象，用于处理公司相关业务逻辑
            CompanyPro ubc = new CompanyPro();
            // 调用updateCompany方法更新公司信息
            boolean b = ubc.updateCompany(copanyID, name, comaddress, typeid, monName, phone);
            if (b) { // 如果更新成功
                // 转发请求到admin/select.jsp页面
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
            } else {
                // 如果更新失败，转发请求到admin/select.jsp页面
                request.getRequestDispatcher("admin/select.jsp").forward(request, response);
            }
        } else if (flag.equals("findCom")) { // 查找公司操作
            // 获取要查找的公司类型名称，并对字符编码进行转换
            String comType = request.getParameter("comTypeCheck");
            comType = new String(comType.getBytes("iso-8859-1"), "utf-8");
            System.out.println("findCom test1: " + comType);
            // 创建CompanyTypePro对象，用于处理公司类型相关业务逻辑
            CompanyTypePro typePro = new CompanyTypePro();
            // 根据公司类型名称获取公司类型ID
            int typeID = typePro.getTypeID(comType);
            System.out.println("findCom typeID test: " + typeID);
            // 获取当前页码
            String s_pageNow = request.getParameter("pageNow");
            try {
                // 将当前页码字符串转换为整数
                int pageNow = Integer.parseInt(s_pageNow);
                System.out.println("findCom pageNow test: " + pageNow);
                // 创建CompanyPro对象，用于处理公司相关业务逻辑
                CompanyPro companyPro = new CompanyPro();
                // 通过分页和公司类型ID获取公司列表
                ArrayList<Company> aList = companyPro.getCompanysPageByID(pageNow, typeID);
                System.out.println("findCom test: " + aList);
                // 获取总页数
                int pageCount = companyPro.getPageCount();

                // 将相关数据设置到请求属性中，以便在后续的JSP页面中使用
                request.setAttribute("result", aList);
                request.setAttribute("pageCount", pageCount + "");
                request.setAttribute("pageNow", pageNow + "");

                // 转发请求到adminfiles/companyinfo.jsp页面进行显示
                request.getRequestDispatcher("adminfiles/companyinfo.jsp").forward(request, response);
            } catch (Exception e) {
                // 如果发生异常，打印异常堆栈信息
                e.printStackTrace();
            }
        }
    }

    // 处理POST请求的方法，这里直接调用doGet方法来处理POST请求
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 调用doGet方法处理POST请求
        this.doGet(request, response);
    }
}