<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Library.Master" AutoEventWireup="true" CodeBehind="library.aspx.cs" Inherits="LibraryWebApp.admin.Library" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <html>
    <head>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
                margin-top: 10px;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }

            a {
                color: black;
                text-decoration: none;
                font-style: italic;
            }

                a:hover {
                    color: dimgrey;
                }


                a:active {
                    color: black;
                }
        </style>
    </head>
    <body>
        <h2>E-Library</h2>
        <asp:HyperLink ID="hyperlink" NavigateUrl="/admin/add_books.aspx" runat="server" Text="Add New Book"></asp:HyperLink>
        <hr />
        <div style="height: 70px; width: 608px; margin-left: 149px">
            <label for="" style="margin-right:20px; margin-left:10px">
                Filter by: <span />
            </label>
             <asp:RadioButton ID="radioBtn1" runat="server" Text="Show All Books" GroupName="books" style="margin-right:15px"/><span/> 
             <asp:RadioButton ID="radioBtn2" runat="server" Text="Available Books" GroupName="books" style="margin-right:15px"/> <span /> 
             <asp:RadioButton ID="radioBtn3" runat="server" Text="Book Taken By User" GroupName="books" style="margin-right:15px"/> <br />

            <asp:Button ID="filterBtn" runat="server" Text="Filter" OnClick="filterBtn_Click" style="height: 25px; width: 100px; margin-left: 200px; margin-top: 10px"/>
        </div>
        
        <div style="margin-top: 50px">
            <asp:Repeater ID="r1" runat="server">
                <HeaderTemplate>
                    <table id="example">
                        <thead>
                            <tr>
                                <th style="cursor: pointer" onclick="sortBy(0)">Books Title</th>
                                <th style="cursor: pointer" onclick="sortBy(1)">Books Author Name</th>
                                <th>ISBN</th>
                                <th>Available Quantity</th>
                                <th></th>

                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("books_title")%></td>
                        <td><%#Eval("book_author")%></td>
                        <td><%#Eval("books_isbn")%></td>
                        <td><%#Eval("available_qty")%></td>
                        <td><a href="edit_books.aspx?id=<%#Eval("id")%>">Edit</a> | 
                            <a href="remove_books.aspx?id=<%#Eval("id")%>">Remove</a>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </body>
    <!--<script>
        /*
        A few requirements for configuring the table:
        1. The table must have id="sortable", i.e. <table id="sortable">
        2. The table needs to have a table header, and the table header must have
           onclick="sortBy(n)", where n is the column number starting with 0
           i.e. <th onclick="sortBy(0)">Title of First Column</th>
        */

        cPrev = -1; // global var saves the previous c, used to
        // determine if the same column is clicked again

        function sortBy(c) {
            rows = document.getElementById("sortable").rows.length; // num of rows
            columns = document.getElementById("sortable").rows[0].cells.length; // num of columns
            arrTable = [...Array(rows)].map(e => Array(columns)); // create an empty 2d array

            for (ro = 0; ro < rows; ro++) { // cycle through rows
                for (co = 0; co < columns; co++) { // cycle through columns
                    // assign the value in each row-column to a 2d array by row-column
                    arrTable[ro][co] = document.getElementById("sortable").rows[ro].cells[co].innerHTML;
                }
            }

            th = arrTable.shift(); // remove the header row from the array, and save it

            if (c !== cPrev) { // different column is clicked, so sort by the new column
                arrTable.sort(
                    function (a, b) {
                        if (a[c] === b[c]) {
                            return 0;
                        } else {
                            return (a[c] < b[c]) ? -1 : 1;
                        }
                    }
                );
            } else { // if the same column is clicked then reverse the array
                arrTable.reverse();
            }

            cPrev = c; // save in previous c

            arrTable.unshift(th); // put the header back in to the array

            // cycle through rows-columns placing values from the array back into the html table
            for (ro = 0; ro < rows; ro++) {
                for (co = 0; co < columns; co++) {
                    document.getElementById("sortable").rows[ro].cells[co].innerHTML = arrTable[ro][co];
                }
            }
        }
    </script>-->

    </html>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#example').DataTable({
                "pagingType": "full_numbers"
            });
        });
    </script>
</asp:Content>
