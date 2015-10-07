<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="AddComponent.aspx.cs" Inherits="AddComponent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>标题：<asp:TextBox ID="txt_title" runat="server"></asp:TextBox></div>
            <div>正文：<asp:TextBox ID="txt_content" runat="server"></asp:TextBox></div>
            <div>主样式：<asp:TextBox ID="txt_mainstyle" runat="server"></asp:TextBox></div>
            <div>图片：<asp:TextBox ID="txt_img" runat="server"></asp:TextBox></div>
            <div>标题样式：<asp:TextBox ID="txt_titlestyle" runat="server"></asp:TextBox></div>
            <div>链接路径：<asp:TextBox ID="txt_url" runat="server"></asp:TextBox></div>
            <div>
                页面类型：<asp:DropDownList ID="ddl_pagetype" runat="server">
                    <asp:ListItem>div</asp:ListItem>
                    <asp:ListItem Value="html"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>备注：<asp:TextBox ID="txt_memo" runat="server"></asp:TextBox></div>
        </div>
        <div>
            <asp:Button ID="btn_OK" runat="server" Text="确认" OnClick="btn_OK_Click" /><asp:Button ID="btn_Cancel" runat="server" Text="取消" />
        </div>
    </form>
</body>
</html>
