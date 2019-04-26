<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="M7_TrabalhoModelo_t1.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Sistemas de Informação</h1>
<div runat="server" id="divLogin" 
    class="border col-md-3 float-right">
    Login<br />
    Nome:<asp:TextBox CssClass="form-control" ID="tbNome" runat="server"></asp:TextBox><br />
    Password:<asp:TextBox CssClass="form-control" ID="tbPassword" TextMode="Password" runat="server"></asp:TextBox><br />
    <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="Login" />
    <asp:Label ID="lbErro" runat="server" Text=""></asp:Label>
    <asp:DetailsView OnDataBound="DetailsView1_DataBound" ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="nome" DataSourceID="SqlLogin">
        <Fields>
            <asp:BoundField DataField="nome" HeaderText="nome" ReadOnly="True" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="perfil" HeaderText="perfil" SortExpression="perfil"></asp:BoundField>
            <asp:BoundField DataField="nprocesso" HeaderText="nprocesso" SortExpression="nprocesso"></asp:BoundField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource runat="server" ID="SqlLogin" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT nome, perfil, nprocesso FROM utilizadores WHERE (nome = @nome) AND (palavra_passe = HASHBYTES('SHA2_512', @palavra_passe))">
        <SelectParameters>
            <asp:ControlParameter DbType="AnsiString" ControlID="tbNome" PropertyName="Text" Name="nome"></asp:ControlParameter>
            <asp:ControlParameter DbType="AnsiString" ControlID="tbPassword" PropertyName="Text" Name="palavra_passe"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</div>
<div runat="server" id="divCursos">
    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCursos">
        <Columns>
            <asp:BoundField DataField="curso" HeaderText="curso" SortExpression="curso"></asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="curso" DataNavigateUrlFormatString="detalhes_curso.aspx?q={0}" Text="Ver disciplinas" HeaderText="Disciplinas"></asp:HyperLinkField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlCursos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT distinct [curso] FROM [disciplinas]"></asp:SqlDataSource>
</div>
<div runat="server" id="divDisciplinas" class="col-md-9 float-left">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDisciplinas">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("nrmodulos") %>' runat="server" ID="nrmodulosLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("curso") %>' runat="server" ID="cursoLabel" /></td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("nrmodulos") %>' runat="server" ID="nrmodulosTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("curso") %>' runat="server" ID="cursoTextBox" /></td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td></td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("nrmodulos") %>' runat="server" ID="nrmodulosTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("curso") %>' runat="server" ID="cursoTextBox" /></td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("nrmodulos") %>' runat="server" ID="nrmodulosLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("curso") %>' runat="server" ID="cursoLabel" /></td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <span>Disciplinas mais pesquisadas</span>
            <table class="table" runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="" border="0">
                            <tr runat="server" style="">
                                <th runat="server">nome</th>
                                <th runat="server">nrmodulos</th>
                                <th runat="server">curso</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("nrmodulos") %>' runat="server" ID="nrmodulosLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("curso") %>' runat="server" ID="cursoLabel" /></td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [nome], [nrmodulos], [curso] FROM [disciplinas] WHERE ([curso] = @curso)">
        <SelectParameters>
            <asp:CookieParameter CookieName="curso" Name="curso" Type="String"></asp:CookieParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>
