<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.sql.*,java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
    <title>Vigor Multivitamin</title>
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
        .custom-button {
            padding: 10px 20px; 
            background-color: #0a73e3; 
            color: #080808; 
            border: none; 
            border-radius: none; 
            cursor: pointer; 
            margin: 10px; 
        }
        .custom-button:hover {
            background-color: #0056b3; 
        }
        .button-container {
            text-align: center; 
            margin-top: 20px;
        }
    </style>

    <link rel="shortcut icon" href="img/Vigor.jpg" type="image/jpeg">
    <link rel="icon" href="img/Vigor.jpg" type="image/jpeg">
</head>
<body>
<div style="position: absolute; top: 0; right: 0; padding: 10px;">
    <%
        String userName = (String) session.getAttribute("authenticatedUser");
        if (userName != null) {
            out.println("<h3>Signed in as: " + userName + "</h3>");
        }
    %>
    <a href="index.jsp" style="text-decoration: none;">
        <button style="margin-right: 5px;">Home</button>
    </a>
    <a href="listprod.jsp" style="text-decoration: none;">
        <button>Product List</button>
    </a>
</div>

<%
String id, name, price, productImageURL;
id = request.getParameter("id");
name = URLDecoder.decode(request.getParameter("name"), "UTF-8");
price = request.getParameter("price");
productImageURL = request.getParameter("imgURL");

// Decode the productImageURL

String imagePath = request.getContextPath() + "/" + productImageURL;
%>

<img src="<%= imagePath %>" alt="Product Logo" height="500" width="500">

<%
try {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}
String url = "jdbc:sqlserver://cosc304_sqlserver:1433;DatabaseName=orders;TrustServerCertificate=True";
String uid = "sa"; 
String pw = "304#sa#pw";
try (Connection con = DriverManager.getConnection(url, uid, pw)) {
String sql = "SELECT * FROM review WHERE productId = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rst1 = pstmt.executeQuery();

NumberFormat currencyFormat = NumberFormat.getCurrencyInstance();
String formattedPrice = currencyFormat.format(Double.parseDouble(price));

out.println("<h2>" + name + "</h2>");
out.println("<table>");   
out.println("<tr><th>Id </th><th>Price</th></tr>");
out.println("<tr><td>" + id + "</td><td>" + formattedPrice + "</td></tr>");
out.println("</table>");
out.println("<div class='button-container'>");
out.println("<form action='listprod.jsp' method='get'>");
out.println("<button type='submit' class='custom-button'>Continue Shopping</button>");
out.println("</form>");
out.println("<form action='addcart.jsp' method='get'>");
out.println("<input type='hidden' name='id' value='" + URLEncoder.encode(id, "UTF-8") + "'>");
out.println("<input type='hidden' name='name' value='" + URLEncoder.encode(name, "UTF-8") + "'>");
out.println("<input type='hidden' name='price' value='" + price + "'>");
out.println("<button type='submit' class='custom-button'>Add to Cart</button>");

int count = 0;
out.println("<h2> Reviews </h2>");
while(rst1.next() && count < 5){
    out.println("<tr><td><br>" + rst1.getString("reviewComment") + "<br></td></tr>");
    count++;
}
out.println("</form>");
out.println("</div>");

} catch (SQLException ex) {
    out.println("SQLException: " + ex);
}
%>

</body>
</html>
