<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <title>Редактирование заказа</title>
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
    <h1><span>Редактирование заказа</span>  </h1>
  </header>

  <section>
    <div id="container_demo" >
      <div id="wrapper">
        <div id="login" class="animate form">

          <form:form  action="/edit_order" modelAttribute="order" method="post" autocomplete="on">
            <table class="st3">
              <thead>


            <form:hidden path="id" value="${f_order.id}"/>
            <th>
            <p>
              <label for="orders" >НАИМЕНОВАНИЕ ПРОДУКТА</label>
              <form:input id="orders" path="name" type="text" value="${f_order.name}" />
              <form:errors path="name" cssClass="error"/>
            </p>
            </th>
            <form:hidden path="id" value="${order.id}"/>
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
              <form:input id="prices" path="price" type="number" value="${f_order.price}" />
              <form:errors path="price" cssClass="error"/>
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
