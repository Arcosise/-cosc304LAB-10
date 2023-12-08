<!DOCTYPE html>
<html>
<head>
    
<title>Product List</title>
<style>
    body {
        background-color: pink;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;

        text-align: center; 
        min-height: 130vh;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        border: 1px solid black; 
    }
    th, td {
        border: 1px solid black; 
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #ffc0cb; 
    }
    .custom-button, .custom-button-link, .custom-link-button {
        padding: 10px 20px;
        background-color: #0a73e3;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        text-decoration: none;
        display: inline;
        margin: 10px;
        font-size: 16px;
        text-align: center;
    }
    form {
    display: inline; 
    }
    .custom-button:hover, .custom-button-link:hover, .custom-link-button:hover {
        background-color: #0056b3;
    }
    .button-container {
        text-align: center; 
        margin-top: 20px;
    }
</style>
</head>


<body>
    <div style="position: absolute; top: 5; right: 5; padding: 10px;">
        <h1>Product List:</h1>
        <form action="addProductCheck.jsp" method="get">
            <button type="submit" class="custom-button">Add Product</button>
        </form>
<%@ include file="auth.jsp"%>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.sql.*,java.net.URLEncoder" %>


<%
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
String uid = "sa"; 
String pw = "304#sa#pw";

try (Connection con = DriverManager.getConnection(url, uid, pw)) {
    String q2 = "SELECT * FROM product";
    Statement s2 = con.createStatement();
    ResultSet rst2 = s2.executeQuery(q2);


    out.println("<table>");
    out.println("<tr><td>" + "ID" + "</td><td>" + " " + "Name" + "</td><td>" + " " + "Price" + "</td><td>" + " " + "Amount per item" + "</td><td>"+ " "  + "Amount" + "</td><td>" + " "  + "Category Id" + "</td></tr>");

    while(rst2.next()){
        out.println("<tr><td>" + rst2.getString(1) + "</td><td>" + " " + rst2.getString(2) + "</td><td>" + " " + rst2.getString(3) + "</td><td>" + " " + rst2.getString(4) + "</td><td>"+ " "  + rst2.getString(6) + "</td><td>"+ " "  + rst2.getString(7) + "</td></tr>");
    }
    out.println("</table>");
} catch (SQLException ex) {
    out.println("SQLException: " + ex);
}

%>
</div>
</body>
</html>