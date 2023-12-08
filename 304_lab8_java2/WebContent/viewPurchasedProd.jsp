<!DOCTYPE html>
<html>
<head>
    
<title>Purchased Products</title>

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
    <div style="position: absolute; top: 5; right: 5; padding: 10px;"></div>

<%@ include file="auth.jsp"%>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.sql.*,java.net.URLEncoder" %>


<%
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
String uid = "sa"; 
String pw = "304#sa#pw";

try (Connection con = DriverManager.getConnection(url, uid, pw)) {
    String custId = (String) session.getAttribute("authenticatedUserId");
    String prodId = request.getParameter("prodId");
    String q2 = "SELECT * FROM ordersummary JOIN orderproduct ON ordersummary.orderId = orderproduct.orderId JOIN product ON orderproduct.productId = product.productId WHERE customerId = ?";
    PreparedStatement pstmt = con.prepareStatement(q2);
    pstmt.setString(1,custId);
    ResultSet rst2 = pstmt.executeQuery();

    String q3 = "SELECT * FROM review WHERE customerId = ? AND productId = ?";
    PreparedStatement pstmt2 = con.prepareStatement(q3);
    


    out.println("<h2>Product List</h2>");

    out.println("<table>");
    out.println("<tr><td>" + "ID" + "</td><td>" + " " + "Name" + "</td><td>" + " " + "Price" + "</td><td>" + " " + "Amount per item" + "</td><td>"+ " "  + "Category ID" + "</td></tr>");
    while(rst2.next()){
        prodId = rst2.getString("productId");
        pstmt2.setString(1,custId);
        pstmt2.setString(2,prodId);
        ResultSet rst3 = pstmt2.executeQuery();

        if(!rst3.next()){
            out.println("<tr><td>" + rst2.getString("orderId") + "</td><td>" + " " + rst2.getString("orderDate") + "</td><td>" + " " + rst2.getString("productName") + "</td><td>" + " " + "</td><td><a href='writeReview.jsp?id=" + URLEncoder.encode(rst2.getString("productId"), "UTF-8") + "&custId=" + URLEncoder.encode(rst2.getString("customerId"), "UTF-8") + "'>Review Item</a></td></tr>");
        } else {
            out.println("<tr><td>" + rst2.getString("orderId") + "</td><td>" + " " + rst2.getString("orderDate") + "</td><td>" + " " + rst2.getString("productName") + "</td><td>" + " " + "</td><td> Already Reviewed </td></tr>");
        }

    }
    out.println("</table>");
} catch (SQLException ex) {
    out.println("SQLException: " + ex);
}

%>
</div>
</body>
</html>