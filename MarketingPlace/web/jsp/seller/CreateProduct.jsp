
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
            /* 1. ??t form v? font-size 0 ?? text th?a (text nodes) không hi?n th? */
.needs-validation {
  font-size: 0;
}

/* 2. Khôi ph?c l?i font-size cho các ph?n t? form h?p l? */
.needs-validation .form-label,
.needs-validation .form-control,
.needs-validation .form-select,
.needs-validation textarea,
.needs-validation button {
  font-size: 1rem; /* ho?c kích th??c b?n mu?n */
}

/* 3. ??m b?o grid ho?t ??ng ?n ??nh */
.needs-validation .row {
  margin: 0 -0.5rem;
}
.needs-validation .col-6 {
  padding: 0 0.5rem;
}

/* 4. Thêm kho?ng cách gi?a các tr??ng */
.needs-validation .col-6 {
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
                    <h1>Create Product</h1>
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-12">
                            <div class="bg-light rounded h-100 p-4">
                                <c:if test="${not empty errorMessage}">
                                    <div class="alert alert-danger">
                                      ${errorMessage}
                                    </div>
                                  </c:if>
                                <form class="row g-3 needs-validation" action="seller/create-product" method="post" enctype="multipart/form-data">
                                     Product Name 
                                    <div class="col-6">
                                        <label for="productName" class="form-label">Product Name</label>
                                        <input type="text" class="form-control" id="productName" name="productName" required>
                                    </div>
                                     Category 
                                    <div class="col-6">
                                        <label for="categoryID" class="form-label">Category</label>
                                        <select class="form-select" id="categoryID" name="categoryID" required>
                                            <option selected disabled value="">Choose a Category...</option>
                                            <c:forEach items="${categories}" var="s">
                                                <option value="${s.categoryID}">${s.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-md-12">
                                        <label for="description" class="form-label">Description</label>
                                        <textarea type="text" class="form-control" id="description" name="description"></textarea>
                                    </div>

                                    <div class="col-md-12">
                                        <label for="image" class="form-label">Image</label>
                                        <input type="file" id="image" class="form-control image" name="image" required onchange="previewImage(this)" multiple="">
                                        <div class="preview-container"></div>
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
                                                <tr>
                                                    <td>
                                                        <select class="form-select" id="color" name="color[]" required>
                                                            <option selected disabled value="">Choose a Color...</option>
                                                            <c:forEach items="${colors}" var="c">
                                                                <option value="${c.id}">${c.name}</option>
                                                            </c:forEach>

                                                        </select>
                                                    </td>
                                                    <td> <select class="form-select" id="size" name="size[]" required>
                                                            <option selected disabled value="">Choose a Size...</option>

                                                            <c:forEach items="${sizes}" var="c">
                                                                <option value="${c.id}">${c.name}</option>
                                                            </c:forEach>
                                                        </select></td>
                                                    <td><input type="number" class="form-control price" name="price[]" min="0" step="1" oninput="this.value = this.value.replace(/[^0-9]/g, '')" required></td>
                                                    <td><input type="number" class="form-control quantity" name="quantity[]" min="0" step="1" oninput="this.value = this.value.replace(/[^0-9]/g, '')" required></td>
                                                    <td><button type="button" class="btn btn-danger btn-sm removeRow">Remove</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                     Submit Button 
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit">Create Product</button>
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
                                                        event.preventDefault(); // Ng?n không cho g?i form
                                                    }
                                                    if (hasDuplicateVariants()) {
                                                        alert("Duplicate product variants are not allowed. Please check color and size.");
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
                                                            return false; // Thoát kh?i vòng l?p
                                                        }
                                                        variants.add(key);
                                                    });

                                                    return isDuplicate;
                                                }

                                                // X? lý nút xóa, ??m b?o luôn còn ít nh?t m?t dòng
                                                // X? lý xóa dòng
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


                                                // X? lý thêm dòng m?i
                                                $("#addVariant").click(function () {
                                                    let newRow = `
                   <tr>
                       <td>
                           <select class="form-select" name="color[]" required>
                               <option selected disabled value="">Choose a Color...</option>
                <c:forEach items="${colors}" var="c">
                                                                   <option value="${c.id}">${c.name}</option>
                </c:forEach>
                           </select>
                       </td>
                       <td> 
                           <select class="form-select" name="size[]" required>
                               <option selected disabled value="">Choose a Size...</option>
                <c:forEach items="${sizes}" var="c">
                                                                   <option value="${c.id}">${c.name}</option>
                </c:forEach>
                           </select>
                       </td>
                       <td><input type="number" class="form-control price" name="price[]" min="0" step="1" oninput="this.value = this.value.replace(/[^0-9]/g, '')" required></td>
                            <td><input type="number" class="form-control quantity" name="quantity[]" min="0" step="1" oninput="this.value = this.value.replace(/[^0-9]/g, '')" required></td>
                       <td><button type="button" class="btn btn-danger btn-sm removeRow">Remove</button></td>
                   </tr>`;
                                                    $("#productvariantsTable tbody").append(newRow);
                                                });
                                                // Preview hình ?nh
                                                window.previewImage = function (input) {
                                                    let files = input.files;
                                                    let container = $(input).siblings(".preview-container");
                                                    container.empty(); // Xóa các ?nh c?

                                                    if (files) {
                                                        Array.from(files).forEach(file => {
                                                            let reader = new FileReader();
                                                            reader.onload = function (e) {
                                                                let img = $("<img>")
                                                                        .attr("src", e.target.result)
                                                                        .addClass("img-preview")
                                                                        .css({width: "50px", height: "50px", margin: "5px"}); // tu? ch?nh thêm
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
