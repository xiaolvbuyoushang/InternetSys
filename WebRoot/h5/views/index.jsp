<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/header.jsp" %>

<% currentPage = "index"; %>

<section class="py-5 mt-5">
    <div class="container">
        <h2 class="section-title">平台动态</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="alert alert-primary">
                    <h4>最新公告</h4>
                    <p>${latestNotice}</p> <%-- 从Controller传递数据 --%>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="common/footer.jsp" %>