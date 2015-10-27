<%@ Page Language="C#" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="users" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>产品类型</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script type="text/javascript" src="js/libs/jquery/1.6/jquery.min.js"></script>
    <script type="text/javascript" src="js/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="css/min.css" />
    <script type="text/javascript" src="js/min.js"></script>
    <script type="text/javascript" src="js/controllers/ProductListController.js"></script>
    <link rel="stylesheet" href="css/popup.css" />
    <script type="text/javascript" src="js/popup.js"></script>
    <script type="text/javascript">
        function OpenWindow(url, name) {
            //网页名称，可为空; 
            var iWidth = 720;                          //弹出窗口的宽度; 
            var iHeight = 600;                         //弹出窗口的高度; 
            //获得窗口的垂直位置 
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
            //获得窗口的水平位置 
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
            window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=yes,scrollbars=1,titlebar=no');
        }
        function del_sure() {
            var gnl = confirm("确定要删除吗?");
            if (gnl == true) {
                return true;
            }
            else {
                return false;
            }
        }

    </script>
    <style type="text/css">
        .barbtn {
            margin-right: 10px;
        }
    </style>
</head>

<body runat="server">
    <form id="Form1" method="post" runat="server">
        <div id="popDiv" class="mydiv" style="display: none;">
        </div>
        <div id="bg" class="bg" style="display: none;"></div>
        <!--右侧内容 -->
        <div id="content" class="white">
            <h1>
                <img src="img/icons/posts.png" alt="" />
                产品类型</h1>

            <div class="bloc">
                <div class="title">
                    类型列表<div style="float: right; margin-right: 30px;">
                        <input id="btn_refresh" class="barbtn" onclick="javascript: location.reload();" type="button" value="刷新" /><input id="btn_new" class="barbtn" type="button" value="新增" onclick="    javascript: OpenWindow('AddUser.aspx', '新增产品');" /><asp:Button ID="deleteBtn" runat="server" Text="删除" OnClick="deleteBtn_Click" />
                    </div>
                </div>
                <div class="content">
                    <table>
                        <asp:Repeater ID="myRepeat" runat="server">
                            <HeaderTemplate>
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" class="checkall" /></th>
                                        <th>姓名</th>
                                        <th>是否管理员</th>
                                        <th>创建日期</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkItem" runat="server"></asp:CheckBox>
                                        <asp:HiddenField ID="hdfID" runat="server" Value='<%# Eval("id")%>' />
                                    </td>
                                    <td><a href="#"><%#Eval("username") %></a></td>
                                    <td><a href="#"><%#Eval("isadmin") %></a></td>
                                    <td><a href="#"><%#Eval("createdate") %></a> </td>
                                    <td class="actions"><a href="javascript: OpenWindow('AddUser.aspx?id=<%#Eval("id") %>', '编辑产品');" title="编辑">
                                        <img src="img/icons/actions/edit.png" alt="" /></a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
