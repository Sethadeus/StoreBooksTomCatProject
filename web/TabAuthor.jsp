<%@ page pageEncoding="UTF-8" %>

<button type="button" class="btn btn-outline-primary" id="MainCreateAuth"
        style="margin: 4px; margin-left: calc(20% + 15px)"
        data-bs-target="#CreateAuthorModal"
        data-bs-toggle="modal"
        onclick="CreateAuthor()">
    <i class="fa-solid fa-plus"></i> Добавить нового автора
</button>

<div class="row booksCollection">
    <c:forEach var="auth" items="${authList}">
        <div class="cardd col-xl-3 col-md-4 col-sm-6 col-12">
            <div class="card mb-3">

                <div class="editCardBut">
                    <i class="fa-solid fa-marker" style="font-size: 20px;"
                       data-id="${auth.getId_author()}"
                       data-name="${auth.getName_author()}"
                       data-desc="${auth.getDescription_author()}"
                       data-path="${auth.getIcon_author_path()}"
                       data-bs-target="#editAuthorModal"
                       data-bs-toggle="modal"
                       onclick="FillEditAuthorModal(this)">
                    </i>
                </div>

                <div class="delCardBut">
                    <i class="fa-solid fa-trash-can" style="font-size: 20px;"
                       data-id="${auth.getId_author()}"
                       data-bs-target="#DelAuthorModal"
                       data-bs-toggle="modal"
                       onclick="DelAuthor(this)">
                    </i>
                </div>

                <div style="padding: 25px; padding-bottom: 0">
                    <div style="display: inline-block; overflow: hidden" class="scalingImg">
                        <img class="card-img-top img-fluid"
                             src="${request.contextPath}author/${auth.getIcon_author_path()}" alt="Уупс" width="400">
                    </div>
                </div>

                <div class="card-body" style="padding-bottom: 0;">

                    <form action="AuthorShow" method="get" style="margin: 0">
                        <input name="id" style="display: none" value="${auth.getId_author()}"/>
                        <input name="name" style="display: none" value="${auth.getName_author()}"/>
                        <button type="submit" name="your_name" value="your_value" class="btn-link"
                                style="background: transparent; border-width: 0; width: 100%">
                                ${auth.getName_author()}
                        </button>
                    </form>

                    <%--<h6 align="center"><a class="card-title" href="/" style="word-wrap: normal">${auth.getName_author()}</a></h6>--%>

                    <div class="row">
                        <small class="text-truncate text-muted" >
                                ${auth.getDescription_author()}
                        </small>
                    </div>

                </div>

                <div class="card-footer" style="padding-top: 0">

                </div>

            </div>
        </div>
    </c:forEach>
</div>