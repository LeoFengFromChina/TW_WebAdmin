<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    
    <link href="js/umeditor1_2_2-utf8-net/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="js/umeditor1_2_2-utf8-net/third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/umeditor1_2_2-utf8-net/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/umeditor1_2_2-utf8-net/umeditor.min.js"></script>
    <script type="text/javascript" src="js/umeditor1_2_2-utf8-net/lang/zh-cn/zh-cn.js"></script>


    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/ui-style.css">
    <script type="text/javascript" src="plugin/jbox/jquery-1.4.2.min.js"></script>
    <script>
       
        function successCallback(smg) { 
            parent.successCallback(smg); 
        }
        function cancelCallback(){
            parent.cancelCallback();
        }
        function tip(msg){
            parent.tip(msg);
        }
        $(function(){
            var cancelBtn = $("#cancelBtn");
            cancelBtn.bind("click",function(){
                parent.cancelCallback();
            });
        });
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
          <div class="content-wrap">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="nest" id="basicClose">
                            <div class="title-alt">
                                <h6>产品类型编辑</h6>
                            </div>

                            <div class="body-nest" id="basic">
                                <div class="form_center">                    
                                        <div class="form-group">
                                            <label for="txt_title">标题：</label>
                                            <div><asp:TextBox ID="txt_title" runat="server"  class="form-control"></asp:TextBox></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">分类：</label>
                                           <div>
                                                <asp:DropDownList ID="ddl_type" runat="server"  class="form-control"></asp:DropDownList>
                                            </div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputFile">正文：</label>
                                            <div><asp:TextBox ID="txt_content" rows="5" TextMode="multiline" runat="server"  style="width:100%;height:50px !important"></asp:TextBox></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputFile">主样式：</label>
                                            <div> <asp:TextBox ID="txt_mainstyle" runat="server"  class="form-control"></asp:TextBox></div>
                                        </div>
                                         <div class="form-group">
                                            <label for="exampleInputFile">图片：</label>
                                            <div>  <asp:TextBox ID="txt_img" runat="server"  class="form-control"></asp:TextBox></div>
                                        </div>   
                                         <div class="form-group">
                                            <label for="exampleInputFile">标题样式：</label>
                                            <div> <asp:TextBox ID="txt_titlestyle" runat="server"  class="form-control"></asp:TextBox></div>
                                        </div> 

                                         <div class="form-group">
                                            <label for="exampleInputFile">链接路径：</label>
                                            <div><asp:TextBox ID="txt_url" runat="server"  class="form-control"></asp:TextBox></div>
                                        </div> 

                                         <div class="form-group">
                                            <label for="exampleInputFile">页面类型：</label>
                                            <div>  <asp:DropDownList ID="ddl_pagetype" runat="server" class="form-control">
                                                    <asp:ListItem>div</asp:ListItem>
                                                    <asp:ListItem Value="html"></asp:ListItem>
                                                  </asp:DropDownList>
                                            </div>
                                        </div> 
           
                                         <div class="form-group">
                                            <label for="exampleInputFile">备注：</label>
                                            <div> <asp:TextBox ID="txt_memo" runat="server" class="form-control" ></asp:TextBox></div>
                                        </div> 
                                      
                                        <div class="text-center">
                                          <asp:Button ID="btn_OK" runat="server" Text="确认" OnClick="btn_OK_Click" class="btn btn-info"/>
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
