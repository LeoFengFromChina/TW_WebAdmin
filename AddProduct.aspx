<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="css/form.css">
   
    <link href="js/umeditor1_2_2-utf8-net/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="js/umeditor1_2_2-utf8-net/third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/umeditor1_2_2-utf8-net/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/umeditor1_2_2-utf8-net/umeditor.min.js"></script>
    <script type="text/javascript" src="js/umeditor1_2_2-utf8-net/lang/zh-cn/zh-cn.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">
    <div  class="smart-green">
        <h1>编辑
            <span></span>
        </h1>
        <label>
            <span>标题：</span>
             <asp:TextBox ID="txt_title" runat="server" class="input_content"></asp:TextBox>
        </label>
        <label>
            <span>分类：</span>
             <asp:DropDownList ID="ddl_type" runat="server" class="input_content"></asp:DropDownList>
        </label>
        <label>
            <span>正文：</span>
            <script type="text/plain" id="myEditor" style="width:100%;height:240px;" class="input_content">
                <p>这里我可以写一些输入提示</p>
            </script>
            <asp:TextBox ID="txt_content" rows="5" TextMode="multiline" runat="server" class="input_content"></asp:TextBox>
        </label>
        <label>
            <span>主样式：</span>
            <asp:TextBox ID="txt_mainstyle" runat="server" class="input_content"></asp:TextBox>
        </label>
         <label>
            <span>图片：</span>
            <asp:TextBox ID="txt_img" runat="server" class="input_content"></asp:TextBox>
        </label>
         <label>
            <span>标题样式：</span>
            <asp:TextBox ID="txt_titlestyle" runat="server" class="input_content"></asp:TextBox>
        </label>
         <label>
            <span>链接路径：</span>
           <asp:TextBox ID="txt_url" runat="server" class="input_content"></asp:TextBox>
        </label>
         <label>
            <span>页面类型：</span>
            <asp:DropDownList ID="ddl_pagetype" runat="server" class="input_content">
                    <asp:ListItem>div</asp:ListItem>
                    <asp:ListItem Value="html"></asp:ListItem>
                </asp:DropDownList>
        </label>
         <label>
            <span>备注：</span>
            <asp:TextBox ID="txt_memo" runat="server" class="input_content"></asp:TextBox>
        </label>
        <label>
            <span>&nbsp;</span>
           
             <span><asp:Button ID="btn_OK" runat="server" Text="确认" OnClick="btn_OK_Click" class="button"/></span>
             <span><asp:Button ID="btn_Cancel" runat="server" Text="取消"  class="button" /></span>
        </label>
    </div>

    <script type="text/javascript">
    //实例化编辑器
    var um = UM.getEditor('myEditor');
    um.addListener('blur',function(){
        $('#focush2').html('编辑器失去焦点了')
    });
    um.addListener('focus',function(){
        $('#focush2').html('')
    });
    //按钮的操作
    function insertHtml() {
        var value = prompt('插入html代码', '');
        um.execCommand('insertHtml', value)
    }
    function isFocus(){
        alert(um.isFocus())
    }
    function doBlur(){
        um.blur()
    }
    function createEditor() {
        enableBtn();
        um = UM.getEditor('myEditor');
    }
    function getAllHtml() {
        alert(UM.getEditor('myEditor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UM.getEditor('myEditor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UM.getEditor('myEditor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用umeditor')方法可以设置编辑器的内容");
        UM.getEditor('myEditor').setContent('欢迎使用umeditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UM.getEditor('myEditor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UM.getEditor('myEditor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UM.getEditor('myEditor').selection.getRange();
        range.select();
        var txt = UM.getEditor('myEditor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UM.getEditor('myEditor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UM.getEditor('myEditor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UM.getEditor('myEditor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UM.getEditor('myEditor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            domUtils.removeAttributes(btn, ["disabled"]);
        }
    }
</script>
    </form>
    
</body>
</html>
