﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>关于特威</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <link rel="stylesheet" href="css/min.css" />

        <link rel="stylesheet" href="plugin/jbox/skins2/Blue/jbox.css" />
    <script type="text/javascript" src="plugin/jbox/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
    <script type="text/javascript" src="plugin/jbox/jquery.jbox-2.3.min.js"></script>
    <script type="text/javascript" src="plugin/jbox/i18n/jquery.jbox-zh-CN.js"></script>

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
         function del_sure2(){
            var submit = function (v, h, f) {
            if (v == 'ok'){
               document.getElementById("deleteBtn").click();
            }
               return true; //close
            };

            $.jbox.confirm("确定删除吗？", "提示", submit);

        }
         function myTip(msg){
            $.jbox.tip(msg);
            return;
        }
         var OpenIframe = function(url,name){

           $.jbox("iframe:"+url, { 
                id:'updateProductType',
                top: '100px',
                title: name, 
                width: 720, 
                height: 750, 
                buttons: {}
                
            });
          
        };

        function successCallback(msg) { 
            $.jbox.close(true);
           var a=  $.jbox.tip('成功','success');

            setTimeout(function(){
                 window.location.href=window.location.href;
            },1500);
           
        } 
        function cancelCallback(msg) { 
            $.jbox.close(true);
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
                关于特威</h1>

            <div class="bloc">
                <div class="title">
                    关于列表<div style="float: right; margin-right: 30px;">
                        <input id="btn_refresh" class="barbtn" onclick="javascript:window.location.href=window.location.href;" type="button" value="刷新" /><input id="btn_new" style="margin-right: 10px;" type="button" value="新增" onclick="    javascript: OpenIframe('AddAbout.aspx', '新增产品');" /><asp:Button ID="deleteBtn" runat="server" Text="删除" OnClick="deleteBtn_Click" style="display:none;"/>
                        <input type="button" value="删除" onclick="del_sure2()"/>
                    </div>
                </div>
                <div class="content">
                    <table>
                        <asp:Repeater ID="myRepeat" runat="server">
                            <HeaderTemplate>
                                <thead>
                                    <tr>
                                        <th width="5%">选择</th>
                                        <th width="20%">标题</th>
                                        <th width="35%">图片</th>
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
                                    <td class="picture" style="width: 140px;">
                                        <img width="300px" src="<%#Eval("img") %>" alt="" /></a></td>
                                    <td>
                                        <div><%#Eval("memo") %></div>
                                    </td>
                                    <td class="actions" style="text-align: left"><a href="javascript:OpenIframe('ViewPage.aspx?filename=/json/abouts/about<%#Eval("id") %>.json','chart');" title="预览">
                                        <img src="img/th-comment.png" alt="" /></a>
                                        <a href="javascript: OpenIframe('AddAbout.aspx?id=<%#Eval("id") %>', '编辑关于');" title="编辑">
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
