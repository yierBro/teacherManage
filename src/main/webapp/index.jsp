<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>系统登录</title>

    <!-- Bootstrap CSS（只做样式，不影响后端调用） -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
          crossorigin="anonymous">

    <style>
        body{
            min-height: 100vh;
            background: radial-gradient(1200px circle at 10% 10%, #eef2ff, transparent 55%),
            radial-gradient(1200px circle at 90% 20%, #e8fff6, transparent 55%),
            #f6f7fb;
        }
        .page-wrap{ min-height: 100vh; display:flex; align-items:center; justify-content:center; padding: 24px; }
        .login-card{
            width: 100%;
            max-width: 420px;
            border: 0;
            border-radius: 14px;
            box-shadow: 0 18px 50px rgba(16,24,40,.12);
            overflow: hidden;
            background: #fff;
        }
        .login-card-header{
            padding: 18px 20px;
            background: linear-gradient(135deg, rgba(13,110,253,.10), rgba(13,110,253,0));
            border-bottom: 1px solid rgba(16,24,40,.06);
        }
        .login-title{ margin:0; font-size: 20px; letter-spacing: .5px; }
        .login-subtitle{ margin-top: 6px; color:#6c757d; font-size: 13px; }
        .login-card-body{ padding: 18px 20px 20px; }
        .form-label{ font-weight: 600; font-size: 14px; }
        .help-text{ color:#6c757d; font-size: 12px; }
        .btn-primary{ box-shadow: 0 10px 20px rgba(13,110,253,.18); }
        .link-muted{ color:#6c757d; text-decoration:none; }
        .link-muted:hover{ color:#0d6efd; text-decoration:underline; }
    </style>
</head>

<body>
<div class="page-wrap">

    <div class="login-card">
        <div class="login-card-header">
            <h2 class="login-title">系统登录</h2>
            <div class="login-subtitle">请输入账号与密码进入教师管理系统</div>
        </div>

        <div class="login-card-body">

            <!-- 登录失败提示（保留你原来的 err 参数逻辑，不改后端） -->
            <%
                String err = request.getParameter("err");
                if ("1".equals(err)) {
            %>
            <div class="alert alert-danger py-2 mb-3" role="alert">
                账号或密码错误，请重试。
            </div>
            <%
                }
            %>

            <!-- 可选：注册成功提示（不影响原有登录流程） -->
            <%
                String reg = request.getParameter("reg");
                if ("1".equals(reg)) {
            %>
            <div class="alert alert-success py-2 mb-3" role="alert">
                注册成功，请登录。
            </div>
            <%
                }
            %>

            <!-- 核心：form action 和字段名不变 -->
            <form action="${pageContext.request.contextPath}/login.do" method="post" autocomplete="on">
                <div class="mb-3">
                    <label class="form-label">账号</label>
                    <input type="text" name="username" class="form-control" placeholder="请输入账号" required>
                    <div class="help-text mt-1">示例：admin</div>
                </div>

                <div class="mb-3">
                    <label class="form-label">密码</label>
                    <input type="password" name="password" class="form-control" placeholder="请输入密码" required>
                </div>

                <button type="submit" class="btn btn-primary w-100">登录</button>
            </form>

            <div class="d-flex justify-content-between align-items-center mt-3">
                <!-- 新增：注册入口（不改你原有 login.do，只是多一个跳转） -->
                <a class="link-muted" href="${pageContext.request.contextPath}/toRegister.do">没有账号？去注册</a>

                <!-- 可选：回首页/帮助，不影响后端 -->
                <a class="link-muted" href="${pageContext.request.contextPath}/">返回</a>
            </div>

        </div>
    </div>

</div>

<!-- 纯样式不需要 JS；如果以后用 dismissible alert 再加 bundle -->
</body>
</html>
