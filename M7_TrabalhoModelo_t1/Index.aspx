<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="M7_TrabalhoModelo_t1.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Sistemas de Informação</h1>
<div runat="server" id="divLogin">
    Login<br />
    Nome:<asp:TextBox ID="tbNome" runat="server"></asp:TextBox><br />
    Password:<asp:TextBox ID="tbPassword" TextMode="Password" runat="server"></asp:TextBox><br />
    <asp:Button ID="Button1" runat="server" Text="Login" />
    <asp:Label ID="lbErro" runat="server" Text=""></asp:Label>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px"></asp:DetailsView>
</div>
<div runat="server" id="divCursos"></div>
<div runat="server" id="divDisciplinas"></div>
</asp:Content>
