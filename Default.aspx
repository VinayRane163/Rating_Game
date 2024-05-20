<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Rating_Game.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .custom-file {
            position: relative;
            overflow: hidden;
            display: inline-block;
        }

        .custom-file-input {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            padding: 0;
            font-size: 20px;
            cursor: pointer;
            opacity: 10;
            border:100px solid #fff;
        }

        .lol{
            opacity:100%;
        }
        .custom-file-label {
            display: inline-block;
            padding: 10px 20px;
            cursor: pointer;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            border: 3px solid #fff;
        }

        .custom-file-label:hover {
            background-color: #0056b3;
        }

        .img-preview {
            max-width: 150px;
            max-height: 150px;
            margin-top: 10px;
        }

        .lol {
            border: 3px solid #fff;
            min-height: 100px;
            margin-bottom: 10px;
            overflow: auto;
        }

        .drag-over {
            border: 3px dashed pink;
        }
        .loli{
            background-color: #169895;
            opacity: 0.8;
            background-image:  repeating-radial-gradient( circle at 0 0, transparent 0, black 10px ), repeating-linear-gradient( black, black );
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;
            background-attachment: fixed;
        }
        .C{
            text-align:center;
            background-color:darkblue;
            font-size:60px;
            color:wheat;
            font:bold;
        }
        .B{
            text-align:center;
            background-color:darkgreen;
            font-size:60px;
            color:wheat;
            font:bold;
        }
        .A{
            text-align:center;
            background-color:maroon;
            font-size:60px;
            color:wheat;
            font:bold;
        }
        .S{
            text-align:center;
            background-color:darkgoldenrod;
            font-size:60px;
            color:wheat;
            font:bold;
        }


        .nega {
            max-height: 200px;
            max-width: 500px;
            display: inline-block; /* Ensure ad and button are displayed inline */
            position:sticky;
        }

        .ningus {
            position: relative; 
            padding-left:370px;
            padding-bottom:25px;
            padding-top:25px;
            /* Set position of the container to relative */
        }

       .cancel-button {
    position: sticky;
    top: 10px;
    right: 10px;
    width: 30px; /* Adjust width as needed */
    height: 30px; /* Adjust height as needed */
    background-color: white;
    border: none;
    cursor: pointer;
    padding: 5px; /* Add padding to improve visual appearance */
}


    </style>
    <script type="text/javascript">
        function allowDrop(ev) {
            ev.preventDefault();
            ev.target.classList.add('drag-over');
        }

        function dragLeave(ev) {
            ev.preventDefault();
            ev.target.classList.remove('drag-over');
        }

        function drop(ev) {
            ev.preventDefault();
            ev.target.classList.remove('drag-over');

            var data = ev.dataTransfer.getData("text");
            var img = document.getElementById(data);
            ev.target.appendChild(img);
        }

        function drag(ev) {
            ev.dataTransfer.setData("text", ev.target.id);
        }
    </script>
</head>
<body class="loli" runat="server">

    

    <form id="form1" runat="server" class="container">

            <div class="ningus">

            <asp:AdRotator CssClass="nega" ID="AdRotator1" runat="server" AdvertisementFile="~/Ad.xml" OnAdCreated="AdRotator1_AdCreated" />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="https://cdn-icons-png.flaticon.com/512/66/66847.png" OnClick="ImageButton1_Click" CssClass="cancel-button" />
        </div>




        <div class="column">
            <div class="col">
                <div id="imageContainer" class="lol" ondrop="drop(event)" ondragover="allowDrop(event)" ondragleave="dragLeave(event)"></div>
`            </div>
            <br />  
            <div class="row">
                <div class="col-1 S">
                    <label>S</label>
                </div>
                <div class="col-11">
                    <div id="imageContainer1" class="lol" ondrop="drop(event)" ondragover="allowDrop(event)" ondragleave="dragLeave(event)"></div>
                </div>
             </div>
            <br />
            <div class="row">
                <div class="col-1 A">
                    <label>A</label>
                </div>
                <div class="col-11">
                    <div id="imageContainer2" class="lol" ondrop="drop(event)" ondragover="allowDrop(event)" ondragleave="dragLeave(event)"></div>
                </div>
             </div>
            <br />
            <div class="row">
                <div class="col-1 B">
                    <label>B</label>
                </div>
                <div class="col-11">
                    <div id="imageContainer3" class="lol" ondrop="drop(event)" ondragover="allowDrop(event)" ondragleave="dragLeave(event)"></div>
                </div>
             </div>

            <br />

            <div class="row">
                <div class="col-1 C">
                    <label>C</label>
                </div>
                <div class="col-11">
                    <div id="imageContainer4" class="lol" ondrop="drop(event)" ondragover="allowDrop(event)" ondragleave="dragLeave(event)"></div>
                </div>
            </div>
            <br />
            <br />  

            <div class="row">
                <div class="col">
                    <div class="custom-file">
                        <asp:FileUpload ID="imageUpload" runat="server" CssClass="custom-file-input" onchange="showImage(this);" multiple="multiple" />
                    </div>
                </div>
            </div>

        </div>
    </form>
    <script type="text/javascript">
        function showImage(input) {
            var fileInput = document.getElementById('<%= imageUpload.ClientID %>');
            var fileLabel = document.getElementById('fileLabel');
            var imgContainer = document.getElementById('imageContainer');
            imgContainer.innerHTML = ''; // Clear previous images

            if (fileInput.files && fileInput.files.length > 0) {
                // Display chosen file names
                var fileNames = "";
                for (var i = 0; i < fileInput.files.length; i++) {
                    fileNames += fileInput.files[i].name + ", ";
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var img = document.createElement('img');
                        img.src = e.target.result;
                        img.className = 'mt-2 img-thumbnail img-preview';
                        img.draggable = true;
                        img.id = 'img' + i; // Unique id for each image
                        img.setAttribute('ondragstart', 'drag(event)');
                        imgContainer.appendChild(img);
                    };
                    reader.readAsDataURL(fileInput.files[i]);
                }
            }
        }

    </script>
</body>
</html>
