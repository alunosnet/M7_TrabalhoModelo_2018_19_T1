<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Gerir.aspx.cs" Inherits="M7_TrabalhoModelo_t1.Admin.Disciplinas.Gerir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDisciplinas" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
            <asp:TemplateField HeaderText="nome" SortExpression="nome">
                <EditItemTemplate>
                    <asp:TextBox MaxLength="40" runat="server" Text='<%# Bind("nome") %>' ID="nomeTextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tem de indicar um nome." ControlToValidate="nomeTextBox" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nome") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="nrmodulos" SortExpression="nrmodulos">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("nrmodulos") %>' ID="nrmodulosTextBox"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Tem de indicar o número de módulos." ControlToValidate="nrmodulosTextBox" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False"></asp:RequiredFieldValidator>            
                     <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Tem de indicar um valor entre 1 e 30." ControlToValidate="nrmodulosTextBox" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False" Type="Integer" MinimumValue="1" MaximumValue="30"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nrmodulos") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="curso" SortExpression="curso">
                <EditItemTemplate>
                    <asp:TextBox MaxLength="40" runat="server" Text='<%# Bind("curso") %>' ID="cursoTextBox"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Tem de indicar o curso." ControlToValidate="cursoTextBox" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False"></asp:RequiredFieldValidator>            
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("curso") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="delete from disciplinas where id=@id" SelectCommand="select * from disciplinas" UpdateCommand="UPDATE disciplinas SET nome = @nome, nrmodulos = @nrmodulos, curso = @curso WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome"></asp:Parameter>
            <asp:Parameter Name="nrmodulos"></asp:Parameter>
            <asp:Parameter Name="curso"></asp:Parameter>
            <asp:Parameter Name="id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
