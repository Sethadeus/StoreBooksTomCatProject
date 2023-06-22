<%@ page pageEncoding="UTF-8" %>

<div class="col-3">
    <!----------сам список---------->
    <c:forEach var="tagSel" items="${genreList}">
        <div class="input-group" style="margin: 7px">

            <button class="browse btn btnX px-3" type="button"
                    data-id="${tagSel.getId_genre()}"
                    data-bs-target="#DelGenreModal"
                    data-bs-toggle="modal"
                    onclick="DelGenre(this)">
                <i class="fas fa-times"></i>
            </button>

            <form id="EditGenreForm${tagSel.getId_genre()}" action="${pageContext.request.contextPath}/EditGenre" method="post" style="margin: 0">
                <input class="form-control" name="name" type="text" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px" value="${tagSel.getName_genre()}" data-id="${tagSel.getId_genre()}"/>
                <input placeholder="id" name="id" value="${tagSel.getId_genre()}" style="display: none">
            </form>

            <button class="browse btn btnP px-3" type="submit" form="EditGenreForm${tagSel.getId_genre()}">
                <i class="fas fa-check"></i>
            </button>

        </div>
    </c:forEach>

    <div class="input-group" style="margin: 7px">

        <form id="CreateGenreForm" action="${pageContext.request.contextPath}/CreateGenre" method="post" style="margin: 0; width:calc(100% - 100px)!important">
            <input class="form-control" name="name" type="text" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px;" placeholder="Название"/>
        </form>

        <button class="browse btn btnP px-3" type="submit" form="CreateGenreForm">
            <i class="fas fa-check"></i>
        </button>

    </div>

</div>