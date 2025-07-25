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
        <title>Update Member</title>
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
            .form-container {
                max-width: 800px;
                margin: 50px auto;
                background: white;
                padding: 30px 40px;
                border-radius: 16px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
                margin-left: 350px;
                padding-left: 100px;
                padding-right: 100px;
                margin-top: 30px;
            }

            h2 {
                text-align: center;
                margin-bottom: 30px;
                font-weight: bold;
                color: #3E61D4;
            }
            label {
                font-weight: 600;
                color: #3192D3;
            }
            .btn-update {
                background-color: #3192D3;
                color: white;
                font-weight: 600;
            }
            .btn-update:hover {
                background-color: #2c4fb1;
            }
            img.preview {
                max-height: 80px;
                border-radius: 4px;
                margin-top: 5px;
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

            .btn-outline-primary.btn-sm {
                padding: 4px 12px;
                font-size: 14px;
                font-weight: 500;
            }

            .preview {
                max-height: 80px;
                border-radius: 4px;
                margin-top: 8px;
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
                <h1>Update Member</h1>

                <form action="${pageContext.request.contextPath}/admin/MemberURL" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="service" value="updateMember" />
                    <input type="hidden" name="memberID" value="${member.memberID}" />

                    <div class="mb-3">
                        <label>Member Name</label>
                        <input type="text" name="memberName" class="form-control" value="${member.memberName}" required>
                    </div>

                    <div class="mb-3">
                        <label>Min Amount</label>
                        <input type="number" name="minAmount" class="form-control" value="${member.minAmount}" required>
                    </div>

                    <div class="mb-3">
                        <label>Max Amount</label>
                        <input type="number" name="maxAmount" class="form-control" value="${member.maxAmount}" required>
                    </div>

                    <div class="mb-3">
                        <label>Description</label>
                        <input type="text" name="description" class="form-control" value="${member.description}" required>
                    </div>

                    <div class="mb-3">
                        <label>Current Image</label>
                        <input type="text" class="form-control" value="${member.imageURL}" readonly>
                        <img src="${pageContext.request.contextPath}/${member.imageURL}" alt="Image" class="preview"/>
                    </div>


                    <div class="mb-4">
                        <label class="form-label fw-bold" style="color: #3192D3;">Upload New Image</label>
                        <div class="file-box d-flex align-items-center px-3 py-2">
                            <input type="file" id="newImageInput" name="imageFile" accept="image/*" hidden>
                            <label for="newImageInput" class="btn btn-outline-primary btn-sm me-3 mb-0">Choose File</label>
                            <span id="file-name" class="text-muted">No file chosen</span>
                        </div>
                        <img id="newImagePreview" class="preview" src="#" alt="Preview" style="display: none;" />
                    </div>

                    <div class = "text-center">
                        <button type="submit" class="btn btn-update px-4 py-2 ">Update</button>

                    </div>
                </form>
            </div>

            <script>
                const newImageInput = document.getElementById("newImageInput");
                const newImagePreview = document.getElementById("newImagePreview");
                const fileNameSpan = document.getElementById("file-name");

                newImageInput.addEventListener("change", function () {
                    const file = this.files[0];
                    if (file) {
                        fileNameSpan.textContent = file.name;

                        const reader = new FileReader();
                        reader.onload = function (e) {
                            newImagePreview.src = e.target.result;
                            newImagePreview.style.display = "block";
                        };
                        reader.readAsDataURL(file);
                    } else {
                        fileNameSpan.textContent = "No file chosen";
                        newImagePreview.src = "#";
                        newImagePreview.style.display = "none";
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


