<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
<style>
    body {
        background-color: pink;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;

        text-align: center; 
        min-height: 100vh;
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
    <div style="position: absolute; top: 0; right: 5; padding: 10px;">
        <form action="addImg.jsp" method="get">
            <button type="submit" class="custom-button">Add Image</button>
        </form>
        <form action="listCust.jsp" method="get">
            <button type="submit" class="custom-button">List Customers</button>
        </form>
        <form action="listProdAdmin.jsp" method="get">
            <button type="submit" class="custom-button">List All Products</button>
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


    String q1 = "SELECT CAST(orderDate AS DATE) as OrderDay, SUM(totalAmount) as TotalSales FROM ordersummary GROUP BY CAST(orderDate AS DATE) ORDER BY CAST(orderDate AS DATE) asc";
    Statement s1 = con.createStatement();
    ResultSet rst = s1.executeQuery(q1);
    

    out.println("<h3>Administrator Sales Report by Day:</h3>");
    out.println("<table>");
    out.println("<tr><th>Order Date</th><th>Total Sales</th></tr>");

    while(rst.next()){
        out.println("<tr><td>" + rst.getDate("OrderDay") + "</td><td>" + NumberFormat.getCurrencyInstance().format(rst.getDouble("TotalSales")) + "</td>");
    }

} catch (SQLException ex) {
    out.println("SQLException: " + ex);
}

%>
</div>
</body>
</html>