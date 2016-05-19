<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <title>Новый заказ</title>
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
    <h1><span>Создание нового заказа</span>  </h1>
  </header>
  <section>
    <div id="container_demo" >
      <div id="wrapper">
        <div id="login" class="animate form">

          <form:form  action="/new_order" modelAttribute="order" method="post" autocomplete="on">
            <table class="st3">
              <thead>

              <th>
            <p>
              <label for="ordname">НАИМЕНОВАНИЕ ПРОДУКТА</label>
              <form:input id="ordname" path="name" type="text" placeholder="Apple" />
              <form:errors path="name" cssClass="error"/>
            </p>
              </th>
              <th>
            <p>
              <label>ИМЯ ПОЛЬЗОВАТЕЛЯ</label>
              <form:select path="user.id">

                <form:options items="${list_of_users}" itemLabel="firstname" itemValue="id"/>

              </form:select>
            </p>
              </th>
              <th>
            <p>
              <label for="prices"  >ЦЕНА</label>
              <form:input id="prices" path="price" type="number"   />
              <form:errors path="price" cssClass="error"/>
            </p>
              </th>
              <th>
            <p class="signin button">
              <input type="submit" value="Создать"/>
            </p>
              </th>
              <br>
              <th>
            <p class="change_link">

              <a href="/users_list" class="to_register">  Отмена </a>
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

