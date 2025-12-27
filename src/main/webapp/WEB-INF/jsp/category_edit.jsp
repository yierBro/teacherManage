<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>编辑院系</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body { background:#f6f7fb; }
        .page-wrap { max-width: 900px; }
        .card-shadow { box-shadow: 0 10px 25px rgba(16,24,40,.08); border:0; }
    </style>
</head>

<body>
<div class="container py-4 page-wrap">

    <div class="d-flex align-items-center justify-content-between mb-3">
        <div>
            <h2 class="mb-1">编辑院系</h2>
            <div class="text-secondary small">修改院系名称与状态</div>
        </div>
        <a class="btn btn-outline-secondary"
           href="${pageContext.request.contextPath}/category/list.do">返回列表</a>
    </div>

    <div class="card card-shadow">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/category/edit.do" method="post">
                <input type="hidden" name="id" value="${category.id}"/>

                <div class="mb-3">
                    <label class="form-label">院系名称</label>
                    <input class="form-control" type="text" name="name" value="${category.name}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">状态</label>
                    <select class="form-select" name="status">
                        <option value="1" <c:if test="${category.status == 1}">selected</c:if>>启用</option>
                        <option value="0" <c:if test="${category.status == 0}">selected</c:if>>停用</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">保存</button>
                <a class="btn btn-outline-secondary ms-2"
                   href="${pageContext.request.contextPath}/category/list.do">取消</a>
            </form>
        </div>
    </div>

</div>
</body>
</html>