<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="KnowledgeBridge.Index" %>
<!DOCTYPE html>

<link href="style.css" rel="stylesheet" />
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css"/>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Knowledge Bridge</title>

      <script src="https://kit.fontawesome.com/66889e6565.js" crossorigin="anonymous"></script>
   
     <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js"></script>
    

    <style>
            @import url('https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@600&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Commissioner:wght@200&family=Lexend+Deca:wght@600&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Commissioner:wght@300&display=swap');
    </style>
   

</head>
 
<body>

    <form id="form1" runat="server">
           
          <div class="test" id="test">      
               
  
                <!-- MAIN MENU -->
            <div class="menu-container">

                <!--Toggle menu button-->
                <div class="menu-btn" onclick="menumove()">
                     <a href="#" class="menu-btn__burger"></a>
                 </div>

                <!--Hidden menu-->
                <nav class="navbar" id="menu">
                    <ul class="navbar-nav">
                        <!--Search button-->
                        <li class="nav-item">
                            <div class="search-box" id="search"> 
                                   <%--<input type="text" id="searchBox" runat="server" class="search-input" placeholder="Type to search!" />--%>
                                    <asp:TextBox ID="searchBox" runat="server" class="search-input" placeholder="Type to search!"></asp:TextBox>
                                      <a class="search-btn" href="#" runat="server" onserverclick="btnLoad_Click">
                                         <i class="fa-solid fa-magnifying-glass fa-lg"></i>
                                      </a>
                            </div>
                        </li>

                        <!--User page-->
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                              <i class="fa-solid fa-user fa-lg"></i>
                            </a>
                        </li>
                        <!--Login/Sign in button-->
                        <li class="nav-item">
                            <a class="nav-link" id="login-btn" onclick="login-btn()" href="#">
                              <i class="fa-solid fa-arrow-right-to-bracket fa-lg"></i>
                            </a>
                        </li>
                        <!--Go to main page (MAP)-->
                        <li class="nav-item">
                            <a class="nav-link" href="Index.aspx">
                                 <i class="fa-solid fa-map-location-dot fa-lg"></i>
                            </a>
                        </li>
                        <!--Submit button-->
                        <li class="nav-item">
                            <a class="nav-link" href="/submission.aspx">
                                 <i class="fa-solid fa-cube fa-lg"></i>
                            </a>
                        </li>
                        <li class="nav-item" id="toSubmission" runat="server">
                            <a class="nav-link" href="Submission.aspx">
                                 <i class="fa-solid fa-cube fa-lg"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
              </div>

              
              <!-- ICON LINKS -->
                <!-- 

                   <i class="fa-solid fa-user"></i>
                   <i class="fa-solid fa-comment-arrow-up"></i>
                   <i class="fa-solid fa-arrow-up-right-from-square"></i>
                   <i class="fa-solid fa-map-location-dot"></i>
                   <i class="fa-solid fa-cube"></i>
                   <i class="fa-solid fa-arrow-right-to-bracket"></i>
                   <i class="fa-solid fa-arrow-right-from-bracket"></i>
                   <i class="fa-solid fa-angle-right"></i>
                   <i class="fa-solid fa-angle-left"></i>
                   <i class="fa-solid fa-xmark"></i>
                   <asp:Button class="button" runat="server" Text="Search" />
                   <button><i class="fa-solid fa-angle-right"></i></button>
                   <button><i class="fa-solid fa-angle-left"></i></button> -->

              <!--Swiper-->
             <div class="swiper mySwiper">
                          <div class="swiper-wrapper" id="slider" runat="server">
                                <div class="swiper-slide">

                                

                                    <div id="map" class="map">

                                    </div>
                                  
                                
                                        
                                </div>


                                <div class="swiper-slide" id="testSwipe" runat="server">
                                    <div class="content">
                                        <div class="content-logo">
                                             <image class="logo" src="\assets\Put_Logo_Here.png"></image>
                                        </div>
                                        <div class="content-img">
                                             <image class="img" src="\assets\red.png"></image>
                                        </div>
                                        <div class="content-text">
                                            <p class="text">
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
			                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
			                                    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute 
			                                    irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
			                                    pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
			                                    deserunt mollit anim id est laborum. Ut enim ad minim veniam, quis nostrud
			                                    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                            </p>                     
                                        </div>

                                        <asp:Button class="to-model" runat="server" Text="MODEL" CommandArgument='2' CommandName="btn1Click" OnClick="btnView_Click" />

                                    </div>
                                </div>


                                <div class="swiper-slide" id="testSwipe2" runat="server">
                                    <div class="content">
                                        <div class="content-logo">
                                             <image class="logo" src="\assets\Google_logo.png"></image>
                                        </div>
                                        <div class="content-img">
                                             <image class="img" src="\assets\office.jpg"></image>
                                        </div>
                                        <div class="content-text">
                                            <p class="text">
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
			                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
			                                    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute 
			                                    irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
			                                    pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
			                                    deserunt mollit anim id est laborum. Ut enim ad minim veniam, quis nostrud
			                                    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                            </p>                     
                                        </div>
                                        <asp:Button class="to-model" runat="server" Text="MODEL" CommandArgument='5' CommandName="btn2Click" OnClick="btnView_Click" />
                                    </div>
                                </div>
                               
                        <%--        <div class="swiper-slide">Slide 5</div>
                                <div class="swiper-slide">Slide 6</div>
                                <div class="swiper-slide">Slide 7</div>
                                <div class="swiper-slide">Slide 8</div>
                                <div class="swiper-slide">Slide 9</div>--%>
                          </div>

                  <footer class="scroll-btn">
                      <div class="swiper-button-next"></div>
                      <div class="swiper-button-prev"></div>
                  </footer>
              </div> 

              <!-- EXPANDABLE FOOTER -->
              <div class="footer-expand" id="footer">
                <a class="footer-btn" onclick="footermove()" ><i class="fa-solid fa-info fa-2x"></i></a>
                    
                  <div class="footer-box">
                      <h2>CONTACT</h2>
                      <p class="fotter-info">name.lastname@company.com</p>
                      <p class="fotter-info">070 000 00 00</p>
                  </div>

                  <div class="footer-box">
                      <h2>OTHER</h2>
                      <p class="fotter-info">name.lastname@company.com</p>
                      <p class="fotter-info">070 000 00 00</p>
                  </div>                    
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
                         <asp:TextBox ID="txtEmailLogin" runat="server" placeholder="Username" AutoCompleteType="Disabled" CssClass="text-input"></asp:TextBox>
                        <label for="password"><span>Password</span></label>                        
                        <asp:TextBox ID="txtPassLogin" runat="server" placeholder="Password" TextMode="Password" CssClass="text-input"></asp:TextBox>
                        <label><span class="remember">Remember me</span></label>
                        <input class="remember-btn" type="checkbox" />
                        
                        <a class="forgot" href="#">Forgot Password?</a>
                        <asp:Button ID="btnLogin" CssClass="submit" runat="server" OnClick="btnLogin_Click" Text="Log in" />

                    </div>
                    
                
                    <div id="signup" class="input-group">

                        <h2 class="h2-input">SIGN UP</h2>
                        
                        <label for="email"><span>Email</span></label>
                        <asp:TextBox ID="txtEmailRegister" runat="server" placeholder="Username" AutoCompleteType="Disabled" CssClass="text-input"></asp:TextBox>
                        
                        <label for="password"><span>Password</span></label>
                        <asp:TextBox ID="txtPassRegister" runat="server" placeholder="Password" TextMode="Password" CssClass="text-input"></asp:TextBox>
                        
                        <label for="password"><span>Password</span></label>
                        <asp:TextBox ID="txtPassRegister2" runat="server" placeholder="Password" TextMode="Password" CssClass="text-input"></asp:TextBox>
                        <br />
                        
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="submit" />

                    </div>
            </div>                 
              
             
         </div>
           <!-- Map JS -->
         <script src="map.js" ></script>
    </form> 
    
</body>
    
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
                             x.style.pointerEvents = "none";
                             y.style.opacity = "1";
                             y.style.pointerEvents = "auto";
                             z.style.left = "110px";
                         }

                         function login() {

                             x.style.opacity = "1";
                             x.style.pointerEvents = "auto";
                             y.style.opacity = "0";
                             y.style.pointerEvents = "none";
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

                         //Footer Slide

                         function footermove() {
                             var c = document.getElementById("footer");
                             if (c.style.height == "0px") {
                                 c.style.height = "150px"
                             }
                             else {
                                 c.style.height = "0px";
                             }
                         }

                        
                        

                         function cloneStuff(data) { //To do : Load from backend using templates, fill with data according to search results
                             
                             //slide.querySelector("#pa").innerHTML = data;
                             slide.querySelector("#ModelShowcase").setAttribute('src', data + ".glb");
                             //slide.querySelector("#ModelShowcase").setAttribute('ios-src', data + ".usdz");
                             const clone = slide.cloneNode(true);
                             slider.appendChild(clone);
                         }

                     </script>   

</html>
