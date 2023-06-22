<%@ page pageEncoding="UTF-8" %>
<%---------------------------------------------------Добавить нового атвора--------------------------------------------------------%>
<div class="modal fade" id="CreateBookModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-lg" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Добавить новую книгу</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="createBookForm" action="CreateBook" enctype="multipart/form-data" method="post">
                    <!------------------------Иконка--------------------------->
                    <div class="mb-3">
                        <div class='file-input form-control' id="CreateBookIcon" style="width: 100%">
                            <input type='file' name="file">
                            <span class='button'><i class="fas fa-image"></i> Browse</span>
                            <span class='label' data-js-label>Файл не выбран</span>
                        </div>
                    </div>

                    <div class="mb-3">
                        <input type="text" class="form-control" name="name" id="CreateBookName"
                               placeholder="Введите название книги">
                    </div>

                    <div class="mb-3">
                        <textarea rows="5" class="form-control" id="CreateBookDesc" placeholder="Описание" name="desc"
                                  style="margin-bottom: 5px"></textarea>
                    </div>

                    <div style="width: auto;">
                        <label for="GenreInputSelector" class="col-form-label">Жанр книги</label>
                        <select class="form-select" id="GenreInputSelector" multiple name="genre">
                            <option disabled selected value="-1">Выбрать:</option>
                            <c:forEach var="same" items="${genreList}">
                                <option value="${same.getId_genre()}">${same.getName_genre()}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="row mb-3">

                        <div style="width: auto">
                            <label for="CreateModalBookYear" class="col-form-label">Год издания</label>
                            <input id="CreateModalBookYear" class="form-control" type="number" name="year" value="2000"
                                   min="0" step="1"
                                   style="width: 100px"/>
                        </div>

                        <div style="width: auto">
                            <label for="CreateModalBookPrice" class="col-form-label" style="width: auto">Цена ₽</label>
                            <input id="CreateModalBookPrice" class="form-control" type="number" name="price" value="500"
                                   min="0" step="1"
                                   style="width: 150px"/>
                        </div>

                        <div style="width: auto">
                            <label for="CreateModalBookPages" class="col-form-label" style="width: auto">Кол-во
                                страниц</label>
                            <input id="CreateModalBookPages" class="form-control" type="number" name="pages" value="800"
                                   min="0" step="1"
                                   style="width: 150px"/>
                        </div>

                        <div style="width: auto">
                            <label for="CreateModalBookAvail" class="col-form-label"
                                   style="width: auto">Доступность</label>
                            <select id="CreateModalBookAvail" class="form-select" aria-label="Default select example"
                                    name="avail">
                                <option selected value="1">Есть в наличии</option>
                                <option value="2">Отсутствует</option>
                            </select>
                        </div>

                    </div>


                    <div class="row mb-3">

                        <div style="width: auto">
                            <label for="CreateModalBookAuthorGr" class="col-form-label">Автор</label>

                            <div class="form-group" id="CreateModalBookAuthorGr" style="margin-bottom: 10px">
                                <div class="input-group">
                                    <select id="CreateModalBookAuthor" class="form-select" name="author"
                                            aria-label="Default select example">
                                        <option value="0" selected disabled>Выберите автора</option>
                                        <c:forEach var="author" items="${authList}">
                                            <option value="${author.getId_author()}">${author.getName_author()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div style="width: auto">
                            <label for="CreateModalBookPublishing" class="col-form-label">Издательство</label>

                            <select id="CreateModalBookPublishing" class="form-select" name="pub"
                                    aria-label="Default select example">
                                <option value="-1" selected disabled>Выберите издательство</option>
                                <c:forEach var="pub" items="${publishingHouseList}">
                                    <option value="${pub.getId_publishing_house()}">${pub.getName_publishing_house()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div style="width: auto;">
                        <label for="sameAppInputSelector" class="col-form-label">Похожие книги</label>

                        <select class="form-select" id="sameAppInputSelector" multiple name="samebook">
                            <option disabled selected value="-1">Выбрать:</option>
                            <c:forEach var="same" items="${bookList}">
                                <option value="${same.getId_book()}">${same.getName_book()}</option>
                            </c:forEach>
                        </select>
                    </div>

                </form>
                <button type="submit" form="createBookForm" id="createBookFormSubmit"
                        class="btn btn-primary px-4 md-save" href="/StoreBooks"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;">Добавить
                </button>

            </div>

        </div>
    </div>
</div>