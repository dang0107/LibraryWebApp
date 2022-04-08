<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Library.Master" AutoEventWireup="true" CodeBehind="add_books.aspx.cs" Inherits="LibraryWebApp.admin.add_books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .form-group {
            width: 508px;
            margin-left: 554px;
            margin-top: 20px;
        }

        .card-header {
            margin-left: 710px;
        }

        .btn {
            margin-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <div>
            <div class="card-header">
                <strong class="card-title">Add New Books</strong>
            </div>
            <div>
                <div>
                    <div>
                        <form method="post" novalidate="novalidate">
                            <div class="form-group">
                                <label for="" class="control-label mb-1">
                                    Book Title: 
                                <asp:TextBox ID="bookstitle" runat="server" class="form-control" Style="margin-left: 71px" Width="130px"></asp:TextBox>
                                </label>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label mb-1">Books Author Name: </label>
                                <asp:DropDownList ID="ddl" AutoPostBack="true" runat="server" Height="20px" Style="margin-left: 10px" Width="135px" OnSelectedIndexChanged="ddl_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:TextBox ID="authorname" runat="server" class="form-control" Style="margin-left: 51px" Width="120px"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label mb-1">Book Isbn: </label>
                                <asp:TextBox ID="isbn" runat="server" class="form-control" Style="margin-left: 71px" Width="130px"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label mb-1">
                                    Book Qty: 
                                <asp:TextBox ID="qty" runat="server" class="form-control" Style="margin-left: 75px" Width="130px"></asp:TextBox>
                                </label>
                            </div>
                            <div>
                                <asp:Button ID="b1" runat="server" class="btn" Text="Add Books" OnClick="b1_Click" Style="margin-left: 704px" />
                            </div>
                            <div class="alert alert-success" id="msg" runat="server" style="margin-top: 10px; display: none">
                                <strong>Added Successfully!</strong>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <!-- .card -->

    </div>
    <!--/.col-->
</asp:Content>
