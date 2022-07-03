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
  

                <!-- SEARCH BAR -->
               <div class="search-box"> 
                   <input type="text" class="search-input" placeholder="Type to search!" />
                      <a class="search-btn" href="#">
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
                   <asp:Button class="button" runat="server" Text="Search" />
                   <button><i class="fa-solid fa-angle-right"></i></button>
                   <button><i class="fa-solid fa-angle-left"></i></button> -->


             <div class="swiper mySwiper">
                          <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="map">

                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="content">
                                        <div class="content-logo"></div>
                                        <div class="content-img"></div>
                                        <div class="content-text"></div>

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
              
            <div class="popup">
              

                <div class="button-box">
                    <div id="btn"></div>
                    <button type="button" class="toggle-btn" onclick="login()">Login</button>
                    <button type="button" class="toggle-btn" onclick="signup()">Sign up</button>
                </div>

                    <div id="login" class="input-group">

                        <label>Email</label>
                        <input type="text" placeholder="Email"/>

                        <label></label>
                        <input type="text" placeholder="Password" />

                        <input type="checkbox" />
                        <span>Remember me</span>

                        <button type="submit">Login</button>

                    </div>
                    
                
                    <div id="sign up" class="input-group">

                        <label>Email</label>
                        <input type="text" placeholder="Email"/>

                        <label></label>
                        <input type="text" placeholder="Password" />

                        <label></label>
                        <input type="text" placeholder="Password" />

                        <button type="submit">Login</button>

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

                        var x = documetn.getElementById("login");
                        var y = documetn.getElementById("signup");
                        var z = documetn.getElementById("btn");

                        function signup() {
                            x.style.opacity = "0";
                            y.style.opacity = "1";
                            z.style.left = 110px;
                        }

                        function login() {
                            x.style.opacity = "1";
                            y.style.opacity = "0";
                            z.style.left = 0px;
                        }

                    </script>
        
          
         </div>       
    </form> 


</body>
</html>