<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户注册</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body{
            min-height: 100vh;
            background: radial-gradient(1200px circle at 10% 10%, #eef2ff, transparent 55%),
            radial-gradient(1200px circle at 90% 20%, #e8fff6, transparent 55%),
            #f6f7fb;
        }
        .page-wrap{ min-height: 100vh; display:flex; align-items:center; justify-content:center; padding: 24px; }
        .cardx{
            width: 100%;
            max-width: 460px;
            border: 0;
            border-radius: 14px;
            box-shadow: 0 18px 50px rgba(16,24,40,.12);
            background:#fff;
            overflow:hidden;
        }
        .cardx-hd{
            padding: 18px 20px;
            background: linear-gradient(135deg, rgba(13,110,253,.10), rgba(13,110,253,0));
            border-bottom: 1px solid rgba(16,24,40,.06);
        }
        .sub{ color:#6c757d; font-size: 13px; margin-top: 6px; }
        .help{ color:#6c757d; font-size: 12px; }
    </style>
</head>
<body>

<div class="page-wrap">
    <div class="cardx">
        <div class="cardx-hd">
            <h2 class="h5 m-0">用户注册</h2>
            <div class="sub">创建账号后即可登录系统</div>
        </div>

        <div class="p-4">

            <%
                String err = request.getParameter("err");
                if ("1".equals(err)) {
            %>
            <div class="alert alert-danger py-2" role="alert">
                用户名已存在，请换一个。
            </div>
            <%
                }
            %>

            <form action="${pageContext.request.contextPath}/register.do" method="post">
                <div class="mb-3">
                    <label class="form-label">账号（username）</label>
                    <input type="text" name="username" class="form-control" required>
                    <div class="help mt-1">建议使用英文/数字，注册后用于登录。</div>
                </div>

                <div class="mb-3">
                    <label class="form-label">密码（password）</label>
                    <input type="password" name="password" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">姓名（realName，可选）</label>
                    <input type="text" name="realName" class="form-control">
                </div>

                <button type="submit" class="btn btn-primary w-100">注册</button>
            </form>

            <div class="d-flex justify-content-between mt-3">
                <a class="link-secondary text-decoration-none"
                   href="${pageContext.request.contextPath}/index.jsp">返回登录</a>
            </div>

        </div>
    </div>
</div>

</body>
</html>
