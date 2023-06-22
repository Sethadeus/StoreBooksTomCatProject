<%@ page pageEncoding="UTF-8" %>

<div class="row justify-content-start" style="padding-left: 20%">
    <div class="col-3">
        <!----------сам список---------->
        <c:forEach var="tagSel" items="${publishingHouseList}">
            <div class="input-group" style="margin: 7px">

                <button class="browse btn px-3 btnX" type="button"
                        data-id="${tagSel.getId_publishing_house()}"
                        data-bs-target="#DelPubModal"
                        data-bs-toggle="modal"
                        onclick="DelPub(this)">
                    <i class="fas fa-times"></i>
                </button>

                <form id="EditPubForm${tagSel.getId_publishing_house()}" action="${pageContext.request.contextPath}/EditPublishingHouse" method="post" style="margin: 0">
                    <input class="form-control" name="name" type="text" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px" value="${tagSel.getName_publishing_house()}" data-id="${tagSel.getId_publishing_house()}"/>
                    <input placeholder="id" name="id" value="${tagSel.getId_publishing_house()}" style="display: none">
                </form>

                <button class="browse btn px-3 btnP" type="submit" form="EditPubForm${tagSel.getId_publishing_house()}">
                    <i class="fas fa-check"></i>
                </button>

            </div>
        </c:forEach>

        <div class="input-group" style="margin: 7px">

            <form id="CreatePubForm" action="${pageContext.request.contextPath}/CreatePublishingHouse" method="post" style="margin: 0; width:calc(100% - 100px)!important">
                <input class="form-control" name="name" type="text" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px;" placeholder="Название"/>
            </form>

            <button class="browse btn btnP px-3" type="submit" form="CreatePubForm">
                <i class="fas fa-check"></i>
            </button>

        </div>

    </div>

    <%@include file="TabGenre.jsp" %>

</div>