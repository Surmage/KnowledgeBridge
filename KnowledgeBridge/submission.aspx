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
            <!-- MAIN MENU -->
            <div class="menu-container">

                <!--Toggle menu button-->
                <div class="menu-btn" onclick="menumove()">
                     <a href="#" class="menu-btn__burger" ></a>
                 </div>

                <!--Hidden menu-->
                <nav class="navbar" id="menu">
                    <ul class="navbar-nav">
                        <!--Search button-->
                        <li class="nav-item">
                            <div class="search-box" id="search"> 
                                   <input type="text" class="search-input" placeholder="Type to search!" />
                                      <a class="search-btn" href="#">
                                         <i class="fa-solid fa-magnifying-glass"></i>
                                      </a>
                            </div>
                        </li>

                        <!--User page-->
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                              <i class="fa-solid fa-user"></i>
                            </a>
                        </li>
                        <!--Login/Sign in button-->
                        <li class="nav-item">
                            <a class="nav-link" id="login-btn" onclick="login-btn()" href="#">
                              <i class="fa-solid fa-arrow-right-to-bracket"></i>
                            </a>
                        </li>
                        <!--Go to main page (MAP)-->
                        <li class="nav-item">
                            <a class="nav-link" href="Index.aspx">
                                 <i class="fa-solid fa-map-location-dot"></i>
                            </a>
                        </li>
                        <!--Submite button-->
                        <li class="nav-item">
                            <a class="nav-link" href="/submission.aspx">
                                 <i class="fa-solid fa-cube"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                 <i class="fa-solid fa-cube"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
              </div>

   
	<!-- Instructions on how and what to Submit -->
        <div class="instructions">

            <h1>Submition Instructions</h1>
            <h2>Here is the instructionsfor submiting to Knowladge Bridge</h2>
            <h2>Submition form below.</h2>
                <a class="to-sub" href="#subform">
                    <i class="fa-solid fa-arrow-down"></i>
                </a>
		    <h3>Conpany Name / Logo</h3>
			     <p> The first item you are to submit to Knowladge Bridge is an image of the comapny name or comapny logo.
                     The aspecratio of the logo image is 21:9. the acapatble image files are PNG and JPEG. Make sure the 
                     background is white or transparent.
                     <br />
                     <br />
                     If you are not part of an comapny aka a student or other follow these instructions.
                     <br />
                     <br />
                     Students:
                     <br />
                     <br />

                     Other:

			     </p>
			
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

			    <!-- inputs for submission-->
			    <h1>Submission form</h1>
                <h2>Submit the content you want to display here</h2>
                <!-- Company name (text) -->
                <label>Write the name of your company</label>
                <input type="text" id="company" placeholder="Company name" runat="server">
                <br />
                <br />
                <!-- Company name image(png/jpeg?) -->
                <label>Add an image of your company name / logo [png or jpeg]</label>
                <br />
                <asp:FileUpload ID="logo" class="upload-btn" runat="server" />               
                <br />
                <br />
                <!-- Project name (text) -->
                <label>Write the name of the project</label>
                <br />
                <br />
                <input type="text" id="project" placeholder="Project name" runat="server">
                <br />
                <br />
                <!-- 3D mesh (glb?) -->
                <label>Add a 3D model</label>
                <%--<input type="file" class="sub-btn" id="mesh" name="mesh" accept="glb" runat="server"/>--%>
                <asp:FileUpload ID="meshes" class="upload-btn" AllowMultiple runat="server" />
                <br />
                <br />
                <label>Add any pictures you want to show [max ?]</label>
                <%--<input type="file" id="pictures" name="pictures" multiple runat="server"/>--%>
                <asp:FileUpload ID="pictures" class="upload-btn" AllowMultiple runat="server" />
                <br />
                <br />
                <!-- Text information to be displayed -->
                <label>Add any additional information about your company or project that you would like people to know</label>
                <br />
                <br />
                <textarea class="add-text" id="desc" placeholder="Add information here!" runat="server"></textarea>
           <!-- <input type="text" class="add-text" id="info" name="info" />--> 
                <br />
                <br />
                <%--<input type="submit" runat="server" onserverclick="btnUpload_Click" allowmultiple="true"/>--%>
                <asp:Button ID="submit" runat="server" Text="Submit" OnClick="btnUpload_Click"/>

            </div>
                <input class="submit-form-btn" type="submit"/>

            </div>

            <!-- LOGIN POPUP WINDOW -->
       <div class="popup" id="popup">
              
                <a class="close-btn" id="exit" onclick="exit()"><i class="fa-solid fa-xmark"></i></a>

                <div class="button-box">
                    <div id="btn"></div>
                    <button type="button" class="toggle-btn" onclick="login()">Login</button>
                    <button type="button" class="toggle-btn" onclick="signup()">Sign up</button>
                </div>

                    <div id="login" class="input-group">

                        <h2 class="h2-input">LOGIN</h2>
                        
                        <label for="email"><span>Email</span></label>
                        <input class="text-input" type="text" placeholder="Email" />
                        
                        <label for="password"><span>Password</span></label>
                        <input class="text-input" type="text" placeholder="Password" />
                        
                        <label><span class="remember">Remember me</span></label>
                        <input class="remember-btn" type="checkbox" />
                        
                        <a class="forgot" href="#">Forgot Password?</a>
                        
                        <button class="submit" type="submit">Login</button>

                    </div>
                    
                
                    <div id="signup" class="input-group">

                        <h2 class="h2-input">SIGN UP</h2>
                        
                        <label for="email"><span>Email</span></label>
                        <input class="text-input" type="text" placeholder="Email"/>
                        
                        <label for="password"><span>Password</span></label>
                        <input class="text-input" type="text" placeholder="Enter a Password" />
                        
                        <label for="password"><span>Password</span></label>
                        <input class="text-input" type="text" placeholder="Enter Password again" />
                        <br />
                        
                        <button class="submit" type="submit">Sign up</button>

                    </div>
            </div>

       <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

                    <!-- Initialize Swiper -->
                     <script>
                         var swiper = new Swiper(".mySwiper", {
                             slidesPerView: 1,
                             spaceBetween: 30,
                             loop: true,
                             pagination: {
                                 el: ".swiper-pagination",
                                 clickable: true,
                             },
                             navigation: {
                                 nextEl: ".swiper-button-next",
                                 prevEl: ".swiper-button-prev",
                             },
                         });

                         // Popup window

                         document.getElementById('login-btn').addEventListener('click', function () {
                             document.querySelector('.popup').style.opacity = '1';
                             document.getElementById("popup").style.visibility = "visible";
                             document.getElementById("popup").style.pointerEvents = "auto";
                         });

                         document.getElementById('exit').addEventListener('click', function () {
                             document.querySelector('.popup').style.opacity = '0';
                             document.getElementById("popup").style.visibility = "hidden";
                             document.getElementById("popup").style.pointerEvents = "none";
                         });

                         // Login/Sign up toggle button

                         var x = document.getElementById("login");
                         var y = document.getElementById("signup");
                         var z = document.getElementById("btn");



                         function signup() {

                             x.style.opacity = "0";
                             y.style.opacity = "1";
                             z.style.left = "110px";
                         }

                         function login() {

                             x.style.opacity = "1";
                             y.style.opacity = "0";
                             z.style.left = "0px";
                         }

                         // Menu Slide

                         function menumove() {
                             var a = document.getElementById("menu");
                             var b = document.getElementById("search");
                             if (a.style.left == "0px") {
                                 a.style.left = "-125px"
                                 b.style.left = "-125px"

                             } else {
                                 a.style.left = "0px";
                                 b.style.left = "6px"
                             }

                         }

                         // Menu button animation
                         const menuBtn = document.querySelector('.menu-btn');
                         let menuOpen = false;
                         menuBtn.addEventListener('click', () => {
                             if (!menuOpen) {
                                 menuBtn.classList.add('open');
                                 menuOpen = true;
                             } else {
                                 menuBtn.classList.remove('open');
                                 menuOpen = false;
                             }
                         });

                     </script>

        </form>
   
</body>
</html>
