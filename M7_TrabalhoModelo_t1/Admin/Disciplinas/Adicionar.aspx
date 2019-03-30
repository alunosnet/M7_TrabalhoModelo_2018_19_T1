<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Adicionar.aspx.cs" Inherits="M7_TrabalhoModelo_t1.Admin.Disciplinas.Adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FormView DefaultMode="Insert" Width="100%" ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlDisciplinas">
        <EditItemTemplate>
            id:
            <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel1" /><br />
            nome:
            <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /><br />
            nrmodulos:
            <asp:TextBox Text='<%# Bind("nrmodulos") %>' runat="server" ID="nrmodulosTextBox" /><br />
            curso:
            <asp:TextBox Text='<%# Bind("curso") %>' runat="server" ID="cursoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            nome:
            <asp:TextBox MaxLength="40" Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tem de indicar um nome." ControlToValidate="nomeTextBox" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False"></asp:RequiredFieldValidator>
            <asp:CustomValidator OnServerValidate="CustomValidator1_ServerValidate" ID="CustomValidator1" runat="server" ErrorMessage="O nome da disciplina deve ter pelo menos 2 letras." ControlToValidate="nomeTextBox" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False"></asp:CustomValidator>
            <br />
            nrmodulos:
            <asp:TextBox Text='<%# Bind("nrmodulos") %>' runat="server" ID="nrmodulosTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Tem de indicar o número de módulos." ControlToValidate="nrmodulosTextBox" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False"></asp:RequiredFieldValidator>            
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Tem de indicar um valor entre 1 e 30." ControlToValidate="nrmodulosTextBox" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False" Type="Integer" MinimumValue="1" MaximumValue="30"></asp:RangeValidator>
            <br />
            curso:
            <asp:TextBox MaxLength="40" Text='<%# Bind("curso") %>' runat="server" ID="cursoTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Tem de indicar o curso." ControlToValidate="cursoTextBox" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False"></asp:RequiredFieldValidator>            
            <asp:CustomValidator OnServerValidate="CustomValidator1_ServerValidate" ID="CustomValidator2" runat="server" ErrorMessage="O nome do curso tem de ter pelo menos 2 letras." ControlToValidate="cursoTextBox" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False"></asp:CustomValidator>
            <br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel" /><br />
            nome:
            <asp:Label Text='<%# Bind("nome") %>' runat="server" ID="nomeLabel" /><br />
            nrmodulos:
            <asp:Label Text='<%# Bind("nrmodulos") %>' runat="server" ID="nrmodulosLabel" /><br />
            curso:
            <asp:Label Text='<%# Bind("curso") %>' runat="server" ID="cursoLabel" /><br />
            <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' InsertCommand="INSERT INTO disciplinas(nome, nrmodulos, curso) VALUES (@nome, @nrmodulos, @curso)" SelectCommand="select * from disciplinas">
        <InsertParameters>
            <asp:Parameter Name="nome"></asp:Parameter>
            <asp:Parameter Name="nrmodulos"></asp:Parameter>
            <asp:Parameter Name="curso"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
