
<%


 %>


<!DOCTYPE html>
<html>
<head>
<title>Add Product</title>
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

<h1>Enter the following:</h1>
<table></table>
<tr><td>Name Price Amount per item Category ID</td></tr>
<form method="get" action="addProduct.jsp">
<input type="text" name="name" size="50">
<input type="text" name="price" size="10">
<input type="text" name="desc" size="50">
<input type="text" name="catId" size="5">
<input type="submit" value="Submit"><input type="reset" value="Reset">
</table>
</form>

</body>
</html>