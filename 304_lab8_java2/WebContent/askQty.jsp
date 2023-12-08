
<%
    String id, name, price;

    id = request.getParameter("id");
    name = request.getParameter("name");
    price = request.getParameter("price");

 %>


<!DOCTYPE html>
<html>
<head>
<title>Ask Quantity</title>

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
    <div style="position: absolute; top: 5; right: 5; padding: 10px;">
<h1>Enter new amount:</h1>

<form method="get" action="changeQty.jsp">
<input type="text" name="changeAmount" size="5">
<input type="hidden" name="pId" value= <%= id %>>
<input type="hidden" name="pName" value= <%= name %>>
<input type="hidden" name="price" value= <%= price %>>
<input type="submit" value="Submit"><input type="reset" value="Reset">
</form>
</div>
</body>
</html>
