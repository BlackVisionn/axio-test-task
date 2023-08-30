
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Applications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<div class="container py-4">
    <header class="d-flex justify-content-center py-3">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/" class="nav-link" aria-current="page">Главная</a></li>
            <li class="nav-item"><a href="/credit-processing/step-1" class="nav-link">Оформить заявку</a></li>
            <li class="nav-item"><a href="/creditApplications_list" class="nav-link active bg-dark">Список заявок</a></li>
            <li class="nav-item"><a href="/creditContracts_list" class="nav-link">Список договоров</a></li>
            <li class="nav-item"><a href="/clients_list" class="nav-link">Список клиентов</a></li>
        </ul>
    </header>

    <main>
        <div class="text-center">
            <h2>Заявки на кредит</h2>
        </div>

        <div class="table-responsive">
            <table class="table text-center">
                <thead class="table-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Клиент</th>
                    <th scope="col">Желаемая сумма кредита</th>
                    <th scope="col">Статус одобрения</th>
                    <th scope="col">Действие</th>
                </tr>
                </thead>
                <tbody class="table-group-divider">
                <c:forEach var="creditApplication" items="${creditApplicationsList}">
                    <tr>
                        <th scope="row">${creditApplication.id}</th>
                        <td>
                            <a href="/clients_list/${creditApplication.client.id}">
                                    ${creditApplication.client}
                            </a>
                        </td>
                        <td>${creditApplication.desiredCreditAmount}</td>
                        <td>
                            <c:if test="${creditApplication.approvedCreditDecision != null}">Одобрен</c:if>
                            <c:if test="${creditApplication.approvedCreditDecision == null}">Не одобрен</c:if>
                        </td>
                        <td>
                            <a class="btn btn-xs btn-outline-dark" href="/creditApplications_list/${creditApplication.id}">Подробнее</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </main>


</div>
</body>
</html>

