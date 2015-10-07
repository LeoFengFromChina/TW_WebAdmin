using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewPage : BaseForm
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string filename = Context.Request["filename"];

        List<Product> pls = GetJsonToObject<List<Product>>(filename.Replace(@"/", @"\\"));

        content.InnerHtml = pls[0].content;
    }
}