
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Credit Contract</title>

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
            <li class="nav-item"><a href="/clients_list" class="nav-link">Список клиентов</a></li>
        </ul>
    </header>

    <main>

        <div class="text-center">
            <h2>Кредитный договор</h2>
        </div>

        <div class="row g-5">
            <div class="row g-3">
                <div class="col-12">
                    <label class="form-label">ФИО</label>
                    <p class="form-control">${creditApplication.client.fullName}</p>
                </div>

                <div class="col-sm-6">
                    <label class="form-label">Серия паспорта</label>
                    <p class="form-control">${creditApplication.client.passportSerial}</p>
                </div>

                <div class="col-sm-6">
                    <label class="form-label">Номер паспорта</label>
                    <p class="form-control">${creditApplication.client.passportNumber}</p>
                </div>

                <div class="col-12">
                    <label class="form-label">Семейное положение</label>
                    <p class="form-control">
                        <c:if test="${creditApplication.client.maritalStatus}">В браке</c:if>
                        <c:if test="${!creditApplication.client.maritalStatus}">Не в браке</c:if>
                    </p>
                </div>

                <div class="col-12">
                    <label class="form-label">Адрес прописки</label>
                    <p class="form-control">${creditApplication.client.registrationAddress}</p>
                </div>

                <div class="col-12">
                    <label class="form-label">Контактный номер</label>
                    <p class="form-control">+7${creditApplication.client.contactNumber}</p>
                </div>

                <hr class="my-4">

                <h4 class="mb-3">Сведения о занятости</h4>

                <div class="col-md-5">
                    <label class="form-label">Название организации</label>
                    <p class="form-control">${creditApplication.client.companyName}</p>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Должность</label>
                    <p class="form-control">${creditApplication.client.post}</p>
                </div>

                <div class="col-md-3">
                    <label class="form-label">Период работы(месяцев)</label>
                    <p class="form-control">${creditApplication.client.workPeriod}</p>
                </div>

                <hr class="my-4">

                <h4 class="mb-3">Желаемая сумма кредита</h4>

                <div class="col-md-5">
                    <p class="form-control">${creditApplication.desiredCreditAmount}</p>
                </div>

                <hr class="my-4">

                <c:if test="${creditApplication.approvedCreditDecision != null}">
                    <h4 class="mb-3" style="color: green">Кредит одобрен</h4>

                    <div class="col-md-5">
                        <label class="form-label">Предложенный срок в днях</label>
                        <p class="form-control">${creditApplication.approvedCreditDecision.creditMaturity}</p>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Одобренная сумма кредита</label>
                        <p class="form-control">${creditApplication.approvedCreditDecision.approvedCreditAmount}</p>
                    </div>
                </c:if>

                <hr class="my-4">

                <form action="/credit-processing/step-3" method="post">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="signingStatus" id="signStatus1" value="0">
                        <label class="form-check-label" for="signStatus1">
                            Не подписывать
                        </label>
                    </div>
                    <div class="form-check ">
                        <input class="form-check-input" type="radio" name="signingStatus" id="signStatus2" value="1" checked>
                        <label class="form-check-label" for="signStatus2">
                            Подписать
                        </label>
                    </div>

                    <hr class="my-4">

                    <button class="w-100 btn btn-xs btn-outline-dark" type="submit">Отправить договор</button>
                </form>
            </div>
        </div>
    </main>

</div>
</body>
</html>

