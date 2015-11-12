<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>广州市特威后台</title>
    <link rel="shortcut icon" href="images/logo/favicon.ico" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <link rel="stylesheet" href="plugin/jbox/skins2/Blue/jbox.css" />
    <script type="text/javascript" src="plugin/jbox/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="plugin/jbox/jquery.jbox-2.3.min.js"></script>
    <script type="text/javascript" src="plugin/jbox/i18n/jquery.jbox-zh-CN.js"></script>


    <script type="text/javascript" src="js/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="css/min.css" />
    <script type="text/javascript" src="js/min.js"></script>
    <script type="text/javascript">
        function del_sure() {
            var gnl = confirm("确定要退出吗?");
            if (gnl == true) {
                return true;
            }
            else {
                return false;
            }
        }
        function del_sure2(){
            var submit = function (v, h, f) {
            if (v == 'ok'){
               document.getElementById("btn_Logout").click();
            }
               return true; //close
            };

            $.jbox.confirm("确定退出吗？", "提示", submit);

        }
    </script>
</head>
<body runat="server">
    <form id="form1" runat="server">

        <!--头部-->
        <div id="head">
            <div class="right">
                <a href="#" class="button profile">
                    <img src="img/icons/top/huser.png" alt="" /></a>
                Hi,
            <a href="#">
                <asp:Label ID="lbl_userName" runat="server" Text="Admin"></asp:Label></a>
                |
            <a href="#">
                <asp:LinkButton ID="btn_Logout" runat="server" Text="退出" OnClick="btn_Logout_Click"  style="display:none;"/></a>
            
            <a href="javascript:;" onclick="del_sure2();">退出</a>
            </div>
            <!--<div class="right">
                <form action="#" id="search" class="search placeholder">
                    <label>Looking for something ?</label>
                    <input type="text" value="" name="q" class="text" />
                    <input type="submit" value="rechercher" class="submit" />
                </form>
            </div> -->
        </div>

        <!--左侧菜单-->
        <div id="sidebar">
            <ul>
                <li class="current">
                    <a href="#">
                        <img src="img/icons/menu/layout.png" alt="" />
                        产品管理</a>
                    <ul>
                        <li class="current"><a href="#" onclick="aClickFunc(this)" page="productlist.aspx">产品列表</a></li>
                        <li><a href="javascript:void(0);" onclick="aClickFunc(this)" page="producttype.aspx">产品分类</a></li>
                        <li><a href="javascript:void(0);" onclick="aClickFunc(this)" page="componentlist.aspx">产品配件</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <img src="img/icons/menu/layout.png" alt="" />
                        工程管理</a>
                    <ul>
                        <li><a href="javascript:void(0);" onclick="aClickFunc(this)" page="solutionlist.aspx">工程案例</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <img src="img/icons/menu/layout.png" alt="" />
                        企业管理</a>
                    <ul>
                        <li><a href="javascript:void(0);" onclick="aClickFunc(this)" page="about.aspx">关于特威</a></li>
                        <li><a href="javascript:void(0);" onclick="aClickFunc(this)" page="users.aspx">用户管理</a></li>
                        <li><a href="javascript:void(0);" onclick="aClickFunc(this)" page="service.html">特威服务</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <!--右侧栏-->
        <iframe id="myIframe" src="welcome.html"></iframe>
        <script src="js/my_globalJS.js" type="text/javascript"></script>
    </form>
</body>
</html>
