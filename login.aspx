<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="css/login.css">
   <link rel="stylesheet" href="plugin/jbox/skins2/Blue/jbox.css" />
    <script type="text/javascript" src="plugin/jbox/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="plugin/jbox/jquery.jbox-2.3.min.js"></script>
    <script type="text/javascript" src="plugin/jbox/i18n/jquery.jbox-zh-CN.js"></script>
    <script>
        function loginTip(msg){
          $.jbox.tip(msg);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <section class="container">
            <div class="login">
                <h1>用户登录</h1>
                <p>
                    <asp:TextBox ID="txt_user" runat="server" placeholder="账号"></asp:TextBox>
                </p>
                <p>
                    <asp:TextBox ID="txt_psw" runat="server" type="password" placeholder="密码"></asp:TextBox>
                </p>
                <p class="remember_me">
                    <label>
                        <asp:CheckBox ID="chk_remenberme" runat="server" />
                        记住密码
                    </label>
                </p>
                <p class="submit">
                    <asp:Button ID="btn_Login" runat="server" Text="登录" OnClick="btn_Login_Click" />
                </p>

            </div>

            <div class="login-help">
                <!--<p><a href="#">Power by 广州市汇客信息科技有限公司</a>.</p>-->
            </div>
        </section>
    </form>
</body>
</html>
