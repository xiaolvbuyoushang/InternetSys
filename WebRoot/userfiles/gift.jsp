<%@ page import="model.Gift" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="../h5/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    // 设置响应的字符编码为 UTF-8
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");

    // 创建 GiftsPro 实例
    BeanProcess.GiftsPro giftsPro = new BeanProcess.GiftsPro();
    // 获取所有礼品数据
    ArrayList<Gift> gifts = giftsPro.getAllGifts();
    // 将礼品数据存储在请求属性中
    request.setAttribute("gifts", gifts);

    // 从会话中获取用户名
//    String name = (String) request.getSession().getAttribute("myName");

    Integer userID = null;
    int userPoints = 0;

    if (name != null) {
        // 创建 UserPro 实例
        BeanProcess.UserPro userPro = new BeanProcess.UserPro();
        // 获取用户ID
        userID = userPro.getUserIDByUsername(name);
        // 获取用户当前积分
        userPoints = userPro.getUserPointsByUsername(name);

        // 打印用户ID到后台
        if (userID != null) {
            System.out.println("当前用户ID: " + userID);
        } else {
            System.out.println("用户ID未找到");
        }

        // 打印用户积分到后台
        System.out.println("当前用户积分: " + userPoints);
    } else {
        System.out.println("用户未登录或未设置用户名");
    }

    // 处理兑换请求
    if (request.getParameter("action") != null && request.getParameter("action").equals("redeem")) {
        if (userID == null) {
            // 用户未登录，提示用户登录
            out.println("<script>alert('请先登录！'); window.location.href='../login.jsp';</script>");
        } else {
            int giftID = Integer.parseInt(request.getParameter("giftID"));
            // 获取礼品信息
            Gift gift = null;
            for (Gift g : gifts) {
                if (g.getGiftID() == giftID) {
                    gift = g;
                    break;
                }
            }

            if (gift != null) {
                // 创建 UserPro 实例
                BeanProcess.UserPro userPro = new BeanProcess.UserPro();
                // 验证用户积分并更新用户积分
                boolean isValid = userPro.validateAndDeductPoints(userID, gift.getRequiredPoints());
                if (isValid) {
                    // 记录兑换记录
                    boolean isExchanged = giftsPro.exchangeGift(userID, giftID);
                    if (isExchanged) {
                        // 兑换成功，更新礼品库存
                        giftsPro.updateGift(giftID, gift.getGiftName(), gift.getRequiredPoints(), gift.getStock() - 1);
                        out.println("<script>alert('兑换成功！');</script>");
                    } else {
                        out.println("<script>alert('兑换失败，请重试！');</script>");
                    }
                } else {
                    out.println("<script>alert('积分不足，无法兑换！');</script>");
                }
            } else {
                out.println("<script>alert('礼品不存在，请重试！');</script>");
            }
        }
    }
%>

<% currentPage = "securityShop"; %>

<%-- 商品展示区域 --%>
<div class="row">
    <c:forEach items="${gifts}" var="gift">
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
                <%-- 商品状态角标 --%>
                <div class="position-absolute top-0 start-0 m-2">
                    <c:if test="${gift.stock < 10}">
                        <span class="badge bg-warning text-dark">仅剩${gift.stock}件</span>
                    </c:if>
                </div>

                <%-- 商品图片轮播 --%>
                <div id="carousel${gift.giftID}" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="../images/goods1.png" class="d-block w-100 card-img-top"
                                 alt="${gift.giftName}图片"
                                 style="height: 200px; object-fit: cover;">
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <%-- 商品标题 --%>
                    <h5 class="card-title">${gift.giftName}</h5>

                    <%-- 商品描述 --%>
                    <p class="card-text text-truncate-2" style="height: 3em;"
                       title="礼品描述">${gift.giftName} 描述</p>

                    <%-- 价格区域 --%>
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <span class="text-danger fs-5">${gift.requiredPoints}积分</span>
                        </div>
                        <form action="gift.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="redeem">
                            <input type="hidden" name="giftID" value="${gift.giftID}">
                            <button type="submit" class="btn btn-warning">
                                立即兑换
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<%@ include file="../h5/views/common/footer.jsp" %>
