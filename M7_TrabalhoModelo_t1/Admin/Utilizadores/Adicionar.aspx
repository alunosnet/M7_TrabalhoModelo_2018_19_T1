<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Adicionar.aspx.cs" Inherits="M7_TrabalhoModelo_t1.Admin.Utilizadores.Adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FormView DefaultMode="Insert" Width="100%" ID="FormView1" runat="server" DataKeyNames="nome" DataSourceID="SqlUtilizadores">
        <EditItemTemplate>
            nome:
            <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel1" /><br />
            palavra_passe:
            <asp:TextBox Text='<%# Bind("palavra_passe") %>' runat="server" ID="palavra_passeTextBox" /><br />
            perfil:
            <asp:TextBox Text='<%# Bind("perfil") %>' runat="server" ID="perfilTextBox" /><br />
            nprocesso:
            <asp:TextBox Text='<%# Bind("nprocesso") %>' runat="server" ID="nprocessoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            nome:
            <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /><br />
            palavra_passe:
            <asp:TextBox TextMode="Password" Text='<%# Bind("palavra_passe") %>' runat="server" ID="palavra_passeTextBox" /><br />
            confirme a palavra passe:
            <asp:TextBox runat="server" ID="TextBox1" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="As palavras passe têm de ser iguais." ControlToCompare="palavra_passeTextBox" ControlToValidate="TextBox1" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False"></asp:CompareValidator>
            <br />
            perfil:
            <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("perfil") %>'>
                <asp:ListItem Value="1">Aluno</asp:ListItem>
                <asp:ListItem Value="0">Admin</asp:ListItem>
            </asp:DropDownList>
            <br />
            nprocesso:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlAlunos" DataTextField="nome" DataValueField="nprocesso" SelectedValue='<%# Bind("nprocesso") %>'></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [alunos]
where nprocesso not in (select nprocesso from utilizadores where nprocesso is not null)"></asp:SqlDataSource>
            <br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            nome:
            <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /><br />
            palavra_passe:
            <asp:Label Text='<%# Bind("palavra_passe") %>' runat="server" ID="palavra_passeLabel" /><br />
            perfil:
            <asp:Label Text='<%# Bind("perfil") %>' runat="server" ID="perfilLabel" /><br />
            nprocesso:
            <asp:Label Text='<%# Bind("nprocesso") %>' runat="server" ID="nprocessoLabel" /><br />
            <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlUtilizadores" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' InsertCommand="INSERT INTO utilizadores(nome, palavra_passe, perfil, nprocesso) VALUES (@nome, HASHBYTES('SHA2_512', @palavra_passe), @perfil, @nprocesso)" SelectCommand="select * from utilizadores">
        <InsertParameters>
            <asp:Parameter Name="nome" DbType="AnsiString"></asp:Parameter>
            <asp:Parameter Name="palavra_passe" DbType="AnsiString"></asp:Parameter>
            <asp:Parameter Name="perfil"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
