<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="KnowledgeBridge.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Knowledge Bridge</title>

    <link href="style.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/66889e6565.js" crossorigin="anonymous"></script>


</head>
<body>

    <form id="form1" runat="server">
        <div class="background">
            <div class="test" id="test">      
                <%--<!--<h4>Look at model</h4>-->--%>
                <!--<asp:Button class="button" ID="btnView" runat="server" Text="Model View" OnClick="btnView_Click" />-->
                <!-- <br /><br /> -->
                <!--<h4>Go to submission page</h4>-->
                <!--<asp:Button class="button" ID="btnGoToSubmit" runat="server" OnClick="btnGoToSubmit_Click" Text="To submission" /> -->
                <!-- <br /><br /> -->   
                <!-- Search bar? -->
                <nav class="navbar">
                    <ul class="navbar-nav">

                        <!-- LOGO -->
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                 <i class="fa-solid fa-magnifying-glass"></i>
                            </a>
                        </li>

                            
                                <li class="nav-item">
                                    <div class="search-box">
                                    <input type="text" class="search-input" placeholder="Start Looking For Something!" />
                                    <a class="nav-link" href="#">
                                         <i class="fa-solid fa-magnifying-glass"></i>
                                    </a>
                                    </div>
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
                                 <i class="fa-solid fa-arrow-right-to-bracket"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
              

               <!-- <i class="fa-solid fa-comment-arrow-up"></i>
                    <i class="fa-solid fa-arrow-up-right-from-square"></i>
                    <i class="fa-solid fa-map-location-dot"></i>
                    <i class="fa-solid fa-cube"></i>
                   <i class="fa-solid fa-arrow-right-to-bracket"></i>
                   <i class="fa-solid fa-arrow-right-from-bracket"></i>
              <!--  <asp:Button class="button" runat="server" Text="Search" /> -->
           


           <div class="wrapper">
                <section>
                    <div class="content">
                        <p>Selection 1</p>
                  
                        
                    </div>
                </section>

		        <section>Selection 2</section>
		        <section>Selection 3</section>
		        <section>Selection 4</section>
		        <section>Selection 5</section>
            </div>
       </div>
      </div>       
    </form> 


</body>
</html>