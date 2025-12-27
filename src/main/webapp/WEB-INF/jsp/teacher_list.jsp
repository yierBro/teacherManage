<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>教师列表</title>

    <!-- Bootstrap CSS (仅样式，不影响后端功能) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
          crossorigin="anonymous"> <%-- CDN 片段来自 Bootstrap 官方文档 --%> <%-- [page:1] --%>

    <style>
        body { background: #f6f7fb; }
        .page-wrap { max-width: 1100px; }
        .page-title { letter-spacing: .5px; }
        .card-shadow { box-shadow: 0 10px 25px rgba(16, 24, 40, .08); border: 0; }
        .table thead th { white-space: nowrap; }
        .table td, .table th { vertical-align: middle; }
        .badge-soft {
            background: rgba(13,110,253,.10);
            color: #0d6efd;
            border: 1px solid rgba(13,110,253,.18);
        }
        .badge-soft-danger {
            background: rgba(220,53,69,.10);
            color: #dc3545;
            border: 1px solid rgba(220,53,69,.18);
        }
        /* 顶部用户栏：不影响原有功能，仅做排版美化 */
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
            <h2 class="mb-1 page-title">教师列表</h2>
            <div class="text-secondary small">查看、修改与维护教师信息</div>
        </div>

        <div class="d-flex gap-2">
            <!-- 原有功能链接不变，仅加按钮样式 -->
            <a class="btn btn-primary"
               href="${pageContext.request.contextPath}/teacher/toAdd.do">新增教师</a>
            <a class="btn btn-outline-secondary"
               href="${pageContext.request.contextPath}/category/list.do">院系列表</a>
        </div>
    </div>
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
                <table class="table table-hover table-striped mb-0 align-middle">
                    <thead class="table-light">
                    <tr>
                        <th class="px-3">ID</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>职称</th>
                        <th>状态</th>
                        <th>院系</th>
                        <th class="text-end px-3">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${teachers}" var="t">
                        <tr>
                            <td class="px-3 fw-semibold">${t.id}</td>
                            <td>${t.name}</td>

                            <td>
                                <c:if test="${t.sex == 1}">
                                    <span class="badge badge-soft">男</span>
                                </c:if>
                                <c:if test="${t.sex == 0}">
                                    <span class="badge text-bg-secondary">女</span>
                                </c:if>
                            </td>

                            <td>${t.workName}</td>

                            <td>
                                <c:if test="${t.status == 1}">
                                    <span class="badge text-bg-success">在职</span>
                                </c:if>
                                <c:if test="${t.status == 0}">
                                    <span class="badge badge-soft-danger">停聘</span>
                                </c:if>
                            </td>

                            <td>${t.cname}</td>

                            <td class="text-end px-3">
                                <!-- 原有功能链接不变，仅加按钮样式 -->
                                <a class="btn btn-sm btn-outline-primary"
                                   href="${pageContext.request.contextPath}/teacher/toEdit.do?id=${t.id}">修改</a>
                                <a class="btn btn-sm btn-outline-danger ms-1"
                                   href="${pageContext.request.contextPath}/teacher/delete.do?id=${t.id}">删除</a>
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