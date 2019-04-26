<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="notas_aluno.aspx.cs" Inherits="M7_TrabalhoModelo_t1.Aluno.notas_aluno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlNotas">
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="nrmodulo" HeaderText="nrmodulo" SortExpression="nrmodulo"></asp:BoundField>
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data"></asp:BoundField>
            <asp:BoundField DataField="valor" HeaderText="valor" SortExpression="valor"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT disciplinas.nome, notas.nrmodulo, notas.data, notas.valor FROM notas INNER JOIN disciplinas ON notas.id_disciplina = disciplinas.id WHERE (notas.nprocesso = @nprocesso)">
        <SelectParameters>
            <asp:SessionParameter SessionField="nprocesso" Name="nprocesso"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
