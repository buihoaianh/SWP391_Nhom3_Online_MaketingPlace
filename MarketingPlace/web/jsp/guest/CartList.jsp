<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Cart" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <style>
            .cart-item img {
                max-width: 100px;
                height: auto;
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <div class="header">
            <%
                ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
                int cartSize = (cart != null) ? cart.size() : 0;
            %>
        </div>

        <div class="container mt-5">
            <h1>Your Shopping Cart</h1>
            <%
                if (cart == null || cart.isEmpty()) {
            %>
            <div class="alert alert-info" role="alert">
                Your cart is empty!
            </div>
            <%
                } else {
            %>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Product Image</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int index = 0;
                        double grandTotal = 0;
                        for (Cart item : cart) {
                            double total = Double.parseDouble(item.getProduct().getPrice()) * item.getQuantity();
                            grandTotal += total;
                    %>
                    <tr>
                        <th scope="row"><%= (index + 1) %></th>
                        <td>
                            <div class="cart-item">
                                <img src="<%= item.getProduct().getImageURL() %>" alt="Product Image">
                            </div>
                        </td>
                        <td><%= item.getProduct().getProductName() %></td>
                        <td>$<%= String.format("%.2f", Double.parseDouble(item.getProduct().getPrice())) %></td>
                        <td>
                            <div class="input-group input-group-sm" style="width: 120px;">
                                <button 
                                    class="btn btn-outline-secondary" 
                                    type="button" 
                                    onclick="updateQuantity(<%= item.getProduct().getProductId() %>, - 1)"
                                    >
                                    -
                                </button>
                                <input type="number" class="form-control quantity-input" value="<%= item.getQuantity() %>" min="1" onchange="updateQuantity(<%= index %>, this.value)">
                                <button class="btn btn-outline-secondary" type="button" onclick="updateQuantity(<%= item.getProduct().getProductId() %>, 1)">+</button>
                            </div>
                        </td>
                        <td>$<%= String.format("%.2f", total) %></td>
                        <td>
                            <a href="/your-project/removeFromCart?index=<%= index %>" class="btn btn-danger btn-sm">
                                <i class="bi bi-trash"></i> Remove
                            </a>
                        </td>
                    </tr>
                    <%
                            index++;
                        }
                    %>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5" class="text-end"><strong>Grand Total:</strong></td>
                        <td><strong>$<%= String.format("%.2f", grandTotal) %></strong></td>
                        <td></td>
                    </tr>
                </tfoot>
            </table>
            <div class="text-end">
                <a href="/your-project/checkout" class="btn btn-success">Checkout</a>
            </div>
            <%
                }
            %>
            <a href="/your-project/products" class="btn btn-primary mt-3">Continue Shopping</a>
        </div>

        <!-- Bootstrap JS and Popper -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
        <script>
                                        function updateQuantity(productId, newQuantity) {
                                            fetch('/MarketingPlace/addToCart?productId=' + productId + '&quantity=' + newQuantity, {
                                                method: 'POST'
                                            })
                                                    .then(response => response.json())
                                                    .then(data => {
                                                        if (data.success) {
                                                            window.location.href = "cartList";
                                                        } else {
                                                            alert('Failed to update quantity: ' + data.message);
                                                        }
                                                    })
                                                    .catch(error => {
                                                        console.error('Error:', error);
                                                        alert('An error occurred!');
                                                    });
                                        }
        </script>
    </body>
</html>