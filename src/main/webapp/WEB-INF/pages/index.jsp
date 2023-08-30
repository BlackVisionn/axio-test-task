
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>АРМ manager</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/features/">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<main>
    <div class="container px-4 py-5" id="featured-3">
        <h2 class="pb-2 border-bottom">АРМ менеджер по оформлению кредита</h2>
        <div class="row g-4 py-5 row-cols-1">
            <div class="feature col">
                <h2>Оформление заявки на кредит</h2>
                <p>Оформите заявку на кредит</p>
                <a href="/credit-processing/step-1" class="icon-link d-inline-flex align-items-center">
                    Перейти к оформлению заявки на кредит
                </a>
            </div>
            <div class="feature col">
                <h2>Список заявок на кредит</h2>
                <p>Просмотреть список заявок на кредит со статусом одобрения</p>
                <a href="/creditApplications_list" class="icon-link d-inline-flex align-items-center">
                    Перейти к просмотру заявок
                </a>
            </div>
            <div class="feature col">
                <h2>Список кредитных договоров</h2>
                <p>Просмотреть список кредитных договоров со статусом подписания</p>
                <a href="/creditContracts_list" class="icon-link d-inline-flex align-items-center">
                    Перейти к просмотру договоров
                </a>
            </div>
            <div class="feature col">
                <h2>Список клиентов</h2>
                <p>Просмотреть список клиентов</p>
                <a href="/clients_list" class="icon-link d-inline-flex align-items-center">
                    Перейти к просмотру клиентов
                </a>
            </div>
        </div>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</body>
</html>
