<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Library.Master" AutoEventWireup="true" CodeBehind="edit_books.aspx.cs" Inherits="LibraryWebApp.admin.change_quantity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .form-group {
            width: 373px;
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
                <strong class="card-title">Change Quantity</strong>
            </div>
            <div>
                <div>
                    <div>
                        <form method="post" novalidate="novalidate">
                            <div class="form-group">
                                <label for="" class="control-label mb-1">
                                    Book Title:</label> 
                                <asp:TextBox ID="bookstitle" runat="server" class="form-control" Style="margin-left: 71px" Width="130px"></asp:TextBox>
                               
                            </div>
                        
                            <div class="form-group">
                                <label for="" class="control-label mb-1">
                                    Book Qty: 
                                <asp:TextBox ID="qty" runat="server" class="form-control" Style="margin-left: 75px" Width="130px"></asp:TextBox>
                                </label>
                            </div>
                            <div>
                                <asp:Button ID="b1" runat="server" class="btn" Text="Update" Style="margin-left: 704px" OnClick="b1_Click" />
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
