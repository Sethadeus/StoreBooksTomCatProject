<%@ page pageEncoding="UTF-8" %>
<%----------------------------------------------Редактирование книги--------------------------------------------------%>
<div class="modal fade" id="editAuthorModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1050">
    <div class="modal-dialog modal-dialog-centered modal-lg" style="z-index: 1050">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="EditModalTitle">Редактирование</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="EditAuthorForm" action="EditAuthor" enctype="multipart/form-data" method="post">
                    <!------------------------Иконка--------------------------->
                    <div class="mb-3">
                        <label for="EditAuthorIcon" class="col-form-label">Фото:</label>
                        <div class='file-input form-control' id="EditAuthorIcon" style="width: 100%">
                            <input type='file' name="file">
                            <span class='button'><i class="fas fa-image"></i> Browse</span>
                            <span class='label' data-js-label>Файл не выбран</span>
                        </div>
                    </div>

                    <!------------------------ФИО--------------------------->
                    <div class="mb-3">
                        <input type="text" class="form-control" name="name" id="EditModalAuthorName"
                               placeholder="Введите имя автора">
                    </div>

                    <!------------------------Описание--------------------------->
                    <div class="mb-3">
                    <textarea rows="5" class="form-control" id="EditModalAuthorDesc" placeholder="Об авторе" name="desc"
                              style="margin-bottom: 5px"></textarea>
                    </div>
                    <p><input style="display: none" placeholder="id" name="id" id="EditModalAuthorId" value="123"></p>
                    <p><input style="display: none" placeholder="path" name="path" id="EditModalAuthorPath" value="123"></p>
                </form>
                <button type="submit" form="EditAuthorForm" id="EditAuthorFormSubmit"
                        class="btn btn-primary px-4 md-save" href="/StoreBooks"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;">Изменить
                </button>

            </div>
        </div>
    </div>
</div>