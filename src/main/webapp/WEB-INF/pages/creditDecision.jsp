
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Credit Decision</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>

<div class="container py-4">
    <header class="d-flex justify-content-center py-3">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/" class="nav-link" aria-current="page">Главная</a></li>
            <li class="nav-item"><a href="/credit-processing/step-1" class="nav-link active bd-dark">Оформить заявку</a></li>
            <li class="nav-item"><a href="/creditApplications_list" class="nav-link">Список заявок</a></li>
            <li class="nav-item"><a href="/creditContracts_list" class="nav-link">Список договоров</a></li>
            <li class="nav-item"><a href="/clients_list" class="nav-link">Список клиентов</a></li>
        </ul>
    </header>

    <main>

        <div class="row g-5">
            <div class="row g-3">
                <c:if test="${creditDecision == null}">
                    <h4 class="mb-3" style="color: red">Кредит не одобрен</h4>
                </c:if>

                <c:if test="${creditDecision != null}">
                    <h4 class="mb-3" style="color: green">Кредит одобрен</h4>

                    <a class="btn btn-xs btn-outline-dark" href="/credit-processing/step-3" role="button">Оформить кредитный договор</a>
                </c:if>
            </div>
        </div>
    </main>

</div>
</body>
</html>

