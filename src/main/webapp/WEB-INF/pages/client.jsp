
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Client ${client.id}</title>
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
        <h2 class="my-3">
            Клиент ${client.id}
        </h2>

        <div class="my-3 p-3 bg-body rounded shadow-sm">
            <h6 class="border-bottom pb-2 mb-0">Основные</h6>
            <div class="d-flex text-muted pt-3">
                <p class="pb-3 mb-0 lh-sm border-bottom">
                    <strong class="d-block text-black">ФИО</strong>
                    ${client.fullName}
                </p>
            </div>

            <div class="d-flex text-muted pt-3">
                <p class="pb-3 mb-0 lh-sm border-bottom">
                    <strong class="d-block text-black">Паспорт</strong>
                    Серия: ${client.passportSerial} Номер: ${client.passportNumber}
                </p>
            </div>
            <div class="d-flex text-muted pt-3">
                <p class="pb-3 mb-0 lh-sm border-bottom">
                    <strong class="d-block text-black">Семейное положение</strong>
                    <c:if test="${client.maritalStatus}">В браке</c:if>
                    <c:if test="${!client.maritalStatus}">Не в браке</c:if>
                </p>
            </div>
            <div class="d-flex text-muted pt-3">
                <p class="pb-3 mb-0 lh-sm border-bottom">
                    <strong class="d-block text-black">Адрес прописки</strong>
                    ${client.registrationAddress}
                </p>
            </div>
            <div class="d-flex text-muted pt-3">
                <p class="pb-3 mb-0 lh-sm border-bottom">
                    <strong class="d-block text-black">Контактный номер</strong>
                    +7${client.contactNumber}
                </p>
            </div>
        </div>

        <div class="my-3 p-3 bg-body rounded shadow-sm">
            <h6 class="border-bottom pb-2 mb-0">Сведения о занятости</h6>
            <div class="d-flex text-muted pt-3">
                <p class="pb-3 mb-0 lh-sm border-bottom">
                    <strong class="d-block text-black">Название организации</strong>
                    ${client.companyName}
                </p>
            </div>
            <div class="d-flex text-muted pt-3">
                <p class="pb-3 mb-0 lh-sm border-bottom">
                    <strong class="d-block text-black">Должность</strong>
                    ${client.post}
                </p>
            </div>
            <div class="d-flex text-muted pt-3">
                <p class="pb-3 mb-0 lh-sm border-bottom">
                    <strong class="d-block text-black">Период работы(месяцев)</strong>
                    ${client.workPeriod}
                </p>
            </div>
        </div>
    </main>

</div>

</body>
</html>

