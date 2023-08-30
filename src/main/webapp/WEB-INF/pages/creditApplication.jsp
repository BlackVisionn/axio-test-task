
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Application ${creditApplication.id}</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>

<div class="container py-4">
    <header class="d-flex justify-content-center py-3">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/" class="nav-link" aria-current="page">Главная</a></li>
            <li class="nav-item"><a href="/credit-processing/step-1" class="nav-link">Оформить заявку</a></li>
            <li class="nav-item"><a href="/clients_list" class="nav-link">Список клиентов</a></li>
            <li class="nav-item"><a href="/creditApplications_list" class="nav-link">Список заявок</a></li>
            <li class="nav-item"><a href="/creditContracts_list" class="nav-link">Список договоров</a></li>
        </ul>
    </header>

    <main>

        <div class="text-center">
            <h2>Заявка на кредит ${creditApplication.id}</h2>
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
                    <p class="form-control">${crditApplication.client.workPeriod}</p>
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

                <c:if test="${creditApplication.approvedCreditDecision == null}">
                    <h4 class="mb-3" style="color: red">Кредит не одобрен</h4>
                </c:if>
            </div>
        </div>
    </main>


</div>
</body>
</html>
