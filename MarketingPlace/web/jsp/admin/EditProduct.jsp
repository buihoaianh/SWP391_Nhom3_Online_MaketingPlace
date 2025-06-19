<%-- 
    Document   : CreateProduct
    Created on : Jun 19, 2025, 10:00:23 PM
    Author     : Admin
--%>

<%-- 
    Document   : Dashboard
    Created on : May 27, 2025, 9:25:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>DASHBOARD - Bootstrap Admin Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <base href="${pageContext.request.contextPath}/">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/list-seller.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->


            <%@ include file="../../components/sidebarAdmin.jsp" %>

            <div class="content">
                <h1>Edit Product</h1>
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-12">
                            <div class="bg-light rounded h-100 p-4">
                                <form class="row g-3 needs-validation" action="admin/edit-product" method="post" enctype="multipart/form-data">
                                    <!-- Product Name -->
                                    <div class="col-md-6">
                                        <label for="productName" class="form-label">Product Name</label>
                                        <input type="hidden" class="form-control" id="productID" name="productID" value="${p.productId}">
                                        <input type="hidden" class="form-control" id="oldImage" name="oldImage" value="${p.imageUrl}">
                                        <input type="text" class="form-control" id="productName" name="productName" required value="${p.productName}">
                                    </div>
                                    <!-- Category -->
                                    <div class="col-md-6">
                                        <label for="categoryID" class="form-label">Category</label>
                                        <select class="form-select" id="categoryID" name="categoryID" required>
                                            <option selected disabled value="">Choose a Category...</option>
                                            <c:forEach items="${categories}" var="s">
                                                <option value="${s.categoryId}" ${p.categoryId eq s.categoryId ? 'selected' : '' }>${s.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-md-12">
                                        <label for="description" class="form-label">Description</label>
                                        <textarea type="text" class="form-control" id="description" name="description">${p.description}</textarea>
                                    </div>


                                    <div class="col-md-12">
                                        <label for="image" class="form-label">Image</label>
                                        <input type="file" id="image" class="form-control image" name="image" onchange="previewImage(this)">
                                        <img src="${p.imageUrl}" alt="Preview" class="img-preview mt-2" style="width: 50px; height: 50px;">
                                    </div>

                                    <!-- Status -->
                                    <div class="col-md-12">
                                        <label for="status" class="form-label">Status</label>
                                        <select class="form-select" id="status" name="status" required>
                                            <option value="Active" ${p.status eq 'Active' ? 'selected' : '' }>Active</option>
                                            <option value="Inactive" ${p.status eq 'Inactive' ? 'selected' : '' }>Inactive</option>
                                        </select>
                                    </div>
                                    <!-- Product Variant Table -->
                                    <div class="col-12">
                                        <label class="form-label">Product Variant</label>
                                        <button type="button" id="addVariant" class="btn btn-success btn-sm" style="float: right; margin-bottom: 16px">Add Variant</button>

                                        <table class="table table-bordered" id="productvariantsTable">
                                            <thead>
                                                <tr>
                                                    <th>Color</th>
                                                    <th>Size</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${p.productVariants}" var="o">
                                                    <tr>


                                                        <td>
                                                            <select class="form-select" id="color" name="color[]" required>
                                                                <option selected disabled value="">Choose a Color...</option>
                                                                <c:forEach items="${colors}" var="c">
                                                                    <option value="${c.id}" ${c.id == o.color.id ? 'selected' : '' }>${c.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </td>
                                                        <td> <select class="form-select" id="size" name="size[]" required>
                                                                <option selected disabled value="">Choose a Size...</option>
                                                                <c:forEach items="${sizes}" var="c">
                                                                    <option value="${c.id}" ${o.size.id == c.id ? 'selected' : '' }>${c.name}</option>
                                                                </c:forEach>
                                                            </select></td>
                                                        <td><input type="number" class="form-control price" name="price[]" min="0" step="1" oninput="this.value = this.value.replace(/[^0-9]/g, '')" required value="${o.price}"></td>
                                                        <td><input type="number" class="form-control quantity" name="quantity[]" min="0" step="1" oninput="this.value = this.value.replace(/[^0-9]/g, '')" required value="${o.quantity}"></td>
                                                        <td><button type="button" class="btn btn-danger btn-sm removeRow">Remove</button></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit">Edit Product</button>
                                        <a class="btn btn-danger" href="admin/products">Cancel</a>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib/chart/chart.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib/waypoints/waypoints.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/moment.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

            <!-- Template Javascript -->
            <script src="${pageContext.request.contextPath}/js/main.js"></script>

            <script>
                                            $(document).ready(function () {
                                                const form = document.querySelector("form");
                                                const tableBody = document.querySelector("#productvariantsTable tbody");
                                                $("form").on("submit", function (event) {
                                                    if (tableBody.children.length === 0) {
                                                        alert("You must add at least one product variant.");
                                                        event.preventDefault(); // Ngăn không cho gửi form
                                                    }
                                                    if (hasDuplicateVariants()) {
                                                        alert("Duplicate product variants are not allowed. Please check name, color, and size.");
                                                        event.preventDefault();
                                                    }
                                                });
                                                function hasDuplicateVariants() {
                                                    let variants = new Set();
                                                    let isDuplicate = false;

                                                    $("#productvariantsTable tbody tr").each(function () {
                                                        let color = $(this).find("select[name='color[]']").val();
                                                        let size = $(this).find("select[name='size[]']").val();

                                                        let key = color + "-" + size;
                                                        if (variants.has(key)) {
                                                            isDuplicate = true;
                                                            return false; // Thoát khỏi vòng lặp
                                                        }
                                                        variants.add(key);
                                                    });

                                                    return isDuplicate;
                                                }
                                                // Xử lý nút xóa, đảm bảo luôn còn ít nhất một dòng
                                                // Xử lý xóa dòng
                                                tableBody.addEventListener("click", function (event) {
                                                    if (event.target.classList.contains("removeRow")) {
                                                        const row = event.target.closest("tr");
                                                        if (tableBody.children.length > 1) {
                                                            row.remove();
                                                        } else {
                                                            alert("At least one product variant is required.");
                                                        }
                                                    }
                                                });


                                                // Xử lý thêm dòng mới
                                                $("#addVariant").click(function () {
                                                    let newRow = `
                               <tr>
                                   <td>
                                       <select class="form-select" name="color[]" required>
                                           <option selected disabled value="">Choose a Color...</option>
                <c:forEach items="${colors}" var="c">
                                                                                   <option value="${c.id}" ${c.id == o.color.id ? 'selected' : '' }>${c.name}</option>
                </c:forEach>
                                       </select>
                                   </td>
                                   <td> 
                                       <select class="form-select" name="size[]" required>
                                           <option selected disabled value="">Choose a Size...</option>
                <c:forEach items="${sizes}" var="c">
                                                                                   <option value="${c.id}" ${o.size.id == c.id ? 'selected' : '' }>${c.name}</option>
                </c:forEach>
                                       </select>
                                   </td>
                                   <td><input type="number" class="form-control price" name="price[]" min="0" step="1" oninput="this.value = this.value.replace(/[^0-9]/g, '')" required></td>
                            <td><input type="number" class="form-control quantity" name="quantity[]" min="0" step="1" oninput="this.value = this.value.replace(/[^0-9]/g, '')" required></td>
                                   <td><button type="button" class="btn btn-danger btn-sm removeRow">Remove</button></td>
                               </tr>`;
                                                    $("#productvariantsTable tbody").append(newRow);
                                                });
                                                // Preview hình ảnh
                                                window.previewImage = function (input) {
                                                    let file = input.files[0];
                                                    if (file) {
                                                        let reader = new FileReader();
                                                        reader.onload = function (e) {
                                                            $(input).siblings(".img-preview").attr("src", e.target.result).show();
                                                        };
                                                        reader.readAsDataURL(file);
                                                    }
                                                };

                                            });
            </script>
    </body>

</html>
