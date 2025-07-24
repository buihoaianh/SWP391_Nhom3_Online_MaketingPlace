

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page import="model.Product" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Categories</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/iconly/bold.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/app.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/asset/images/favicon.svg" type="image/x-icon">
        <style>
/* 1. Giấu toàn bộ text node trực tiếp trong form */
.needs-validation {
  font-size: 0;
}

/* 2. Khôi phục lại font-size cho các thẻ div.col‑* (và con của chúng) */
.needs-validation > div {
  font-size: 1rem;      /* bật lại text cho tất cả container col- */
}

/* 3. Nếu cần, tinh chỉnh thêm spacing */
.needs-validation .col-md-6,
.needs-validation .col-12 {
  margin-bottom: 1rem;
}

        </style>

    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="logo d-flex align-items-center">
                        <a href="seller-dashboard">
                            <img src="${pageContext.request.contextPath}/asset/images/logo/logo.png"
                                 alt="Logo"
                                 style="max-width: 180px; height: auto;">
                        </a>
                    </div>
                    <jsp:include page="slider.jsp" />
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>
            <div id="main">
                <div class="main-content-card animate-fade-in">
                    <h1>Edit Product</h1>
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-12">
                            <div class="bg-light rounded h-100 p-4">
                                <form class="row g-3 needs-validation" action="seller/edit-product" method="post" enctype="multipart/form-data">
                                     Product Name 
                                    <div class="col-md-6">
                                        <label for="productName" class="form-label">Product Name</label>
                                        <input type="hidden" class="form-control" id="productID" name="productID" value="${p.productId}">
                                        <input type="hidden" class="form-control" id="oldImage" name="oldImage" value="${p.thumbnailURL}">
                                        <input type="text" class="form-control" id="productName" name="productName" required value="${p.productName}">
                                    </div>
                                     Category 
                                    <div class="col-md-6">
                                        <label for="categoryID" class="form-label">Categories</label>
                                        <select class="form-select" id="categoryID" name="categoryID" required>
                                            <option selected disabled value="">Choose a Category...</option>
                                            <c:forEach items="${categories}" var="ca">
                                                <option value="${ca.categoryID}" ${p.categoryID eq ca.categoryID ? 'selected' : '' }>${ca.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-md-12">
                                        <label for="description" class="form-label">Description</label>
                                        <textarea type="text" class="form-control" id="description" name="description">${p.description}</textarea>
                                    </div>


                                    <div class="col-md-12">
                                        <label for="image" class="form-label">Image</label>
                                        <input type="file" id="image" class="form-control image" name="image" onchange="previewImage(this)" multiple="">
                                        <div class="preview-container">
                                            <c:forEach items="${p.images}" var="i">
                                                <img src="${pageContext.request.contextPath}/${i.imageUrl}" alt="Preview" class="img-preview mt-2" style="width: 50px; height: 50px; margin: 5px">
                                            </c:forEach>
                                        </div>
                                    </div>

                                     Status 
                                    <div class="col-md-12">
                                        <label for="status" class="form-label">Status</label>
                                        <select class="form-select" id="status" name="status" required>
                                            <option value="Active" ${p.status eq 'Active' ? 'selected' : '' }>Active</option>
                                            <option value="Inactive" ${p.status eq 'Inactive' ? 'selected' : '' }>Inactive</option>
                                        </select>
                                    </div>
                                     Product Variant Table 
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

                                     Submit Button 
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit">Edit Product</button>
                                        <a class="btn btn-danger" href="${pageContext.request.contextPath}/seller/products">Cancel</a>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>



                </div>
            </div>

            <script src="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/asset/vendors/apexcharts/apexcharts.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/pages/dashboard.js"></script>
            <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
            
             JavaScript Libraries 
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

             Template Javascript 
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
                                                    let files = input.files;
                                                    let container = $(input).siblings(".preview-container");
                                                    container.empty(); // Xóa các ảnh cũ

                                                    if (files) {
                                                        Array.from(files).forEach(file => {
                                                            let reader = new FileReader();
                                                            reader.onload = function (e) {
                                                                let img = $("<img>")
                                                                        .attr("src", e.target.result)
                                                                        .addClass("img-preview")
                                                                        .css({width: "50px", height: "50px", margin: "5px"}); // tuỳ chỉnh thêm
                                                                container.append(img);
                                                            };
                                                            reader.readAsDataURL(file);
                                                        });
                                                    }
                                                };

                                            });
            </script>
    </body>

</html>
            
            