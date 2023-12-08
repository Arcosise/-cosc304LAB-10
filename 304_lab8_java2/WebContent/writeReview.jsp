
<%
    String prodid, custid;

    prodid = request.getParameter("id");
    custid = request.getParameter("custId");


 %>


<!DOCTYPE html>
<html>
<head>
<title>Add Review</title>
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

<h1>Enter your review and then rating: </h1>

<form method="get" action="addReview.jsp">
<textarea name="review" rows="4" cols="50" maxlength="1000"></textarea>
<input type="text" name="rating" size="1">
<input type="hidden" name="prodid" value= <%= prodid %>>
<input type="hidden" name="custid" value= <%= custid %>>

<input type="submit" value="Submit"><input type="reset" value="Reset">
</form>

</body>
</html>