package model;

/**
 * 审计员实体类，用于表示系统中的审计员信息
 *
 * <p>包含审计员基本资料、联系信息等属性
 */
public class Auditor {

    /**
     * 审计员唯一标识符
     */
    private int auditorID;

    /**
     * 审计员姓名
     */
    private String auditorName;

    /**
     * 审计员登录密码（建议存储加密后的密文）
     */
    private String auditorPass;

    /**
     * 审计员电话号码
     */
    private String phone;

    /**
     * 获取审计员唯一标识
     *
     * @return 审计员ID值
     */
    public int getAuditorID() {
        return auditorID;
    }

    /**
     * 设置审计员唯一标识
     *
     * @param auditorID 新的审计员ID值
     */
    public void setAuditorID(int auditorID) {
        this.auditorID = auditorID;
    }

    /**
     * 获取审计员姓名
     *
     * @return 当前审计员姓名
     */
    public String getAuditorName() {
        return auditorName;
    }

    /**
     * 设置审计员姓名
     *
     * @param auditorName 新的审计员姓名
     */
    public void setAuditorName(String auditorName) {
        this.auditorName = auditorName;
    }

    /**
     * 获取审计员登录密码
     *
     * @return 加密后的密码字符串
     */
    public String getAuditorPass() {
        return auditorPass;
    }

    /**
     * 设置审计员登录密码
     *
     * @param auditorPass 经过加密处理的密码字符串
     */
    public void setAuditorPass(String auditorPass) {
        this.auditorPass = auditorPass;
    }

    /**
     * 获取审计员电话号码
     *
     * @return 完整电话号码字符串
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置审计员电话号码
     *
     * @param phone 符合规范的电话号码
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 生成审计员信息的字符串表示
     *
     * @return 包含所有审计员字段值的格式化字符串
     */
    @Override
    public String toString() {
        return "Auditor [auditorID=" + auditorID + ", auditorName=" + auditorName + ", auditorPass=" + auditorPass
                + ", phone=" + phone + "]";
    }
}
