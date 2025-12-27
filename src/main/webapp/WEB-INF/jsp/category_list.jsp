<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>院系列表</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
          crossorigin="anonymous">

    <style>
        body { background:#f6f7fb; }
        .page-wrap { max-width: 1100px; }
        .card-shadow { box-shadow: 0 10px 25px rgba(16,24,40,.08); border:0; }
        .section-hint { color:#6c757d; font-size:.9rem; }
        .table thead th { white-space: nowrap; }
        .table td, .table th { vertical-align: middle; }
        .userbar {
            background: #fff;
            border: 1px solid rgba(16,24,40,.08);
            border-radius: 12px;
            padding: 10px 12px;
            box-shadow: 0 10px 25px rgba(16,24,40,.06);
        }
        .userbar .user-name { color: #0f172a; font-weight: 600; }
        .userbar .user-meta { color: #64748b; font-size: .875rem; }
    </style>
</head>

<body>
<div class="container py-4 page-wrap">

    <div class="d-flex flex-wrap gap-2 align-items-center justify-content-between mb-3">
        <div>
            <h2 class="mb-1">院系列表</h2>
            <div class="section-hint">维护院系信息与启用状态</div>
        </div>

        <div class="d-flex gap-2">
            <a class="btn btn-primary"
               href="${pageContext.request.contextPath}/category/toAdd.do">新增院系</a>

            <a class="btn btn-outline-secondary"
               href="${pageContext.request.contextPath}/teacher/list.do">教师列表</a>
        </div>
    </div>

    <!-- 用户信息 + 登出（保持你现有写法不变） -->
    <div class="userbar d-flex align-items-center justify-content-between mb-3">
        <div class="user-meta">
            当前用户：
            <span class="user-name">
                ${sessionScope.loginUser.realName}
            </span>
            （${sessionScope.loginUser.username}）
        </div>

        <a class="btn btn-sm btn-outline-danger"
           href="${pageContext.request.contextPath}/logout.do">登出</a>
    </div>

    <div class="card card-shadow">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-striped table-hover mb-0">
                    <thead class="table-light">
                    <tr>
                        <th class="px-3">ID</th>
                        <th>名称</th>
                        <th class="px-3">状态</th>
                        <th class="px-3">操作</th>  <%-- 新增 --%>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${categories}" var="c">
                        <tr>
                            <td class="px-3 fw-semibold">${c.id}</td>
                            <td>${c.name}</td>
                            <td class="px-3">
                                <c:if test="${c.status == 1}">
                                    <span class="badge text-bg-success">启用</span>
                                </c:if>
                                <c:if test="${c.status == 0}">
                                    <span class="badge text-bg-secondary">停用</span>
                                </c:if>
                            </td>

                                <%-- 新增：修改按钮（不影响原有调用） --%>
                            <td class="px-3">
                                <a class="btn btn-sm btn-outline-primary"
                                   href="${pageContext.request.contextPath}/category/toEdit.do?id=${c.id}">
                                    修改
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
</body>
</html>
