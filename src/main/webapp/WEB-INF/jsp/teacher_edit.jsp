<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>编辑教师</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
          crossorigin="anonymous"> <%-- Bootstrap 官方文档提供 CDN 方式 [page:1] --%>

    <style>
        body { background:#f6f7fb; }
        .page-wrap { max-width: 920px; }
        .card-shadow { box-shadow: 0 10px 25px rgba(16,24,40,.08); border:0; }
        .section-hint { color:#6c757d; font-size:.9rem; }
    </style>
</head>

<body>
<div class="container py-4 page-wrap">

    <div class="d-flex align-items-start justify-content-between gap-2 mb-3">
        <div>
            <h2 class="mb-1">编辑教师</h2>
            <div class="section-hint">修改后点击保存，信息将提交到后台更新</div>
        </div>

        <!-- 返回链接不变，仅换样式 -->
        <a class="btn btn-outline-secondary"
           href="${pageContext.request.contextPath}/teacher/list.do">返回教师列表</a>
    </div>

    <div class="card card-shadow">
        <div class="card-body p-4 p-md-4">

            <form action="${pageContext.request.contextPath}/teacher/update.do" method="post">
                <!-- hidden 字段不变 -->
                <input type="hidden" name="id" value="${teacher.id}"/>

                <div class="row g-3">
                    <div class="col-12 col-md-6">
                        <label class="form-label">姓名</label>
                        <input type="text" class="form-control" name="name" value="${teacher.name}"/>
                    </div>

                    <div class="col-12 col-md-6">
                        <label class="form-label d-block">性别</label>

                        <!-- Bootstrap radios：使用 .form-check / .form-check-input / .form-check-label [web:22] -->
                        <div class="d-flex gap-4">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="sex" value="1" id="sex_m"
                                       <c:if test="${teacher.sex == 1}">checked="checked"</c:if>/>
                                <label class="form-check-label" for="sex_m">男</label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="sex" value="0" id="sex_f"
                                       <c:if test="${teacher.sex == 0}">checked="checked"</c:if>/>
                                <label class="form-check-label" for="sex_f">女</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <label class="form-label">职称</label>
                        <input type="text" class="form-control" name="workName" value="${teacher.workName}"/>
                    </div>

                    <div class="col-12 col-md-6">
                        <label class="form-label d-block">状态</label>
                        <div class="d-flex gap-4">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" value="1" id="st_on"
                                       <c:if test="${teacher.status == 1}">checked="checked"</c:if>/>
                                <label class="form-check-label" for="st_on">在职</label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" value="0" id="st_off"
                                       <c:if test="${teacher.status == 0}">checked="checked"</c:if>/>
                                <label class="form-check-label" for="st_off">停聘</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <label class="form-label">院系</label>

                        <!-- Bootstrap select：给 select 加 .form-select [web:33] -->
                        <select class="form-select" name="cid">
                            <c:forEach items="${categories}" var="c">
                                <option value="${c.id}" <c:if test="${c.id == teacher.cid}">selected="selected"</c:if>>
                                        ${c.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-12 d-flex gap-2 pt-2">
                        <input type="submit" class="btn btn-primary" value="保存修改"/>
                        <a class="btn btn-light"
                           href="${pageContext.request.contextPath}/teacher/list.do">取消</a>
                    </div>
                </div>
            </form>

        </div>
    </div>

</div>
</body>
</html>