<%@ page pageEncoding="UTF-8" %>
<%----------------------------------------------Редактирование книги--------------------------------------------------%>
<div class="modal fade" id="editBookModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1050">
    <div class="modal-dialog modal-dialog-centered modal-lg" style="z-index: 1050">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="EditModalTitle">Редактирование</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="editBookForm" action="EditBook" enctype="multipart/form-data" method="post">

                    <input id="EditModalBookId" class="form-control" name="id" style="display: none"/>

                    <input id="EditModalBookPrevPathIcon" class="form-control" name="prevpath" style="display: none"/>

                    <!------------------------Иконка--------------------------->
                    <div class="mb-3">
                        <div class='file-input form-control' id="EditBookIcon" style="width: 100%">
                            <input type='file' name="file">
                            <span class='button'><i class="fas fa-image"></i> Browse</span>
                            <span class='label' id="EditPathLabel" data-js-label></span>
                        </div>
                    </div>

                    <div class="mb-3">
                        <input type="text" class="form-control" name="name" id="EditBookName"
                               placeholder="Введите название книги">
                    </div>

                    <div class="row mb-3">

                        <div style="width: auto">
                            <label for="EditModalBookAuthorGr" class="col-form-label">Автор</label>

                            <div class="form-group" id="EditModalBookAuthorGr" style="margin-bottom: 10px">
                                <div class="input-group">
                                    <select id="EditModalBookAuthor" class="form-select" name="author"
                                            aria-label="Default select example">
                                        <c:forEach var="author" items="${authList}">
                                            <option value="${author.getId_author()}">${author.getName_author()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div style="width: auto">
                            <label for="EditModalBookPublishing" class="col-form-label">Издательство</label>

                            <select id="EditModalBookPublishing" class="form-select" name="pub"
                                    aria-label="Default select example">
                                <c:forEach var="pub" items="${publishingHouseList}">
                                    <option value="${pub.getId_publishing_house()}">${pub.getName_publishing_house()}</option>
                                </c:forEach>
                            </select>
                        </div>

                    </div>

                    <div class="mb-3">
                        <textarea rows="5" class="form-control" id="EditBookDesc" placeholder="Описание" name="desc"
                                  style="margin-bottom: 5px"></textarea>
                    </div>

                    <div class="row mb-3">
                        <div style="width: auto">
                            <label for="EditeModalBookYear" class="col-form-label">Год издания</label>
                            <input id="EditeModalBookYear" class="form-control" type="number" name="year" value="2000"
                                   min="0" step="1"
                                   style="width: 100px"/>
                        </div>

                        <div style="width: auto">
                            <label for="EditModalBookPages" class="col-form-label" style="width: auto">Кол-во
                                страниц</label>
                            <input id="EditModalBookPages" class="form-control" type="number" name="pages" value="800"
                                   min="0" step="1"
                                   style="width: 150px"/>
                        </div>

                        <div style="width: auto">
                            <label for="EditeModalBookAvail" class="col-form-label"
                                   style="width: auto">Доступность</label>
                            <select id="EditeModalBookAvail" class="form-select" aria-label="Default select example"
                                    name="avail">
                                <option value="true">Есть в наличии</option>
                                <option value="false">Отсутствует</option>
                            </select>
                        </div>

                    </div>

                    <div class="row mb-3">
                        <div style="width: 40%;">
                            <label for="EditGenreInputSelector" class="col-form-label">Жанр книги</label>
                            <select class="form-select" id="EditGenreInputSelector" multiple name="genre">
                                <c:forEach var="same" items="${genreList}">
                                    <option value="${same.getId_genre()}">${same.getName_genre()}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div style="width: 60%;">
                            <label for="EditSameAppInputSelector" class="col-form-label">Похожие книги</label>

                            <select class="form-select" id="EditSameAppInputSelector" multiple name="samebook">
                                <c:forEach var="same" items="${bookList}">
                                    <option value="${same.getId_book()}">${same.getName_book()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">

                        <div class="col" style="width: auto">
                            <label for="EditModalBookPrice" class="col-form-label" style="width: auto">Цена ₽</label>
                            <input id="EditModalBookPrice" class="form-control" type="number" name="price" value="500"
                                   min="0" step="1"
                                   style="width: 150px"/>
                        </div>

                        <div class="col" style="width: auto">
                            <label for="EditModalBookDisc" class="col-form-label" style="width: auto">Скидка %</label>
                            <input id="EditModalBookDisc" class="form-control" type="number" value="0" min="0" max="100"
                                   step="1" style="width: 150px" oninput="reculcPriceForDisc()"/>
                        </div>

                        <div class="col" style="width: auto">
                            <label for="EditModalBookDiscPrice" class="col-form-label" style="width: auto">Цена со скидкой
                                ₽</label>
                            <input id="EditModalBookDiscPrice" class="form-control" type="number" name="discover" value="0" min="0" step="1"
                                   style="width: 150px" oninput="reculcDiscForPrice()"/>
                        </div>

                        <div class="col" style="width: auto;float: right">
                            <button type="submit" form="editBookForm" id="editBookFormSubmit"
                                    class="btn btn-primary px-4 md-save" href="/StoreBooks"
                                    style="float: right; padding-top: 6px; padding-bottom: 6px; margin-top: 38px">Изменить
                            </button>
                        </div>

                    </div>

                </form>


            </div>
        </div>
    </div>
</div>