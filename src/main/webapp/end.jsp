<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 14.11.2022
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Конец игры</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <script src="<c:url value="jquery-3.6.0.min.js"/>"></script>
</head>

<body style="background-image: url('https://mdbootstrap.com/img/Photos/Others/images/62.jpg')">
<c:set var="answer" scope="page" value="<%= request.getParameter(\"answer\") %>"/>
<c:set var="currentPage" scope="page" value="${questions.get(pageNumber)}"/>


<c:if test="${answer.equals(\"accept\")}">
  <c:set var="gameOver" scope="page" value="Тебя вернули домой. Победа!"/>
</c:if>

<c:if test="${answer.equals(\"reject\")}">
  <c:set var="gameOver" scope="page" value="${currentPage.getEndGame()}"/>
</c:if>

<div class="container text-center">
  <div class="row justify-content-md-center">
    <h2>${gameOver}</h2>

    <div class="col-md-auto">
        <button type="submit" class="btn btn-primary" onclick="restart()">Попробовать еще раз</button>
    </div>


    <div class="fixed-bottom">
      <hr>
      <form id="info">
        <h2>Информация о пользователе:</h2>
        <p>IP address: ${ip}</p>
        <p>Игрок: ${name}</p>
        <p>Количество игр: ${gameCounter}</p>
        <p>Текущее время: ${time}</p>
      </form>
    </div>
  </div>
</div>

<script>
    function restart() {
        $.ajax({
            type: 'POST',
            url: '/restart',
            contentType: 'application/json;charset=UTF-8',
            success: function(){
                window.location = "/login.jsp";
            },
            error: function(xhr, type) {
                alert("ajax error response type " + type);
            }
        });
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>
