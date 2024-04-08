<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication2.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>College Management System</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .login-container {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .image {
            flex: 1;
            background-image: url('image/login.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            height: 100vh;
        }

        .content {
            flex: 1;
            padding: 6rem;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .project-name {
            font-size: 4rem;
            margin-bottom: 4rem;
        }

        .login-form {
            max-width: 500px;
            width: 100%;
        }

        .form-group {
            margin-bottom: 2.5rem;
        }

        .form-control {
            width: 100%;
            padding: 0.475rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
        }

        .btn-login {
            width: 100%;
            padding: 0.75rem;
            font-size: 1.25rem;
            font-weight: bold;
            color: #fff;
            background-color: #5558C9;
            border: 1px solid #5558C9;
            border-radius: 0.25rem;
        }

        .text-center {
            text-align: center;
        }

        .text-danger {
            color: #dc3545;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <div class="image"></div>
        <div class="content">
            <div class="project-name">
                College Management System
            </div>
            <div class="login-form">
                <form id="form2" runat="server">
                    <div class="form-group">
                        <input id="inputEmail" type="text" placeholder="Name" required="" runat="server" autofocus="" class="form-control rounded-pill border-0 shadow-sm px-4" />
                    </div>
                    <div class="form-group">
                        <input id="inputPassword" type="password" placeholder="Password" required="" runat="server" class="form-control rounded-pill border-0  shadow-sm px-4 text-primary" />
                    </div>
                    <asp:Button ID="Button1" runat="server" Text="Sign in" CssClass="btn btn-primary btn-login" OnClick="btnLogin_Click1"/>
                    <div class="text-center d-flex justify-content-between mt-4">
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
