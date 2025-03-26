package model;

/**
 * 用户实体类，用于表示系统中的用户信息
 *
 * <p>包含用户基本资料、联系信息、所属企业、账户状态、操作权限及认证信息等属性
 */
public class User {

    /**
     * 用户唯一标识符
     */
    private int userID;
    /**
     * 用户显示名称
     */
    private String userName;
    /**
     * 用户注册手机号码
     */
    private String phone;
    /**
     * 用户绑定邮箱地址
     */
    private String email;
    /**
     * 用户关联的微信账号
     */
    private String wechat;
    /**
     * 用户所属企业ID（关联企业表）
     */
    private int companyID;
    /**
     * 用户账户状态标识（0-禁用，1-正常）
     */
    private int status;
    /**
     * 用户可执行的操作权限编码
     */
    private String operation;
    /**
     * 用户权限等级（1-普通用户，2-管理员）
     */
    private int level;
    /**
     * 用户登录密码（建议存储加密后的密文）
     */
    private String userPass;

//    -------
    /**
     * 用户所属组别
     */
    private String userGroup;

    /**
     * 用户积分
     */
    private int userPoints;
//    -------

    /**
     * 获取用户唯一标识
     *
     * @return 用户ID值
     */
    public int getUserID() {
        return userID;
    }

    /**
     * 设置用户唯一标识
     *
     * @param userID 新的用户ID值
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }

    /**
     * 获取用户显示名称
     *
     * @return 当前用户名称
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置用户显示名称
     *
     * @param userName 新的用户名称
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取用户注册手机号
     *
     * @return 完整手机号码字符串
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置用户手机号码
     *
     * @param phone 符合规范的手机号码
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取用户绑定邮箱
     *
     * @return 完整的邮箱地址
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置用户邮箱地址
     *
     * @param email 合法的邮箱格式字符串
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取关联微信账号
     *
     * @return 微信OpenID或微信号
     */
    public String getWechat() {
        return wechat;
    }

    /**
     * 设置关联微信账号
     *
     * @param wechat 微信系统的唯一标识符
     */
    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    /**
     * 获取用户当前状态
     *
     * @return 状态编码（0/1）
     */
    public int getStatus() {
        return status;
    }

    /**
     * 设置用户状态
     *
     * @param status 状态编码（0-禁用，1-启用）
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * 获取用户操作权限集
     *
     * @return 权限编码字符串
     */
    public String getOperation() {
        return operation;
    }

    /**
     * 设置用户操作权限
     *
     * @param operation 权限编码组合字符串
     */
    public void setOperation(String operation) {
        this.operation = operation;
    }

    /**
     * 获取用户权限等级
     *
     * @return 等级数值（1-普通，2-管理）
     */
    public int getLevel() {
        return level;
    }

    /**
     * 设置用户权限等级
     *
     * @param level 新的权限等级值
     */
    public void setLevel(int level) {
        this.level = level;
    }

    /**
     * 获取用户登录密码
     *
     * @return 加密后的密码字符串
     */
    public String getUserPass() {
        return userPass;
    }

    /**
     * 设置用户登录密码
     *
     * @param userPass 经过加密处理的密码字符串
     */
    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }
//    ---------

    /**
     * 获取用户积分
     *
     * @return 用户积分值
     */
    public int getUserPoints() {
        return userPoints;
    }

    /**
     * 设置用户积分
     *
     * @param userPoints 新的用户积分值
     */
    public void setUserPoints(int userPoints) {
        this.userPoints = userPoints;
    }

    /**
     * 增加用户积分
     *
     * @param points 要增加的积分值
     */
    public void addUserPoints(int points) {
        this.userPoints += points;
    }

    /**
     * 减少用户积分
     *
     * @param points 要减少的积分值
     */
    public void subtractUserPoints(int points) {
        this.userPoints -= points;
    }
//       ---------

    /**
     * 获取所属企业ID
     *
     * @return 企业表关联ID
     */
    public int getCompanyID() {
        return companyID;
    }

    /**
     * 设置关联企业ID
     *
     * @param companyID 企业表中的有效ID
     */
    public void setCompanyID(int companyID) {
        this.companyID = companyID;
    }

    /**
     * 生成用户信息的字符串表示
     *
     * @return 包含所有用户字段值的格式化字符串
     */
    @Override
    public String toString() {
        return "User [userID=" + userID + ", userName=" + userName + ", phone="
                + phone + ", email=" + email + ", wechat=" + wechat
                + ", companyID=" + companyID + ", status=" + status
                + ", operation=" + operation + ", level=" + level
                + ", userPass=" + userPass + ", userGroup=" + userGroup
                + ", userPoints=" + userPoints + "]";
    }
}
