<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="submission.aspx.cs" Inherits="KnowledgeBridge.submission" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Knowladge Bridge Submission</title>
</head>
<body>

    <!-- Back to main (index) Button -->
    
    <div>
         <h1>How to submit material to Knowladge Bridge</h1>
         <p>Here is all the information regarding file types, size, information text etc.</p>

    </div>

    <form id="form1" runat="server">
        <div>

           <!-- inputs för inlämningen-->

            <!-- Company name (png/jpeg?) -->
            <label>Add an image your company name / logo [png or jpeg]</label>
            <input type="file" id="logo" name="logo" accept="image/png, image/jpeg"><br><br>

            <!-- 3D mesh (glb?) -->
            <label>Add a 3D model</label>
            <input type="file" id="mesh" name="mesh" accept="glb"><br><br>

            <label>Add any pictures you want to show [max ?]</label>
            <input type="file" id="pictures" name="pictures" multiple><br><br>

            <!-- Text information to be displayed -->
            <label>Add any text information about your compamy or project that you would like people to know</label><br>
            <input type="text" id="info" name="info"><br><br>

            <input type="submit">

        </div>
    </form>
</body>
</html>
