<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="submission.aspx.cs" Inherits="KnowledgeBridge.submission" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Knowladge Bridge Submission</title>

    <link href="style.css" rel="stylesheet" />

</head>
<body>

    <!-- Back to main (index) Button -->
        <button type="button">Back</button>
    
	<!-- Instructions on how and what to Submit -->
    <div class="instructions">

        <h1>How to submit material to Knowladge Bridge</h1>
        <h2>Here is a list with all the information regarding file types, size, information text etc.</h2>
		<h3>Conpany Name / Logo</h3>
			 <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
			incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
			exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute 
			irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
			pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
			deserunt mollit anim id est laborum</p>
			
		<h3>3D Model</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
			incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
			exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute 
			irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
			pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
			deserunt mollit anim id est laborum</p>
			
		<h3>Pictures</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
			incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
			exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute 
			irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
			pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
			deserunt mollit anim id est laborum</p>
			
		<h3>Additional Information</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
			incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
			exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute 
			irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
			pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
			deserunt mollit anim id est laborum</p>
    </div>

    <form id="form1" runat="server">
        <div class="subform">

			<!-- inputs för inlämningen-->
			<h1>Submission form</h1>
            <!-- Company name (png/jpeg?) -->
            <label>Add an image your company name / logo [png or jpeg]</label>
            <input type="file" id="logo" name="logo" accept="image/png, image/jpeg"><br><br>

            <!-- 3D mesh (glb?) -->
            <label>Add a 3D model</label>
            <input type="file" id="mesh" name="mesh" accept="glb"><br><br>

            <label>Add any pictures you want to show [max ?]</label>
            <input type="file" id="pictures" name="pictures" multiple><br><br>

            <!-- Text information to be displayed -->
            <label>Add any additional information about your compamy or project that you would like people to know</label><br>
            <input type="text" id="info" name="info"><br><br>

            <input type="submit">

        </div>
    </form>
</body>
</html>
