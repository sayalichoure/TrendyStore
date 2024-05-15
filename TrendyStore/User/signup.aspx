<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="TrendyStore.User.signup" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trendy Store</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form id="form1" runat="server">
    <style>
        .container,
        .container-fluid,
        .container-sm,
        .container-md,
        .container-lg,
        .container-xl {
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
            text-align: center;
        }
  .text-decoration-none {
  text-decoration: none !important;
}
        .text-primary {
            color: #D19C97 !important;
            font-size: 40px;
        }

h1{
    text-decoration: none !important;
    color:black;
    font-size:40px;
}
.font-weight-bold {
    font-weight: 700 !important;
}

.font-weight-semi-bold {
    font-weight: 600;
}
    </style>
         <!-- Topbar Start -->
<div class="container-fluid">
    
    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Trendy</span>Store</h1>
            </a>
        </div>
        </div>
    </div>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign Up
                        </h2>
                        
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name">
                                </i></label>
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="Your Name" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Your Name" BorderStyle="None" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red" Width="384px"></asp:RequiredFieldValidator>
                            </div>


                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email">
                                    </i></label>
                                <asp:TextBox ID="Textbox2" runat="server" placeholder="Your Email" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter your Email" ControlToValidate="Textbox2" ForeColor="Red"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Enter Valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>


                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>                                
                                <asp:TextBox ID="Textbox3" runat="server" placeholder="Password" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter Your Password" ControlToValidate="Textbox3" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>


                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <asp:TextBox ID="Textbox4" runat="server" placeholder="Repeat your Password" ></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password is Inccorect" ControlToCompare="Textbox3" ControlToValidate="Textbox4" ForeColor="Red"></asp:CompareValidator>
                            </div>

                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                
                                <asp:Button ID="Button1" runat="server" class="form-submit" Text="Register" />
                            </div>
                                
                    </div>
                    
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="login.aspx" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>

       </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    </form>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
