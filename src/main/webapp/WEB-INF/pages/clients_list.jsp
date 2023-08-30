
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Clients</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>

<div class="container py-4">
    <header class="d-flex justify-content-center py-3">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/" class="nav-link" aria-current="page">Главная</a></li>
            <li class="nav-item"><a href="/credit-processing/step-1" class="nav-link">Оформить заявку</a></li>
            <li class="nav-item"><a href="/creditApplications_list" class="nav-link">Список заявок</a></li>
            <li class="nav-item"><a href="/creditContracts_list" class="nav-link">Список договоров</a></li>
            <li class="nav-item"><a href="/clients_list" class="nav-link active bg-dark">Список клиентов</a></li>
        </ul>
    </header>

    <main>
        <div class="text-center">
            <h2>Список клиентов</h2>
        </div>

        <form action="/clients_list" method="post" class="col-sm-6 mx-auto text-center">
            <div class="row g-3">
                <div class="col-md-5">
                    <select class="form-select" id="searchType" name="searchType" required>
                        <option value="0">По ФИО</option>
                        <option value="1">По номеру телефона</option>
                        <option value="2">По паспортным данным</option>
                    </select>
                </div>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="searchingValue" name="searchingValue" placeholder="Поиск"
                           value="">
                    <button class="btn btn-outline-dark" type="submit">Найти</button>
                </div>

<%--                <div class="col-md-4">--%>
<%--                    <input type="text" class="form-control-outline-dark" id="searchingValue" name="searchingValue" placeholder="Поиск"--%>
<%--                           value="">--%>
<%--                </div>--%>

<%--                <div class="col-md-3">--%>
<%--                    <button class="w-100 btn btn-xs btn-outline-dark" type="submit">Найти</button>--%>
<%--                </div>--%>
            </div>
        </form>


        <hr class="my-4">

        <div class="table-responsive">
            <table class="table text-center">
                <thead class="table-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ФИО</th>
                    <th scope="col">Паспорт</th>
                    <th scope="col">Контактный телефон</th>
                    <th scope="col">Адрес прописки</th>
                    <th scope="col">Действие</th>
                </tr>
                </thead>
                <tbody class="table-group-divider">
                <c:forEach var="client" items="${clientsList}">
                    <tr>
                        <th scope="row">${client.id}</th>
                        <td>${client.fullName}</td>
                        <td>${client.passportSerial} ${client.passportNumber}</td>
                        <td>+7${client.contactNumber}</td>
                        <td>${client.registrationAddress}</td>
                        <td>
                            <a class="btn btn-xs btn-outline-dark" href="/clients_list/${client.id}">Подробнее</a>
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
