<%@ Page Title="用户管理" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserConfig.aspx.cs" Inherits="Account_SystemConfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <h1 style="text-align:center; margin-top:50px">用户管理</h1>
        <br />

        <div style="text-align:center; ">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:StaffManagerString %>" DeleteCommand="DELETE FROM [User] WHERE [Id] = @original_Id AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([Permission] = @original_Permission) OR ([Permission] IS NULL AND @original_Permission IS NULL))" InsertCommand="INSERT INTO [User] ([Id], [Password], [Permission]) VALUES (@Id, @Password, @Permission)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [User]" UpdateCommand="UPDATE [User] SET [Password] = @Password, [Permission] = @Permission WHERE [Id] = @original_Id AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([Permission] = @original_Permission) OR ([Permission] IS NULL AND @original_Permission IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_Permission" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Permission" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Permission" Type="String" />
                    <asp:Parameter Name="original_Id" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_Permission" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <div style="margin-top:30px;">
            <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"  >
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                    <asp:ButtonField CommandName="Insert" Text="插入">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle Width="60px" />
                    </asp:ButtonField>
                    <asp:BoundField DataField="Id" HeaderText="用户名" ReadOnly="True" SortExpression="Id" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="密码" SortExpression="Password" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Permission" HeaderText="权限" SortExpression="Permission" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" OnItemInserted="DetailsView1_ItemInserted" Width="363px">
                        <Fields>
                            <asp:BoundField DataField="Id" HeaderText="用户名" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Password" HeaderText="密码" SortExpression="Password" />
                            <asp:BoundField DataField="Permission" HeaderText="权限" SortExpression="Permission" />
                            <asp:CommandField ShowInsertButton="True" />
                        </Fields>
                    </asp:DetailsView>
                </EmptyDataTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <PagerStyle HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

