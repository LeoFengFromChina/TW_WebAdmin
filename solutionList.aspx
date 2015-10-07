<%@ Page Language="C#" AutoEventWireup="true" CodeFile="solutionList.aspx.cs" Inherits="solutionList" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>工程案例</title>
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
                案例列表</h1>

            <div class="bloc">
                <div class="title">
                    案例明细<div style="float: right; margin-right: 30px;">
                        <input id="btn_refresh" class="barbtn" onclick="javascript: location.reload();" type="button" value="刷新" /><input id="btn_new" style="margin-right: 10px;" type="button" value="新增" onclick="    javascript: OpenWindow('AddSolution.aspx', '新增产品');" /><asp:Button ID="deleteBtn" runat="server" Text="删除" OnClick="deleteBtn_Click" />
                    </div>
                </div>
                <div class="content">
                    <table>
                        <asp:Repeater ID="myRepeat" runat="server">
                            <HeaderTemplate>
                                <thead>
                                    <tr>
                                        <th width="5%">选择</th>
                                        <th width="15%">标题</th>
                                        <th width="10%">区域</th>
                                        <th width="20%">图片</th>
                                        <th width="10%">日期</th>
                                        <th width="20%">备注</th>
                                        <th width="20%">操作</th>
                                    </tr>
                                </thead>
                            </HeaderTemplate>
                            <ItemTemplate>

                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkItem" runat="server"></asp:CheckBox>
                                        <asp:HiddenField ID="hdfID" runat="server" Value='<%# Eval("id")%>' />
                                    </td>
                                    <td><a href="#"><%#Eval("title") %></a></td>
                                    <td><a href="#"><%#Eval("city") %></a></td>
                                    <td class="picture" style="width: 140px;">
                                        <img width="300px" src="<%#Eval("img") %>" alt="" /></a></td>
                                     <td>
                                        <div><%#Eval("date") %></div>
                                    </td>
                                    <td>
                                        <div><%#Eval("memo") %></div>
                                    </td>
                                    <td class="actions" style="text-align: left"><a href="javascript:OpenWindow('ViewPage.aspx?filename=/json/solutions/solution<%#Eval("id") %>.json','chart');" title="预览">
                                        <img src="img/th-comment.png" alt="" /></a>
                                        <a href="javascript: OpenWindow('AddSolution.aspx?id=<%#Eval("id") %>', '编辑产品');" title="编辑">
                                            <img src="img/icons/actions/edit.png" alt="" /></a>
                                    </td>
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
