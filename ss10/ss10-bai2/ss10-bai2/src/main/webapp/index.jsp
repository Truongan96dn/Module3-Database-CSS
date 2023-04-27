<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculator" method="get">
    <fieldset style="width: 20vw">
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>First operand :</td>
                <td><input type="text" name="first-operand"></td>
            </tr>
            <tr>
                <td>Operator :</td>
                <td>
                    <select name="operator" id="">
                        <option value="addition">+</option>
                        <option value="subtraction">-</option>
                        <option value="multiplication">X</option>
                        <option value="division">/</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand :</td>
                <td><input type="text" name="second-operand"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="submit">Calculate</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
<h2>Result : ${result}</h2>
</body>
</html>