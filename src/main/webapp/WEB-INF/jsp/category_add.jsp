<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新增院系</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
          crossorigin="anonymous">

    <style>
        /* 1. 全局微调 */
        body {
            background: #f6f7fb;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
        }

        /* 2. 主容器 */
        .page-wrap {
            max-width: 920px;
        }

        /* 3. 卡片 */
        .card-shadow {
            border: 0;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(16, 24, 40, .06);
            transition: box-shadow .25s;
        }
        .card-shadow:hover {
            box-shadow: 0 12px 40px rgba(16, 24, 40, .1);
        }

        /* 4. 标题区 */
        .section-hint {
            color: #6c757d;
            font-size: .9rem;
            letter-spacing: .3px;
        }

        /* 5. 表单元素 */
        .form-control {
            border-radius: 8px;
            border: 1px solid #dee2e6;
            transition: border-color .2s, box-shadow .2s;
        }
        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 .2rem rgba(13, 110, 253, .15);
        }

        /* 6. 单选 */
        .form-check-input {
            margin-top: .125em;
        }
        .form-check-label {
            cursor: pointer;
            user-select: none;
        }

        /* 7. 按钮 */
        .btn {
            border-radius: 8px;
            font-weight: 500;
            padding: .45rem 1.1rem;
        }
        .btn-primary {
            background: #0d6efd;
            border: 0;
            transition: background .2s;
        }
        .btn-primary:hover {
            background: #0b5ed7;
        }
        .btn-light {
            background: #e9ecef;
            border: 0;
            color: #495057;
        }
        .btn-light:hover {
            background: #dee2e6;
        }

        /* 8. 响应式小屏 */
        @media (max-width: 576px) {
            .card-body {
                padding: 1.5rem !important;
            }
            .d-flex.gap-2 {
                gap: .5rem !important;
            }
        }
    </style>
</head>

<body>
<div class="container py-4 page-wrap">

    <div class="d-flex align-items-start justify-content-between gap-2 mb-3">
        <div>
            <h2 class="mb-1">新增院系</h2>
            <div class="section-hint">填写院系名称并选择状态后保存</div>
        </div>

        <div class="d-flex gap-2">
            <a class="btn btn-primary"
               href="${pageContext.request.contextPath}/category/list.do">查看院系列表</a>
            <a class="btn btn-outline-secondary"
               href="${pageContext.request.contextPath}/teacher/list.do">教师列表</a>
        </div>
    </div>

    <div class="card card-shadow">
        <div class="card-body p-4 p-md-4">

            <form action="${pageContext.request.contextPath}/category/add.do" method="post">
                <div class="row g-3">
                    <div class="col-12">
                        <label class="form-label">院系名称</label>
                        <input type="text" class="form-control" name="name" placeholder="请输入院系名称">
                    </div>

                    <div class="col-12">
                        <label class="form-label d-block">状态</label>

                        <!-- Bootstrap radios：form-check 结构（仅样式，不改 name/value/checked）[web:22] -->
                        <div class="d-flex gap-4">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" value="1"
                                       id="st_on" checked="checked">
                                <label class="form-check-label" for="st_on">启用</label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" value="0"
                                       id="st_off">
                                <label class="form-check-label" for="st_off">停用</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 d-flex gap-2 pt-2">
                        <input type="submit" class="btn btn-primary" value="保存">
                        <a class="btn btn-light"
                           href="${pageContext.request.contextPath}/category/list.do">取消</a>
                    </div>
                </div>
            </form>

        </div>
    </div>

</div>
</body>
</html>
