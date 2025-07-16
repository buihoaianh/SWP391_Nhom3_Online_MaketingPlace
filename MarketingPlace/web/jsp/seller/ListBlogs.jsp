<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Categories" %>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

        <style>
            h1 {
                color: #435EBE;
                font-size: 2.25rem;
                font-weight: 700;
                margin-bottom: 1.5rem;
            }

            .controls {
                margin-bottom: 1.25rem;
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
            }

            .controls input[type="text"] {
                padding: 0.5rem 0.75rem;
                border: 1px solid #ced4da;
                border-radius: 4px;
                width: 260px;
            }

            .controls button {
                padding: 0.5rem 1rem;
                background-color: #435EBE;
                color: #fff;
                border: none;
                border-radius: 4px;
                transition: background-color 0.2s ease-in-out;
            }

            .controls button:hover {
                background-color: #0b5ed7;
            }

            .add-new {
                margin: 1rem 0;
            }

            .add-new a {
                display: inline-block;
                background-color: #198754;
                color: white;
                padding: 0.5rem 1rem;
                border-radius: 4px;
                font-weight: 600;
                text-decoration: none;
                transition: background-color 0.2s ease;
            }

            .add-new a:hover {
                background-color: #157347;
            }

            table {
                width: 100%;
                background-color: white;
                border-collapse: collapse;
                border-radius: 6px;
                overflow: hidden;
                box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            }

            th, td {
                padding: 0.75rem 1rem;
                text-align: center;
                border-bottom: 1px solid #dee2e6;
            }

            th {
                background-color: #435EBE;
                color: white;
                text-transform: uppercase;
                font-size: 0.9rem;
                letter-spacing: 0.05em;
            }

            tr:last-child td {
                border-bottom: none;
            }

            tbody tr:hover {
                background-color: #f1f9ff;
                cursor: pointer;
                transition: 0.2s ease;
            }

            .action-btn {
                display: inline-block;
                padding: 0.4rem 0.75rem;
                font-size: 0.875rem;
                font-weight: 500;
                color: #fff;
                background-color: #435EBE;
                border-radius: 4px;
                text-decoration: none;
                transition: background-color 0.2s ease;
            }

            .action-btn:hover {
                background-color: #0b5ed7;
            }

            img {
                max-height: 80px;
                border-radius: 6px;
                object-fit: cover;
            }

            @media (max-width: 768px) {
                .controls {
                    flex-direction: column;
                }

                .controls form {
                    width: 100%;
                }

                .controls input[type="text"] {
                    width: 100%;
                }

                table th, table td {
                    font-size: 0.875rem;
                    padding: 0.5rem;
                }
            }

            .main-content-card {
                background-color: #fff;
                border: 1px solid #dee2e6;
                border-radius: 10px;
                padding: 30px 40px;
                box-shadow: 0 0 20px rgba(0,0,0,0.05);
                animation: fadeIn 0.6s ease-in-out;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(15px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animate-fade-in {
                animation: fadeIn 0.5s ease;
            }

            .pagination a, .pagination span {
                display: inline-block;
                padding: 6px 12px;
                border: 1px solid #007bff;
                border-radius: 4px;
                margin: 0 4px;
                text-decoration: none;
                color: #007bff;
                font-weight: 500;
                transition: background-color 0.2s ease;
            }

            .pagination a:hover {
                background-color: #007bff;
                color: white;
            }

            .pagination span {
                background-color: #007bff;
                color: white;
            }

            .pagination-wrapper {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            .pagination .page {
                display: inline-block;
                margin: 0 4px;
                padding: 6px 12px;
                border-radius: 6px;
                border: 1px solid #007bff;
                color: #007bff;
                text-decoration: none;
                transition: 0.2s ease;
                font-weight: 500;
            }

            .pagination .page:hover {
                background-color: #435EBE;
                color: white;
            }

            .pagination .current {
                background-color: #435EBE;
                color: white;
                pointer-events: none;
            }

        </style>

    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="logo d-flex align-items-center">
                        <a href="saller-dashboard">
                            <img src="${pageContext.request.contextPath}/asset/images/logo/logo.png" alt="Logo"
                                 style="max-width: 180px; height: auto;">
                        </a>
                    </div>
                    <jsp:include page="slider.jsp"/>
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>

            <div id="main">
                <div class="main-content-card animate-fade-in">
                    <h1>List Blogs</h1>

                    <div class="controls">
                        <form action="BlogURL" method="get">
                            <input type="hidden" name="service" value="searchBlog"/>
                            <input type="text" name="keyword" value="${searchKeyword}" placeholder="Search by title..." required/>
                            <button type="submit">Search</button>
                        </form>

                        <form action="BlogURL" method="get">
                            <input type="hidden" name="service" value="listBlogs"/>
                            <button type="submit">View All</button>
                        </form>
                    </div>

                    <div class="add-new" style="margin: 10px 0;">
                        <a href="BlogURL?service=insertForm">Add New Blog</a>
                    </div>

                    <!--                    <table>
                                            <thead>
                                                <tr>
                                                    <th>Thumbnail</th>
                                                    <th>Blog ID</th>
                                                    <th>Title</th>
                                                    <th>Category</th>
                                                    <th>Status</th>
                                                    <th>Created At</th>
                                                    <th>Update</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                    <c:forEach var="blog" items="${blogData}">
                        <tr>
                            <td><img src="${blog.thumbnailURL}" width="100"/></td>
                            <td>${blog.blogID}</td>
                            <td>${blog.title}</td>
                            <td>${blog.categoryID}</td>
                            <td>${blog.status}</td>
                            <td>${blog.createdAt}</td>
                            <td><a class="action-btn" href="BlogURL?service=updateForm&id=${blog.blogID}">Update</a></td>
                            <td><a class="action-btn" href="BlogURL?service=deleteBlog&id=${blog.blogID}" onclick="return confirm('Are you sure?')">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>-->
                    <table>
                        <thead>
                            <tr>
                                <th>Thumbnail</th>
                                <th>Blog ID</th>
                                <th>Title</th>
                                <th>Category</th>
                                <th>Status</th>
                                <th>Created At</th>
                                <th>Action</th> <!-- Gộp lại thành 1 -->
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="blog" items="${blogData}">
                                <tr>
                                    <td><img src="${blog.thumbnailURL}" width="100"/></td>
                                    <td>${blog.blogID}</td>
                                    <td>${blog.title}</td>
                                    <td>${blog.categoryID}</td>
                                    <td>${blog.status}</td>
                                    <td>${blog.createdAt}</td>
                                    <td>
                                        <a href="BlogDetailURL?service=blogDetail&id=${blog.blogID}" title="View">
                                            <i class="fa fa-eye text-success"></i>
                                        </a>
                                        <a href="BlogURL?service=updateForm&id=${blog.blogID}" title="Update">
                                            <i class="fa fa-edit text-primary"></i>
                                        </a>
                    <!--                    <a href="BlogURL?service=deleteBlog&id=${blog.blogID}" onclick="return confirm('Are you sure?')" title="Delete">
                                            <i class="fa fa-trash text-danger"></i>
                                        </a>-->
                                        <!-- Nút mở modal, gắn dữ liệu blog ID -->
                                        <a href="#" 
                                           class="delete-btn"
                                           data-blogid="${blog.blogID}" 
                                           data-blogtitle="${blog.title}"
                                           data-bs-toggle="modal" 
                                           data-bs-target="#confirmDeleteModal"
                                           title="Delete">
                                            <i class="fa fa-trash text-danger"></i>
                                        </a>

                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>


                    <!-- Pagination -->
                    <div class="pagination-wrapper mt-4">
                        <c:if test="${totalPages >= 1}">
                            <div class="pagination">
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <c:choose>
                                        <c:when test="${i == currentPage}">
                                            <span class="page current">${i}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="BlogURL?service=listBlogs&page=${i}" class="page">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Bootstrap -->
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title" id="deleteModalLabel">Confirm blog deletion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete the blog: <strong id="modalBlogTitle"></strong>?
                    </div>
                    <div class="modal-footer">
                        <form id="deleteForm" method="get" action="BlogURL">
                            <input type="hidden" name="service" value="deleteBlog" />
                            <input type="hidden" name="id" id="modalBlogId" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-danger">Xóa</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const deleteButtons = document.querySelectorAll('.delete-btn');
                const blogIdInput = document.getElementById('modalBlogId');
                const blogTitleSpan = document.getElementById('modalBlogTitle');

                deleteButtons.forEach(btn => {
                    btn.addEventListener('click', () => {
                        const blogId = btn.getAttribute('data-blogid');
                        const blogTitle = btn.getAttribute('data-blogtitle');

                        blogIdInput.value = blogId;
                        blogTitleSpan.textContent = blogTitle;
                    });
                });
            });
        </script>

        <script src="${pageContext.request.contextPath}/asset/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/vendors/apexcharts/apexcharts.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/pages/dashboard.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
    </body>

</html>