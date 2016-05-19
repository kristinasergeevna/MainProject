<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div class="st1"><a href="/orders_list">Список заказов</a><a class="st2" href="/new_order">Создать
    заказ</a></div>

<c:choose>
    <c:when test="${empty list_of_users}">
        <div align="center">
            <h3><c:out value="There isn't users in database!"/></h3>
        </div>
    </c:when>
    <c:otherwise>
        <table main="st3">
            <thead>
            <tr>
                <th>Имя</th>
                <th>Фамилия</th>
                <th>Возраст</th>
                <th colspan="2">Действия</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list_of_users}" var="user">
                <tr>
                    <td width="200" height="100"><c:out value="${user.firstname}"/></td>
                    <td><c:out value="${user.lastname}"/></td>
                    <td><c:out value="${user.age}"/></td>
                    <td><a href="edit_user?id=${user.id}">Изменить</a></td>
                    <td><a href="delete_user?id=${user.id}">Удалить</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
<div class="st1"><a href="/new_user">Создать пользователя</a></div>
</body>
</html>
