
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Credit</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">


</head>
<body class="bg-light">

<div class="container py-4">
    <main>
        <header class="d-flex justify-content-center py-3">
            <ul class="nav nav-pills">
                <li class="nav-item"><a href="/" class="nav-link" aria-current="page">Главная</a></li>
                <li class="nav-item"><a href="/credit-processing/step-1" class="nav-link active bg-dark">Оформить заявку</a></li>
                <li class="nav-item"><a href="/creditApplications_list" class="nav-link">Список заявок</a></li>
                <li class="nav-item"><a href="/creditContracts_list" class="nav-link">Список договоров</a></li>
                <li class="nav-item"><a href="/clients_list" class="nav-link">Список клиентов</a></li>
            </ul>
        </header>

        <div class="text-center">
            <h2>Создание заявки на кредит</h2>
        </div>

        <div class="row g-5">
            <div>
                <h4 class="mb-3">Основные</h4>

                <c:url value="/credit-processing/step-1" var="var"/>
                <form class="needs-validation" action="${var}" method="post" novalidate>
                    <div class="row g-3">
                        <div class="col-12">
                            <label for="fullName" class="form-label">ФИО</label>
                            <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Фамилия Имя Отчество" value="">
                            <div style="color: red">
                                ${bindingResult.getFieldError('fullName').defaultMessage}
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <label for="passportSerial" class="form-label">Серия паспорта</label>
                            <input type="text" class="form-control" id="passportSerial" name="passportSerial" placeholder="****" value="">
                            <div style="color: red">
                                ${bindingResult.getFieldError('passportSerial').defaultMessage}
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <label for="passportNumber" class="form-label overflow-hidden">Номер паспорта</label>
                            <input type="text" class="form-control" id="passportNumber" name="passportNumber" placeholder="******" value="">
                            <div style="color: red">
                                ${bindingResult.getFieldError('passportNumber').defaultMessage}
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="maritalStatus" class="form-label">Семейное положение</label>
                            <select class="form-select" id="maritalStatus" name="maritalStatus">
                                <option value="1">В браке</option>
                                <option value="0">Не в браке</option>
                            </select>
                        </div>

                        <div class="col-12">
                            <label for="registrationAddress" class="form-label">Адрес прописки</label>
                            <input type="text" class="form-control" id="registrationAddress" name="registrationAddress" placeholder="Волгоградская обл., г. Волгоград, ул. Садовая, д. 5, кв. 23">
                            <div style="color: red">
                                ${bindingResult.getFieldError('registrationAddress').defaultMessage}
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="contactNumber" class="form-label">Контактный телефон</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text">+7</span>
                                <input type="text" class="form-control" id="contactNumber" name="contactNumber" placeholder="**********">
                                <div style="color: red">
                                    ${bindingResult.getFieldError('contactNumber').defaultMessage}
                                </div>
                            </div>
                        </div>

                        <hr class="my-4">

                        <h4 class="mb-3">Сведения о занятости</h4>

                        <div class="col-md-5">
                            <label for="companyName" class="form-label">Название организации</label>
                            <input type="text" class="form-control" id="companyName" name="companyName" placeholder="Организация">
                            <div style="color: red">
                                ${bindingResult.getFieldError('companyName').defaultMessage}
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label for="post" class="form-label">Должность</label>
                            <input type="text" class="form-control" id="post" name="post" placeholder="Должность">
                            <div style="color: red">
                                ${bindingResult.getFieldError('post').defaultMessage}
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="workPeriod" class="form-label">Период работы(месяцев)</label>
                            <input type="number" class="form-control" id="workPeriod" name="workPeriod" placeholder="*" value="1">
                            <div style="color: red">
                                ${bindingResult.getFieldError('workPeriod').defaultMessage}
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <h4 class="mb-3">Желаемая сумма кредита</h4>

                    <div class="col-md-5">
                        <input type="number" class="form-control" id="desiredCreditAmount" name="desiredCreditAmount"
                               placeholder="Сумма" value="5000">
                        <div style="color: red">
                            ${bindingResult.getFieldError('desiredCreditAmount').defaultMessage}
                        </div>
                    </div>

                    <hr class="my-4">

                    <button class="w-100 btn btn-xs btn-outline-dark" type="submit">Отправить заявку</button>

                </form>
            </div>
        </div>
    </main>


</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>
