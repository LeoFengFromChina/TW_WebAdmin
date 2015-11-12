<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="AddAbout.aspx.cs" Inherits="AddAbout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
     <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/ui-style.css">

    <link rel="stylesheet" href="plugin/jbox/skins2/Blue/jbox.css" />
    <script type="text/javascript" src="plugin/jbox/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
    <script type="text/javascript" src="plugin/jbox/jquery.jbox-2.3.min.js"></script>
    <script type="text/javascript" src="plugin/jbox/i18n/jquery.jbox-zh-CN.js"></script>
    <script>
       
        function successCallback(smg) { 
            parent.successCallback(smg); 
        }
        function cancelCallback(){
            parent.cancelCallback();
        }
        $(function(){
            var cancelBtn = $("#cancelBtn");
            cancelBtn.bind("click",function(){
                parent.cancelCallback();
            });
        });
         function myTip(msg){
            $.jbox.tip(msg);
            return;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
         <div class="content-wrap">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="nest" id="basicClose">
                            <div class="title-alt">
                                <h6>关于特威</h6>
                            </div>

                            <div class="body-nest" id="basic">
                                <div class="form_center">                    
                                        <div class="form-group">
                                            <label for="txt_title">标题：</label>
                                           <div><asp:TextBox ID="txt_title" runat="server" class="form-control"></asp:TextBox></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">所属城市：</label>
                                            <div><asp:DropDownList ID="ddl_city" runat="server"  class="form-control">
                                                <asp:ListItem>广州</asp:ListItem>
                                                <asp:ListItem>东莞</asp:ListItem>
                                                <asp:ListItem>佛山</asp:ListItem>
                                                <asp:ListItem>深圳</asp:ListItem>
                                                <asp:ListItem>全国</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputFile">正文：</label>
                                            <div><asp:TextBox ID="txt_content" runat="server" class="form-control"></asp:TextBox></div>
                                        </div>
                                         <div class="form-group">
                                            <label for="exampleInputFile">主样式：</label>
                                             <div><asp:TextBox ID="txt_mainstyle" runat="server" class="form-control"></asp:TextBox></div>
                                                                                  
                                        </div>
                                         <div class="form-group">
                                            <label for="exampleInputFile">图片：</label>
                                            <div><asp:TextBox ID="txt_img" runat="server" class="form-control"></asp:TextBox></div>
                                                                                        
                                        </div>
                                         <div class="form-group">
                                            <label for="exampleInputFile">标题样式：</label>
                                            <div><asp:TextBox ID="txt_titlestyle" runat="server" class="form-control"></asp:TextBox></div>
                                                                                     
                                        </div>
                                         <div class="form-group">
                                            <label for="exampleInputFile">链接路径：</label>
                                            <div><asp:TextBox ID="txt_url" runat="server" class="form-control"></asp:TextBox></div>
                                                                                
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputFile">页面类型：</label>
                                            <div>
                                                <asp:DropDownList ID="ddl_pagetype" runat="server" class="form-control">
                                                    <asp:ListItem>div</asp:ListItem>
                                                    <asp:ListItem Value="html"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                                                                
                                        </div>
                                         <div class="form-group">
                                            <label for="exampleInputFile">备注：</label>
                                            <div><asp:TextBox ID="txt_memo" runat="server" class="form-control"></asp:TextBox></div>
                                                                                
                                        </div>
                                        </div>
                                        <div class="text-center">
                                           <asp:Button ID="btn_OK" runat="server" Text="确认" OnClick="btn_OK_Click"  class="btn btn-info" />
                                            <div class="btn btn-default" id="cancelBtn">取消</div>
                                               <!-- <asp:Button ID="btn_Cancel" runat="server" Text="取消" />-->
                                        </div>
                                        
                               
                                </div>


                            </div>

                        </div>
                    </div>

                </div>
            </div>
       
    </form>
</body>
</html>
