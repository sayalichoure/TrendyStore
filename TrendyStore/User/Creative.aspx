<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Creative.aspx.cs" Inherits="TrendyStore.User.Creative1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <head>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/4.5.0/fabric.min.js"></script>
        <link href="../UserTemplate/css/Creative.css" rel="stylesheet" />
    </head>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Create the container of the tool -->
    <div id="tshirt-div" style="left: 26px; top: 0px">
        <!-- Initially, the image will have the background t-shirt that has transparency -->
        <!-- So we can simply update the color with CSS or JavaScript dynamically -->
        <img id="tshirt-backgroundpicture" src="https://ourcodeworld.com/public-media/gallery/gallery-5d5afd3f1c7d6.png" style="width: 454px; margin-left: 0px"/>
        <div id="drawingArea" class="drawing-area" style="left: 115px; top: 64px; width: 201px">					
            <div class="canvas-container" style="left: -2px; top: 1px; width: 206px; height: 394px">
                <canvas id="tshirt-canvas" width="200" height="400"></canvas>
            </div>
        </div>
    </div>
    <div class="form" style="left: 107px; top: 3px">
        <div class="disgn-t">
            <p>To remove a loaded picture on the T-Shirt select it and press the <kbd>DEL</kbd> key.</p>
            <!-- The select that will allow the user to pick one of the static designs -->
            <br>
            <label for="tshirt-design">T-Shirt Design:</label>
            <select id="tshirt-design">
                <option value="">Select one of our designs ...</option>
                <option value="https://ourcodeworld.com/public-media/gallery/gallery-5d5b0e95d294c.png">Batman</option>
            </select>

            <!-- The Select that allows the user to change the color of the T-Shirt -->
            <br><br>
            <label for="tshirt-color">T-Shirt Color:</label>
            <select id="tshirt-color">
                <!-- You can add any color with a new option and defining its hex code -->
                <option value="#fff">White</option>
                <option value="#000">Black</option>
                <option value="#f00">Red</option>
                <option value="#008000">Green</option>
                <option value="#ff0">Yellow</option>
                <option value="#009B77">Emerald</option>
                <option value="#D65076">Honeysucle</option>
                <option value="#9B2335">Chili Pepper</option>
                <option value="#DFCFBE">Sand Dollar</option>
                <option value="#E15D44">Tigerlily</option>
                

            </select>


            <br><br>
            <label for="tshirt-custompicture">Upload your own design:</label>
            <input type="file" id="tshirt-custompicture" />


            <!-- Button to submit the form -->
            <br /><br />
            <button id="saveDesignButton" class="btn btn-primary">Save Design</button>

        </div>
    </div>
    <script src="../UserTemplate/js/Creative.js"></script>
</asp:Content>
