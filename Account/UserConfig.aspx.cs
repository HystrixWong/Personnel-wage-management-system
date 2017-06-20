using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_SystemConfig : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        validate();
    }

    //判断用户是否有操作权限
    private void validate()
    {
        //首先判断当前用户是否有访问的权限
        if (Session["Permission"] == null || Session["Permission"].ToString() != "1")
        {
            Response.Write("<script language=javascript>alert('抱歉，您不是管理员，没有该权限！');window.location.href='/Account/Login.aspx';</script>");
        }

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //刷新GridView
        if (e.CommandName == "Insert")
        {
            GridView1.DataSourceID = "";
            GridView1.DataBind();
        }
    }

    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView1.DataSourceID = "SqlDataSource1";
        GridView1.DataBind();
    }
}