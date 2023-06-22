<%@ page pageEncoding="UTF-8" %>


<div class="row booksCollection">
    <p class="backTitle"><a href="/StoreBooks"><i class="fa-solid fa-arrow-left"></i>   Вернуться на главную</a></p>


    <h4>${bookAuthName}</h4>


    <c:forEach var="book" items="${bookAuthList}">

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

