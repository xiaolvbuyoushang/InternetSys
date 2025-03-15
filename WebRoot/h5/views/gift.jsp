<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% currentPage = "securityShop"; %>

<%-- 积分兑换筛选条件 --%>
<div class="row mb-4">
    <div class="col-md-12">
        <form class="form-inline" id="filterForm">
            <%-- 礼品类型筛选 --%>
            <div class="form-group mr-3">
                <select class="form-control" name="category">
                    <option value="all">全部礼品</option>
                    <option value="electronics">数码产品</option>
                    <option value="daily">生活用品</option>
                    <option value="coupon">优惠券</option>
                </select>
            </div>

            <%-- 积分区间筛选 --%>
            <div class="form-group mr-3">
                <select class="form-control" name="pointsRange">
                    <option value="0">所有积分</option>
                    <option value="1">0-500积分</option>
                    <option value="2">500-1000积分</option>
                    <option value="3">1000+积分</option>
                </select>
            </div>

            <%-- 排序方式 --%>
            <div class="form-group mr-3">
                <select class="form-control" name="sort">
                    <option value="new">最新上架</option>
                    <option value="points_asc">积分从低到高</option>
                    <option value="points_desc">积分从高到低</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">筛选</button>
        </form>
    </div>
</div>

<%-- 商品展示区域 --%>
<div class="row">
    <c:forEach items="${products}" var="product">
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
                    <%-- 商品状态角标 --%>
                <div class="position-absolute top-0 start-0 m-2">
                    <c:if test="${product.hot}">
                        <span class="badge bg-danger">热卖</span>
                    </c:if>
                    <c:if test="${product.stock < 10}">
                        <span class="badge bg-warning text-dark">仅剩${product.stock}件</span>
                    </c:if>
                </div>

                    <%-- 商品图片轮播 --%>
                <div id="carousel${product.id}" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <c:forEach items="${product.images}" var="image" varStatus="status">
                            <div class="carousel-item ${status.first ? 'active' : ''}">
                                <img src="${image}" class="d-block w-100 card-img-top"
                                     alt="${product.name}图片${status.index+1}"
                                     style="height: 200px; object-fit: cover;">
                            </div>
                        </c:forEach>
                    </div>
                    <c:if test="${fn:length(product.images) > 1}">
                        <button class="carousel-control-prev" type="button"
                                data-bs-target="#carousel${product.id}" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        </button>
                        <button class="carousel-control-next" type="button"
                                data-bs-target="#carousel${product.id}" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        </button>
                    </c:if>
                </div>

                <div class="card-body">
                        <%-- 商品标题 --%>
                    <h5 class="card-title">
                            ${product.name}
                        <c:if test="${product.isNew}">
                            <span class="badge bg-success">新品</span>
                        </c:if>
                    </h5>

                        <%-- 商品评分 --%>
                    <div class="d-flex align-items-center mb-2">
                        <div class="rating-stars">
                            <c:forEach begin="1" end="5" var="star">
                                <i class="fas fa-star ${star <= product.rating ? 'text-warning' : 'text-secondary'}"></i>
                            </c:forEach>
                        </div>
                        <small class="text-muted ms-2">(${product.reviews}条评价)</small>
                    </div>

                        <%-- 商品描述 --%>
                    <p class="card-text text-truncate-2" style="height: 3em;"
                       title="${product.description}">${product.description}</p>

                        <%-- 价格区域 --%>
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <span class="text-danger fs-5">¥${product.price}</span>
                            <c:if test="${not empty product.originalPrice}">
                                <del class="text-muted ms-2">¥${product.originalPrice}</del>
                            </c:if>
                        </div>
                        <button class="btn btn-primary"
                                onclick="addToCart(${product.id})">
                            <i class="fas fa-shopping-cart me-2"></i>立即购买
                        </button>
                    </div>

                        <%-- 商品详情 --%>
                    <div class="mt-3">
                        <ul class="list-unstyled small text-muted">
                            <li><i class="fas fa-shield-alt me-2"></i>保障：${product.guarantee}</li>
                            <li><i class="fas fa-truck me-2"></i>配送：全国包邮</li>
                            <li><i class="fas fa-certificate me-2"></i>认证：${product.certifications}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<div class="d-flex justify-content-between align-items-center">
    <span class="text-success">
        <i class="fas fa-coins"></i>
        ${product.requiredPoints}积分
    </span>
    <button class="btn btn-warning"
            onclick="redeemGift(${product.id})">
        立即兑换
    </button>
</div>


<%@ include file="common/footer.jsp" %>
