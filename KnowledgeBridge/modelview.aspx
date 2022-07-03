<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modelview.aspx.cs" Inherits="KnowledgeBridge.modelview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Model viewer</title>
    <style>
        model-viewer{
            width:600px;
            height:800px;
            margin:0 auto;
        }
    </style>
</head>
<body>
    <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>
    <form id="form1" runat="server">
        <div id="ImageShowcase" runat="server" src="">           
                 <model-viewer id="ModelShowcase" src="assets/Allosaurus.glb"
                    alt="A 3D model of an astronaut"
                    ar
                    auto-rotate
                    camera-controls>
                </model-viewer>    
            <script type="text/javascript">
                const models = ['Allosaurus.glb', 'Dinosaur.glb'];
                const toggleModel = document.querySelector('#ModelShowcase');               
                //let j = 0;
                //setInterval(() => toggleModel.setAttribute('src', `assets/${models[j++ % 2]}`), 7000);
                function loadModel(data) {
                    const filepath = "data:model/gltf-binary;base64," + data;
                    toggleModel.setAttribute('src', filepath);                   
                }
                
            </script>
            <br />
            <p><asp:FileUpload ID="fileUpload" runat="server" /></p>
            
            <%--<asp:ScriptManager runat="server" ID="sm">
            </asp:ScriptManager>
            <asp:updatepanel runat="server">
            <ContentTemplate>--%>
               
            <%--</ContentTemplate>
            </asp:updatepanel>--%>
        </div>
        <div>
            <p id="lbl">
                A
            </p>
            <input type="button" onclick="myFunction()"/>
            <asp:Button ID="btnLoad" runat="server" Text="Load dino" OnClick="btnLoad_Click" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />      
            <asp:Button ID="btnLoadImg" runat="server" Text="Load img" OnClick="btnLoadImg_Click" />        

            <br />
            <asp:Button ID="btnPrevious" runat="server" Text="Prev" OnClick="btnPrevious_Click"/>
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click"/>
        </div>
    </form>
     
</body>
</html>
