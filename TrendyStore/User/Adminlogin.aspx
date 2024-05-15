<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminlogin.aspx.cs" Inherits="TrendyStore.User.Adminlogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
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
    font-size:40px;
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


        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/admin-img.jpg" alt="sing up image"></figure>
                        <a href="signup.aspx" class="signup-image-link">Create an account</a>
                        <a href="login.aspx" class="signup-image-link">I am already member</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Admin login</h2>
                        <form id="loginform" runat="server">  
                            
                            <div class="form-group">
                               <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="Email"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Enter Valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>

                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <asp:TextBox ID="TextBox2" runat="server" placeholder="Password"></asp:TextBox>
                                </div>

                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div>
                            <div class="form-group form-button">
                                
                                <asp:Button ID="Button1" runat="server" class="form-submit" Text="Log in" />
                            </div>
                        </form>
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
