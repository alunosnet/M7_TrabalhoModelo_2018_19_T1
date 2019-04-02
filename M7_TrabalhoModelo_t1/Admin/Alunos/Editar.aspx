<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Editar.aspx.cs" Inherits="M7_TrabalhoModelo_t1.Admin.Alunos.Editar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Editar aluno</h1>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="nprocesso" DataSourceID="SqlAlunos">
        <EditItemTemplate>
            Nome:
            <asp:TextBox CssClass="form-control" MaxLength="60" Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nomeTextBox" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Tem de indicar um nome." EnableClientScript="False"></asp:RequiredFieldValidator>
            <br />
            Morada:
            <asp:TextBox CssClass="form-control" MaxLength="100" Text='<%# Bind("morada") %>' runat="server" ID="moradaTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Indique uma morada." ControlToValidate="moradaTextBox" Display="Dynamic" CssClass="alert-danger" EnableClientScript="False"></asp:RequiredFieldValidator>
            <br />
            Código Postal:
            <asp:TextBox CssClass="form-control" MaxLength="8" Text='<%# Bind("cp") %>' runat="server" ID="cpTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Tem de indicar um código postal." ControlToValidate="cpTextBox" CssClass="-danger" Display="Dynamic" EnableClientScript="False"></asp:RequiredFieldValidator>
            <asp:CustomValidator OnServerValidate="CustomValidator1_ServerValidate" ID="CustomValidator1" runat="server" ErrorMessage="O código postal não é válido. Deve ser no formato seguinte ####-###" ControlToValidate="cpTextBox" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False"></asp:CustomValidator>
            <br />
            Data Nascimento:
            <asp:TextBox CssClass="form-control" TextMode="Date" Text='<%# Bind("data_nascimento") %>' runat="server" ID="data_nascimentoTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Tem de indicar uma data de nascimento." ControlToValidate="data_nascimentoTextBox" CssClass="alert-danger" Display="Dynamic" EnableClientScript="False"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="A data indicada não é válida. Deve estar entre 1950 e 2050." ControlToValidate="data_nascimentoTextBox" CssClass="alert-danger" EnableClientScript="False" Type="Date" MaximumValue="31-12-2050" MinimumValue="01-01-1950"></asp:RangeValidator>
            <br />
            Género:
            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" SelectedValue='<%# Bind("genero") %>'>
                <asp:ListItem Value="M">Masculino</asp:ListItem>
                <asp:ListItem Value="F">Feminino</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            nome:
            <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /><br />
            morada:
            <asp:TextBox Text='<%# Bind("morada") %>' runat="server" ID="moradaTextBox" /><br />
            cp:
            <asp:TextBox Text='<%# Bind("cp") %>' runat="server" ID="cpTextBox" /><br />
            data_nascimento:
            <asp:TextBox Text='<%# Bind("data_nascimento") %>' runat="server" ID="data_nascimentoTextBox" /><br />
            genero:
            <asp:TextBox Text='<%# Bind("genero") %>' runat="server" ID="generoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            nprocesso:
            <asp:Label Text='<%# Eval("nprocesso") %>' runat="server" ID="nprocessoLabel" /><br />
            nome:
            <asp:Label Text='<%# Bind("nome") %>' runat="server" ID="nomeLabel" /><br />
            morada:
            <asp:Label Text='<%# Bind("morada") %>' runat="server" ID="moradaLabel" /><br />
            cp:
            <asp:Label Text='<%# Bind("cp") %>' runat="server" ID="cpLabel" /><br />
            data_nascimento:
            <asp:Label Text='<%# Bind("data_nascimento") %>' runat="server" ID="data_nascimentoLabel" /><br />
            genero:
            <asp:Label Text='<%# Bind("genero") %>' runat="server" ID="generoLabel" /><br />
            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="select * from alunos where nprocesso=@nprocesso" UpdateCommand="UPDATE alunos SET nome = @nome, morada = @morada, cp = @cp, data_nascimento = @data_nascimento, genero = @genero WHERE (nprocesso = @nprocesso)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" Name="nprocesso"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome"></asp:Parameter>
            <asp:Parameter Name="morada"></asp:Parameter>
            <asp:Parameter Name="cp"></asp:Parameter>
            <asp:Parameter Name="data_nascimento"></asp:Parameter>
            <asp:Parameter Name="genero"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <a href="Gerir.aspx">Voltar</a>
</asp:Content>
