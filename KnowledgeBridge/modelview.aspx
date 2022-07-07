<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modelview.aspx.cs" Inherits="KnowledgeBridge.modelview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Model viewer</title>

    <link href="style.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>

    <script src="https://kit.fontawesome.com/66889e6565.js" crossorigin="anonymous"></script>

    <style>
        model-viewer{
            width:600px;
            height:800px;
            margin:0 auto;
        }
    </style>
</head>
<body class="">
    <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>

    <form id="form1" runat="server">


        <!-- MAIN MENU -->
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
                        <li class="nav-item" id="toSubmission" runat="server">
                            <a class="nav-link" href="Submission.aspx">
                                 <i class="fa-solid fa-cube"></i>
                            </a>
                        </li>
                    </ul>
                </nav>


        <div id="ImageShowcase" runat="server" src="">           
            <!--
                 <model-viewer id="ModelShowcase" src="assets/Allosaurus.glb"
                    alt="A 3D model of an astronaut"
                    ar
                    auto-rotate
                    camera-controls>
                </model-viewer>  -->

        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <div class="swiper mySwiper">
                          <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <model-viewer class="model-viewer" id="ModelShowcase" src=""
                                        alt="A 3D model of an astronaut"
                                        ar
                                        auto-rotate
                                        camera-controls>
                                    </model-viewer>
                                </div>
                                <div id="testSwipe" class="swiper-slide">Slide 2</div>
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


            <script type="text/javascript">
                //const models = ['Allosaurus.glb', 'Dinosaur.glb'];
                const slide2 = document.getElementById("testSwipe");
                const toggleModel = document.querySelector('#ModelShowcase');
                //let j = 0;
                //setInterval(() => toggleModel.setAttribute('src', `assets/${models[j++ % 2]}`), 7000);
                function loadModel(data) {
                    const filepath = "data:model/gltf-binary;base64," + data;
                    toggleModel.setAttribute('src', filepath);                   
                }
                function loadData(filetype, data) {
                    const filepath = "data:" + filetype + ";base64," + data;
                    toggleModel.setAttribute('src', filepath);
                }
                function cloneStuff() {
                    alert("oh no");
                    //const clone = toggleModel.cloneNode(true);
                    //clone.id = "foo2";
                    //slide2.appendChild(clone);
                }
                
            </script>

         <!--   <p><asp:FileUpload ID="fileUpload" runat="server" /></p> -->
            
          
        </div>

        <!--
        <div class="div">
                <p id="lbl">
                    A
                </p>
                <input type="button" onclick="myFunction()"/>
                
                <asp:Button CssClass="upload-file-btn" ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />  
                <asp:Button CssClass="load-img-btn" ID="btnLoadImg" runat="server" Text="Load img" OnClick="btnLoadImg_Click" />  
                <asp:Button CssClass="prev-btn" ID="btnPrevious" runat="server" Text="Prev" OnClick="btnPrevious_Click"/>
                <asp:Button CssClass="next-btn" ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click"/>
          
        </div>
        <!--

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
                        
                        <a class="forgot" href="#">Forgot Password</a>
                        
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


    </form>
     
</body>
</html>
