<%--
  Created by IntelliJ IDEA.
  User: lekha
  Date: 03.02.2023
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Credit contracts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<div class="container py-4">
    <header class="d-flex justify-content-center py-3">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/" class="nav-link" aria-current="page">Главная</a></li>
            <li class="nav-item"><a href="/credit-processing/step-1" class="nav-link">Оформить заявку</a></li>
            <li class="nav-item"><a href="/creditApplications_list" class="nav-link">Список заявок</a></li>
            <li class="nav-item"><a href="/creditContracts_list" class="nav-link active bg-dark">Список договоров</a></li>
            <li class="nav-item"><a href="/clients_list" class="nav-link">Список клиентов</a></li>
        </ul>
    </header>

    <main>
        <div class="text-center">
            <h2>Подписанные договоры</h2>
        </div>

        <div class="table-responsive">
            <table class="table text-center">
                <thead class="table-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Заявка</th>
                    <th scope="col">Одобренная сумма кредита</th>
                    <th scope="col">Срок оплаты</th>
                    <th scope="col">Статус подписания</th>
                </tr>
                </thead>
                <tbody class="table-group-divider">
                <c:forEach var="creditContract" items="${creditContractsList}">
                    <tr>
                        <th scope="row">${creditContract.id}</th>
                        <td>
                            <a href="/creditApplications_list/${creditContract.creditApplicationEntity.id}">
                                Кредитная заявка ${creditContract.creditApplicationEntity.id}
                            </a>
                        </td>
                        <td>${creditContract.creditApplicationEntity.approvedCreditDecision.approvedCreditAmount}</td>
                        <td>${creditContract.creditApplicationEntity.approvedCreditDecision.creditMaturity}</td>
                        <td>
                            <c:if test="${creditContract.creditApplicationEntity.client.maritalStatus}">Подписан</c:if>
                            <c:if test="${!creditContract.creditApplicationEntity.client.maritalStatus}">Не подписан</c:if>
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

