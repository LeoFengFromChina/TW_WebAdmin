<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="AddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>账号：<asp:TextBox ID="txt_name" runat="server"></asp:TextBox></div>
            <div>
                管理员：<asp:DropDownList ID="ddl_isadmin" runat="server">
                    <asp:ListItem Value="false">否</asp:ListItem>
                    <asp:ListItem Value="true">是</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>密码：<asp:TextBox ID="txt_psw" runat="server"></asp:TextBox></div>
        </div>
        <div>
            <asp:Button ID="btn_OK" runat="server" Text="确认" OnClick="btn_OK_Click" /><asp:Button ID="btn_Cancel" runat="server" Text="取消" />
        </div>
    </form>
</body>
</html>
