<%@ page pageEncoding="UTF-8" %>

<button type="button" class="btn btn-outline-primary" id="MainCreateBook"
        style="margin: 10px; margin-left: calc(20% + 15px)"
        data-bs-target="#CreateBookModal"
        data-bs-toggle="modal"
        onclick="CreateAuthor()">
    <i class="fa-solid fa-plus"></i> Добавить новую книгу
</button>

<%-------------------------------------------------------------ВСЕ-КНИГИ--------------------------------------------------------------%>
<div class="row booksCollection">
    <h4>Все книги:</h4>
    <c:forEach var="book" items="${bookList}">

        <div class="cardd col-xl-3 col-md-4 col-sm-6 col-12">
            <div class="card mb-3">

                <div class="editCardBut">
                    <i class="fa-solid fa-marker" style="font-size: 20px;"
                       data-name="${book.getName_book()}"
                       data-desc="${book.getDescription()}"
                       data-year="${book.getYear_release()}"
                       data-price="${book.getPrice()}"
                       data-discprice="${book.getNew_price()}"
                       data-iconpath="${book.getIcon_path()}"
                       data-page="${book.getNumberPage()}"
                       data-authorid="${book.getId_author()}"
                       data-pubid="${book.getId_publishing_house()}"
                       data-avail="${book.getAvail()}"
                       data-genre="${book.getGenreStringFormst()}"
                       data-same="${book.getSameBookStringFormst()}"
                       data-id="${book.getId_book()}"

                       data-bs-target="#editBookModal"
                       data-bs-toggle="modal"
                       onclick="FillEditBookModal(this)">
                    </i>
                </div>

                <div class="delCardBut">
                    <i class="fa-solid fa-trash-can" style="font-size: 20px;"
                       data-id="${book.getId_book()}"
                       data-bs-target="#DelBookModal"
                       data-bs-toggle="modal"
                       onclick="DelBook(this)">
                    </i>
                </div>

                <div style="padding: 20px; padding-bottom: 0">
                    <div style="display: inline-block; overflow: hidden" class="scalingImg">
                        <img class="card-img-top img-fluid"
                             src="${request.contextPath}book/${book.getIcon_path()}"
                             alt="Уупс" width="400">
                    </div>
                </div>

                <div class="card-body" style="padding-bottom: 0;">
                    <h6 align="center"><a class="card-title"
                                          style="word-wrap: normal">${book.getName_book()}</a></h6>
                </div>

                <div class="card-footer" style="padding-top: 0">

                    <div style="padding-bottom: 0; padding-top: 5px">
                        <form action="AuthorShow" method="get" style="margin: 0">
                            <input name="id" style="display: none" value="${book.getId_author()}"/>
                            <input name="name" style="display: none" value="${book.author.getName_author()}"/>
                            <button type="submit" name="your_name" value="your_value" class="btn-link text-muted"
                                    style="background: transparent; border-width: 0; width: 100%">
                                    ${book.getAuthor().getName_author()}
                            </button>
                        </form>
                    </div>

                    <div style="padding-bottom: 15px; padding-top: 5px">

                        <form action="PubShow" method="get" style="margin: 0">
                            <input name="id" style="display: none" value="${book.getId_publishing_house()}"/>
                            <input name="name" style="display: none" value="${book.getPublishingHouse().getName_publishing_house()}"/>
                            <button type="submit" name="your_name2" value="your_value2" class="btn-link text-muted"
                                    style="background: transparent; border-width: 0; width: 100%">
                                    ${book.getPublishingHouse().getName_publishing_house()}
                            </button>
                        </form>

<%--                        <p align="center" style="margin: 0"><small class="text-muted"
                                                                   style="word-wrap: normal; text-decoration: underline">${book.getPublishingHouse().getName_publishing_house()}</small>
                        </p>--%>
                    </div>

                    <c:choose>
                        <c:when test="${book.getNew_price() >= book.getPrice()}">
                            <h5 align="center" class="card-title" style="word-wrap: normal;">${book.getPrice()}
                                ₽</h5>
                        </c:when>
                        <c:otherwise>
                            <h5 align="center" class="card-title text-danger" style="word-wrap: normal;">
                                <del class="text-dark">${book.getPrice()} ₽</del>
                                    ${book.getNew_price()} ₽
                            </h5>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>
        </div>

    </c:forEach>

</div>


<%-------------------------------------------------------------РАСПРОДАЖА--------------------------------------------------------------%>

<div class="row booksCollection" id="discounlist">
    <h4>Скидки:</h4>
    <c:forEach var="book" items="${discountList}">

        <div class="cardd col-xl-3 col-md-4 col-sm-6 col-12">
            <div class="card mb-3">

                <div style="padding: 20px; padding-bottom: 0">
                    <div style="display: inline-block; overflow: hidden" class="scalingImg">
                        <img class="card-img-top img-fluid"
                             src="${request.contextPath}book/${book.getIcon_path()}"
                             alt="Уупс" width="400">
                    </div>
                </div>

                <div class="card-body" style="padding-bottom: 0;">
                    <h6 align="center"><a class="card-title" style="word-wrap: normal">${book.getName_book()}</a></h6>
                </div>

                <div class="card-footer" style="padding-top: 0">

                    <div style="padding-bottom: 0; padding-top: 5px">
                        <p align="center" style="margin: 0"><small class="text-muted"
                                                                   style="word-wrap: normal;">${book.getAuthor().getName_author()}</small>
                        </p>
                    </div>

                    <div style="padding-bottom: 15px; padding-top: 5px">
                        <p align="center" style="margin: 0"><small class="text-muted"
                                                                   style="word-wrap: normal; text-decoration: underline">${book.getPublishingHouse().getName_publishing_house()}</small>
                        </p>
                    </div>

                    <h5 align="center" class="card-title text-danger" style="word-wrap: normal;">
                        <del class="text-dark">${book.getPrice()} ₽</del>
                            ${book.getNew_price()} ₽
                    </h5>
                </div>

            </div>
        </div>

    </c:forEach>

</div>