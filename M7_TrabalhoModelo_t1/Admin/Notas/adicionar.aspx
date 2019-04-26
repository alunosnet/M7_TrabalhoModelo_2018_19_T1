<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="adicionar.aspx.cs" Inherits="M7_TrabalhoModelo_t1.Admin.Notas.adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FormView DefaultMode="Insert" ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlNotas">
        <EditItemTemplate>
            id:
            <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel1" /><br />
            id_disciplina:
            <asp:TextBox Text='<%# Bind("id_disciplina") %>' runat="server" ID="id_disciplinaTextBox" /><br />
            nprocesso:
            <asp:TextBox Text='<%# Bind("nprocesso") %>' runat="server" ID="nprocessoTextBox" /><br />
            valor:
            <asp:TextBox Text='<%# Bind("valor") %>' runat="server" ID="valorTextBox" /><br />
            data:
            <asp:TextBox Text='<%# Bind("data") %>' runat="server" ID="dataTextBox" /><br />
            nrmodulo:
            <asp:TextBox Text='<%# Bind("nrmodulo") %>' runat="server" ID="nrmoduloTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            id_disciplina:
            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("id_disciplina") %>' DataSourceID="SqlDisciplinas" DataTextField="nome" DataValueField="id"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [id], [nome] FROM [disciplinas]"></asp:SqlDataSource>
            <br />nprocesso:
            <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("nprocesso") %>' DataSourceID="SqlAlunos" DataTextField="nome" DataValueField="nprocesso"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [nprocesso], [nome] FROM [alunos]"></asp:SqlDataSource>
            <br />valor:
            <asp:TextBox Text='<%# Bind("valor") %>' runat="server" ID="valorTextBox" /><br />
            data:
            <asp:TextBox TextMode="Date" Text='<%# Bind("data") %>' runat="server" ID="dataTextBox" /><br />
            nrmodulo:
            <asp:TextBox Text='<%# Bind("nrmodulo") %>' runat="server" ID="nrmoduloTextBox" /><br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel" /><br />
            id_disciplina:
            <asp:Label Text='<%# Bind("id_disciplina") %>' runat="server" ID="id_disciplinaLabel" /><br />
            nprocesso:
            <asp:Label Text='<%# Bind("nprocesso") %>' runat="server" ID="nprocessoLabel" /><br />
            valor:
            <asp:Label Text='<%# Bind("valor") %>' runat="server" ID="valorLabel" /><br />
            data:
            <asp:Label Text='<%# Bind("data") %>' runat="server" ID="dataLabel" /><br />
            nrmodulo:
            <asp:Label Text='<%# Bind("nrmodulo") %>' runat="server" ID="nrmoduloLabel" /><br />
            <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' InsertCommand="INSERT INTO notas(id_disciplina, nprocesso, valor, data, nrmodulo) VALUES (@id_disciplina, @nprocesso, @valor, @data, @nrmodulo)" SelectCommand="select * from notas">
        <InsertParameters>
            <asp:Parameter Name="id_disciplina"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
            <asp:Parameter Name="valor"></asp:Parameter>
            <asp:Parameter Name="data" DbType="Date"></asp:Parameter>
            <asp:Parameter Name="nrmodulo"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
