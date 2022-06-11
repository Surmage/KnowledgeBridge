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
         <model-viewer src="assets/Allosaurus.glb"
            alt="A 3D model of an astronaut"
            ar
            auto-rotate
            camera-controls>
        </model-viewer>  
    </form>
     
</body>
</html>
