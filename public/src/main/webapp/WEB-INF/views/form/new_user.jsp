<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Новый пользователь</title>
    <style>
        .error {
            color: red;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/style.css"/>
</head>
<body>
<div class="container">
    <header>
        <h1><span>Создание нового пользователя</span></h1>
    </header>
    <section>
        <div id="container_demo">
            <div id="wrapper">
                <div id="login" class="animate form">

                    <form:form action="/new_user" modelAttribute="user" method="post" autocomplete="on">
                        <table class="st3">
                            <thead>

                                <th>
                        <p>
                            <label for="usernamesignup" data-icon="u">ИМЯ</label>
                            <form:input id="usernamesignup" path="firstname" type="text"
                                        />
                            <form:errors path="firstname" cssClass="error"/>
                        </p>
                                </th>
                        <p>
                            <th>
                            <label for="lastnamesignup" data-icon="u">ФАМИЛИЯ</label>
                            <form:input id="lastnamesignup" path="lastname" type="text" />
                            <form:errors path="lastname" cssClass="error"/>
                            </th>
                        </p>

                        <p>
                            <th>
                            <label for="agesignup">ВОЗРАСТ</label>
                            <form:input id="agesignup" path="age" type="number"/>
                            <form:errors path="age" cssClass="error"/>
                                </th>
                                <th>
                        </p>

                        <p class="signin button">
                            <input type="submit" value="Создать"/>
                        </p>
                                </th>
                                <br>
                                <th>
                        <p class="change_link">

                            <a href="/users_list" class="to_register"> Отмена </a>
                        </p>
                                </th>
                            </thead>
                            <tbody>
                    </form:form>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>
