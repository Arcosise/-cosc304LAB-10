
<%


 %>


<!DOCTYPE html>
<html>
<head>
<title>Add Images</title>
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
</head>
<body>

    <div style="position: absolute; top: 5; right: 5; padding: 10px;">

<h1>Enter Img File Path:</h1>

<form method="get" action="imgToDatabase.jsp">
<input type="text" name="ImgURL" size="100">
<h1>Enter Product Id for Image:</h1>
<input type="text" name="id" size="3">
<input type="submit" value="Submit"><input type="reset" value="Reset">
</form>
</div>
</body>
</html>