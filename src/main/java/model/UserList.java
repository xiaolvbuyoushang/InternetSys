
//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package model;

/**
 * 用户信息实体类，用于存储和管理用户的基础信息及关联企业信息
 * 包含用户ID、用户名、联系方式、企业信息、状态标识、权限等级等核心字段
 */
public class UserList {
    private int userID;
    private String userName;
    private String phone;
    private String companyName;
    private String companyTypeName;
    private int status;
    private int level;
    private String userPass;

    /**
     * 构造方法，创建一个空的用户信息对象
     */
    public UserList() {
    }

    /**
     * 获取用户唯一标识符
     *
     * @return 用户ID数值
     */
    public int getUserID() {
        return this.userID;
    }

    /**
     * 设置用户唯一标识符
     *
     * @param userID 用户ID数值，应大于0的有效整数
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }

    /**
     * 获取用户显示名称
     *
     * @return 用户姓名或昵称字符串
     */
    public String getUserName() {
        return this.userName;
    }

    /**
     * 设置用户显示名称
     *
     * @param userName 非空的有效用户名，长度建议在2-20个字符之间
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取用户联系方式
     *
     * @return 包含区号的有效电话号码字符串
     */
    public String getPhone() {
        return this.phone;
    }

    /**
     * 设置用户联系方式
     *
     * @param phone 符合电话号码格式规范的字符串
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取用户关联企业名称
     *
     * @return 企业注册全称字符串
     */
    public String getCompanyName() {
        return this.companyName;
    }

    /**
     * 设置用户关联企业名称
     *
     * @param companyName 有效的企业法定名称，不能包含特殊字符
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    /**
     * 获取企业类型分类名称
     *
     * @return 企业类型名称字符串（如：上市公司、民营企业等）
     */
    public String getCompanyTypeName() {
        return this.companyTypeName;
    }

    /**
     * 设置企业类型分类名称
     *
     * @param companyTypeName 来自预定义分类的有效类型名称
     */
    public void setCompanyTypeName(String companyTypeName) {
        this.companyTypeName = companyTypeName;
    }

    /**
     * 获取用户状态标识
     *
     * @return 状态码数值（如：0-禁用，1-启用等）
     */
    public int getStatus() {
        return this.status;
    }

    /**
     * 设置用户状态标识
     *
     * @param status 必须为系统预定义的有效状态码
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * 获取用户权限等级
     *
     * @return 权限等级数值（数值越大权限越高）
     */
    public int getLevel() {
        return this.level;
    }

    /**
     * 设置用户权限等级
     *
     * @param level 必须为系统定义范围内的有效权限等级
     */
    public void setLevel(int level) {
        this.level = level;
    }

    /**
     * 获取用户登录凭证
     *
     * @return 经过加密处理的密码字符串
     */
    public String getUserPass() {
        return this.userPass;
    }

    /**
     * 设置用户登录凭证
     *
     * @param userPass 经过加密处理的密码字符串，禁止明文存储
     */
    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    /**
     * 生成用户信息的完整字符串表示
     *
     * @return 包含所有字段值的格式化字符串，用于调试和日志记录
     */
    public String toString() {
        return "UserList [userID=" + this.userID + ", userName=" + this.userName + ", phone=" + this.phone + ", companyName=" + this.companyName + ", companyTypeName=" + this.companyTypeName + ", status=" + this.status + ", level=" + this.level + ", userPass=" + this.userPass + "]";
    }
}