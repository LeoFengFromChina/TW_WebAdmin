<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="AddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
                                <h6>用户管理</h6>
                            </div>

                            <div class="body-nest" id="basic">
                                <div class="form_center">                    
                                        <div class="form-group">
                                            <label for="txt_title">账号：</label>
                                            <div><asp:TextBox ID="txt_name" runat="server" class="form-control"></asp:TextBox></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">管理员：</label>
                                           <div>
                                                <asp:DropDownList ID="ddl_isadmin" runat="server" class="form-control">
                                                    <asp:ListItem Value="false">否</asp:ListItem>
                                                    <asp:ListItem Value="true">是</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputFile">密码：</label>
                                            <div><asp:TextBox ID="txt_psw" runat="server" class="form-control"></asp:TextBox></div>
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
