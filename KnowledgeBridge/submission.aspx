<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="submission.aspx.cs" Inherits="KnowledgeBridge.submission" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Knowladge Bridge Submission</title>

    <link href="style.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/66889e6565.js" crossorigin="anonymous"></script>
    <style>
            @import url('https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@600&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Commissioner:wght@200&family=Lexend+Deca:wght@600&display=swap');
    </style>
</head>
<body class="background">

	 <div class="search-box"> 
                     <input type="text" class="search-input" placeholder="Type to search!" />
                           <a class="search-btn" href="#">
                                <i class="fa-solid fa-magnifying-glass"></i>
                           </a>
               </div>



                <nav class="navbar">
                    <ul class="navbar-nav">
                        <!-- LOGO -->
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                 <i class="fa-solid fa-magnifying-glass"></i>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">
                              <i class="fa-solid fa-arrow-right-to-bracket"></i>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                 <i class="fa-solid fa-map-location-dot"></i>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                 <i class="fa-solid fa-cube"></i>
                            </a>
                        </li>
                    </ul>
                </nav>

    <main>
	<!-- Instructions on how and what to Submit -->
        <div class="instructions">

            <h1>How to submit material to Knowladge Bridge</h1>
            <h2>Here is a list with all the information regarding file types, size, information text etc.</h2>
            <h2>Submition form below.</h2>
                <a class="to-sub" href="#subform">
                    <i class="fa-solid fa-arrow-down"></i>
                </a>
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

            <h2></h2>

        </div>

        <form id="form2" runat="server">
            <div class="subform" id="subform">

			    <!-- inputs för inlämningen-->
			    <h1>Submission form</h1>
                <h2>Submit the content you want to display here</h2>
                <!-- Company name (png/jpeg?) -->
                <label>Add an image your company name / logo [png or jpeg]</label>
                <input type="file" id="logo" name="logo" accept="image/png, image/jpeg"/>
                <br />
                <br />
                <!-- 3D mesh (glb?) -->
                <label>Add a 3D model</label>
                <input type="file" class="sub-btn" id="mesh" name="mesh" accept="glb"/>
                <br />
                <br />
                <label>Add any pictures you want to show [max ?]</label>
                <input type="file" id="pictures" name="pictures" multiple/>
                <br />
                <br />
                <!-- Text information to be displayed -->
                <label>Add any additional information about your compamy or project that you would like people to know</label>
                <br />
                <br />
                <textarea class="add-text" placeholder="Add information here!"></textarea>
           <!-- <input type="text" class="add-text" id="info" name="info" />--> 
                <br />
                <br />
                <input type="submit"/>

            </div>
        </form>
    </main>
</body>
</html>
