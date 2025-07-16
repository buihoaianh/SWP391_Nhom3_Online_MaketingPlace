<%-- 
    Document   : InsertMember
    Created on : Jul 15, 2025, 4:25:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Add new Member</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

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

        <style>
            body {
                font-family: 'Heebo', sans-serif;
                background: #f8f9fa;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            h1 {
                color: #3E61D4;
                font-weight: 700;
                text-align: center;
                margin-bottom: 25px;
            }
            label {
                color: #3192D3;
                font-weight: 500;
            }
            .btn-submit {
                background-color: #3192D3;
                color: white;
                font-weight: 600;
            }
            .btn-submit:hover {
                background-color: #3192D3;
            }

            .custom-file-upload label {
                cursor: pointer;
                border-radius: 6px;
                font-weight: 500;
                transition: all 0.2s ease-in-out;
            }

            .custom-file-upload label:hover {
                background-color: #3192D3;
                color: white;
            }

            .file-box {
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 8px;
                width: 100%;
                max-width: 100%;
                transition: border-color 0.2s;
            }

            .file-box:hover {
                border-color: #3192D3;
            }

            .form-container {
                max-width: 700px;
                margin: 50px auto;
                border-radius: 20px;
                width: 2000px;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
                background-color: white;
                margin-left: 400px;
                margin-top: 100px;
                padding-left: 100px;
                padding-right: 100px;
                padding-bottom: 20px;
            }

            .btn-submit {
                background-color: #3192D3;
                color: white;
                font-weight: 600;
                border-radius: 30px;
                transition: background-color 0.2s ease;
            }

            .btn-submit:hover {
                background-color: #2575A5;
            }


        </style>

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

            <div class="content form-container">
                <h1>Insert New Member</h1>

                <form action="${pageContext.request.contextPath}/admin/MemberURL" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="service" value="insertMember"/>

                    <div class="mb-3">
                        <label for="memberName" class="form-label">Member Name</label>
                        <input type="text" class="form-control" id="memberName" name="memberName" required>
                    </div>

                    <div class="mb-3">
                        <label for="minPoint" class="form-label">Min Point</label>
                        <input type="number" class="form-control" id="minPoint" name="minPoint" required>
                    </div>

                    <div class="mb-3">
                        <label for="maxPoint" class="form-label">Max Point</label>
                        <input type="number" class="form-control" id="maxPoint" name="maxPoint" required>
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <input type="text" class="form-control" id="description" name="description" required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold" style="color: #3192D3;">Image File</label>
                        <div class="file-box d-flex align-items-center px-3 py-2">
                            <input type="file" id="imageFile" name="imageFile" accept="image/*" required hidden>
                            <label for="imageFile" class="btn btn-outline-primary btn-sm me-3 mb-0">Choose File</label>
                            <span id="file-name" class="text-muted">No file chosen</span>
                        </div>
                        <img id="previewImage" src="#" alt="Preview" style="display:none; max-height: 120px; margin-top: 10px; border-radius: 8px;" />

                    </div>
                    <button type="submit" class="btn btn-submit w-50 rounded-pill d-block mx-auto">Add Member</button>
                </form>
            </div>

            <script>
    const fileInput = document.getElementById("imageFile");
    const fileNameSpan = document.getElementById("file-name");
    const previewImage = document.getElementById("previewImage");

    fileInput.addEventListener("change", function () {
        const file = this.files[0];

        if (file) {
            fileNameSpan.textContent = file.name;

            const reader = new FileReader();
            reader.onload = function (e) {
                previewImage.src = e.target.result;
                previewImage.style.display = "block";
            };
            reader.readAsDataURL(file);
        } else {
            fileNameSpan.textContent = "No file chosen";
            previewImage.style.display = "none";
        }
    });
</script>


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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>


        <!-- Template Javascript -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>

</html>


