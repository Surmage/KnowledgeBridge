<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="KnowledgeBridge.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Knowledge Bridge</title>

    <link href="style.css" rel="stylesheet" />

     <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>

     <script src="https://kit.fontawesome.com/66889e6565.js" crossorigin="anonymous"></script>

</head>
<body>

    <form id="form1" runat="server">
          <div class="test" id="test">      
                <!--<h4>Look at model</h4>-->
                <!--<asp:Button class="button" ID="btnView" runat="server" Text="Model View" OnClick="btnView_Click" />-->
                <!-- <br /><br /> -->
                <!--<h4>Go to submission page</h4>-->
                <!--<asp:Button class="button" ID="btnGoToSubmit" runat="server" OnClick="btnGoToSubmit_Click" Text="To submission" /> -->
  
                <!-- MAIN MENU -->
                <!-- SEARCH BAR -->
               <div class="search-box"> 
                   <input type="text" id="searchBox" runat="server" class="search-input" placeholder="Type to search!" />
                      <a class="search-btn" href="#" runat="server" onserverclick="btnLoad_Click">
                         <i class="fa-solid fa-magnifying-glass"></i>
                      </a>
               </div>
                <nav class="navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                 <i class="fa-solid fa-magnifying-glass"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="login-btn" onclick="login-btn()" href="#">
                              <i class="fa-solid fa-arrow-right-to-bracket"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.aspx">
                                 <i class="fa-solid fa-map-location-dot"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
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
              
                <!-- ICON LINKS 

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


             <div class="swiper mySwiper">
                          <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="map">
                                        <image src="\assets\map_v1.png" width="100%" height="100%"></image>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="content">
                                        <div class="content-logo">
                                             <image class="logo" src="\assets\Put_Logo_Here.png"></image>
                                        </div>
                                        <div class="content-img"></div>
                                        <div class="content-text">
                                            <p class="text">
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
			                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
			                                    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute 
			                                    irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
			                                    pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
			                                    deserunt mollit anim id est laborum
                                            </p>
                                        </div>

                                    </div>
                                </div>
                                <div class="swiper-slide">Slide 3</div>
                                <div class="swiper-slide">Slide 4</div>
                                <div class="swiper-slide">Slide 5</div>
                                <div class="swiper-slide">Slide 6</div>
                                <div class="swiper-slide">Slide 7</div>
                                <div class="swiper-slide">Slide 8</div>
                                <div class="swiper-slide">Slide 9</div>
                          </div>

                  <footer class="scroll-btn">
                      <div class="swiper-button-next"></div>
                      <div class="swiper-button-prev"></div>
                  </footer>
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
        

  
                    <!-- Swiper JS -->
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
                            document.getElementById("popup").style.pointerEvents = "auto";
                        });

                        document.getElementById('exit').addEventListener('click', function () {
                            document.querySelector('.popup').style.opacity = '0';
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
                            y.style.pointerEvents = "none";
                            y.style.opacity = "0";
                            z.style.left = "0px";
                        }

                        

                    </script>
        
          
         </div>       
    </form> 


</body>
</html>