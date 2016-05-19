<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>List of orders</title>
</head>
<body>
<div class="st1"><a href="/users_list">Список пользователей</a><a class="st2" href="/new_order">Создать
  заказ</a></div>

<c:choose>
  <c:when test="${empty list_of_orders}">
    <div align="center">
      <h3><c:out value="There isn't orders in database!"/></h3>
    </div>
  </c:when>
  <c:otherwise>
    <table class="st3">
      <thead>
      <tr>
        <th>Наименование</th>
        <th>Пользователь</th>
        <th>Цена</th>
        <th colspan="2">Действия</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${list_of_orders}" var="order">
        <tr>
          <td width="200" height="100"><c:out value="${order.name}"/></td>
          <td><c:out value="${order.user.firstname}"/></td>
          <td><c:out value="${order.price}"/></td>
          <td><a href="edit_order?id=${order.id}">Изменить</a></td>
          <td><a href="delete_order?id=${order.id}">Удалить</a></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </c:otherwise>
</c:choose>
<div class="st1"><a href="/new_order">Создать заказ</a></div>
</body>
</html>
