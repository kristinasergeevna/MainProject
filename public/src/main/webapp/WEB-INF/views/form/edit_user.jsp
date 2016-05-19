<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <title>Редактирование пользователя</title>
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
    <h1><span>Редактирование пользователя</span>  </h1>
  </header>
  <section>
    <div id="container_demo" >
      <div id="wrapper">
        <div id="login" class="animate form">
          <form:form  action="/edit_user" modelAttribute="user" method="post" autocomplete="on">
            <table class="st3">
              <thead>

              <th>
            <p>
              <label for="usernames"  data-icon="u">ИМЯ</label>
              <form:input id="usernames" path="firstname"  type="text" value="${f_user.firstname}" />
              <form:errors path="firstname" cssClass="error"/>
            </p>
              </th>

              <form:hidden path="id" value="${f_user.id}"/>
            <p>
              <th>
              <label for="lastnames" data-icon="u">ФАМИЛИЯ</label>
              <form:input id="lastnames" path="lastname" type="text" value="${f_user.lastname}" />
              <form:errors path="lastname" cssClass="error"/>
              </th>
            </p>
            <p>
              <th>
              <label for="ages"  >ВОЗРАСТ</label>
              <form:input id="ages" path="age" type="number" value="${f_user.age}" />
              <form:errors path="age" cssClass="error"/>
              </th>
            </p>
              <th>
            <p class="signin button">
              <input type="submit" value="Сохранить"/>

            </p>
              </th>
              <br>
              <th>
            <p class="change_link">

              <a href="/orders_list" class="to_register">  Отмена </a>
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
