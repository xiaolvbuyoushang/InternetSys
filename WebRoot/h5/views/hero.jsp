<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% currentPage = "hero"; %>

<style>
    .data-table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        background: white;
    }

    .data-table th, .data-table td {
        padding: 12px;
        border: 1px solid #e0e0e0;
        text-align: left;
    }

    .status-active {
        color: #4CAF50;
    }

    .status-inactive {
        color: #F44336;
    }

    .operation-links a {
        margin: 0 5px;
        color: #2196F3;
        text-decoration: none;
    }
</style>

<table class="data-table">
    <thead>
    <tr>
        <th>用户ID</th>
        <th>用户名</th>
        <th>手机号</th>
        <th>单位名称</th>
        <th>单位类型</th>
        <th>登录状态</th>
        <th>用户级别</th>
    </tr>
    </thead>
    <tbody>
    <!-- 测试数据 -->
    <tr>
        <td>1</td>
        <td>张三</td>
        <td>1112225563</td>
        <td>市级政府</td>
        <td>市级单位</td>
        <td class="status-active">可以登录</td>
        <td>
            <div class="level-star">
                ★
            </div>
        </td>
    </tr>
    <tr>
        <td>2</td>
        <td>赵三</td>
        <td>11122233311</td>
        <td>区网安局</td>
        <td>市级各辖区单位</td>
        <td class="status-active">可以登录</td>
        <td>
            <div class="level-star">
                ★★
            </div>
        </td>
    </tr>
    <tr>
        <td>3</td>
        <td>小刘</td>
        <td>13961023668</td>
        <td>纵横家</td>
        <td>受监管企业单位</td>
        <td class="status-active">可以登录</td>
        <td>
            <div class="level-star">
                ★★★
            </div>
        </td>
    </tr>
    <tr>
        <td>4</td>
        <td>皇城PK</td>
        <td>13961023668</td>
        <td>ceo@iqianyue.com</td>
        <td>安全服务单位</td>
        <td class="status-active">可以登录</td>
        <td>
            <div class="level-star">
                ★★★★
            </div>
        </td>

    </tr>
    </tbody>
</table>

<%@ include file="common/footer.jsp" %>
