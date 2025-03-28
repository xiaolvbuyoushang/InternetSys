<%@ page import="model.ExchangeRecord" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="BeanProcess.ExchangeRecordPro" %>
<%@ page import="BeanProcess.GiftsPro" %>
<%@ page import="model.Gift" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="../h5/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    // 设置响应的字符编码为 UTF-8
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");

    // 从会话中获取用户名
//    String name = (String) request.getSession().getAttribute("myName");

    Integer userID = null;
    ArrayList<ExchangeRecord> exchangeRecords = new ArrayList<>();

    if (name != null) {
        // 创建 UserPro 实例
        BeanProcess.UserPro userPro = new BeanProcess.UserPro();
        // 获取用户ID
        userID = userPro.getUserIDByUsername(name);

        if (userID != null) {
            // 创建 ExchangeRecordPro 实例
            ExchangeRecordPro exchangeRecordPro = new ExchangeRecordPro();
            // 获取用户的兑换记录
            exchangeRecords = exchangeRecordPro.getExchangeRecordsByUserID(userID);

            // 创建 GiftsPro 实例
            GiftsPro giftsPro = new GiftsPro();
            // 获取所有礼品信息
            ArrayList<Gift> allGifts = giftsPro.getAllGifts();

            // 创建一个 HashMap 来存储礼品ID和礼品名称的映射
            java.util.HashMap<Integer, String> giftNameMap = new java.util.HashMap<>();
            for (Gift gift : allGifts) {
                giftNameMap.put(gift.getGiftID(), gift.getGiftName());
            }

            // 将礼品名称映射存储在请求属性中
            request.setAttribute("giftNameMap", giftNameMap);
        }
    } else {
        System.out.println("用户未登录或未设置用户名");
    }

    // 将兑换记录存储在请求属性中
    request.setAttribute("exchangeRecords", exchangeRecords);
%>

<% currentPage = "myGifts"; %>

<%-- 兑换记录展示区域 --%>
<div class="container mt-5">
    <h3 class="text-center">我的兑换记录</h3>
    <div class="row">
        <c:choose>
            <c:when test="${fn:length(exchangeRecords) > 0}">
                <c:forEach items="${exchangeRecords}" var="record">
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">${giftNameMap[record.giftID]}</h5>
                                <p class="card-text">
                                    兑换日期: <fmt:formatDate value="${record.exchangeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="col-md-12 text-center">
                    <p>您还没有兑换任何礼品。</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<%@ include file="../h5/views/common/footer.jsp" %>
