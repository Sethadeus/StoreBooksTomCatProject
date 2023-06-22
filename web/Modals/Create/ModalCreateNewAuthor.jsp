<%@ page pageEncoding="UTF-8" %>
<%---------------------------------------------------Добавить нового атвора--------------------------------------------------------%>
<div class="modal fade" id="CreateAuthorModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-lg" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="CreateAuthorModalTitle">Добавить нового автора</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="createAuthorForm" action="FileUploadDemo" enctype="multipart/form-data" method="post">
                    <!------------------------Иконка--------------------------->
                    <div class="mb-3">
                        <label for="CreateAuthorIcon" class="col-form-label">Фото:</label>
                        <div class='file-input form-control' id="CreateAuthorIcon" style="width: 100%">
                            <input type='file' name="file">
                            <span class='button'><i class="fas fa-image"></i> Browse</span>
                            <span class='label' data-js-label>Файл не выбран</span>
                        </div>
                    </div>

                    <!------------------------ФИО--------------------------->
                    <div class="mb-3">
                        <input type="text" class="form-control" name="name" id="CreateAuthorName"
                               placeholder="Введите имя автора">
                    </div>

                    <!------------------------Описание--------------------------->
                    <div class="mb-3">
                    <textarea rows="5" class="form-control" id="CreateAuthorDesc" placeholder="Об авторе" name="desc"
                              style="margin-bottom: 5px"></textarea>
                    </div>

                </form>
                <button type="submit" form="createAuthorForm" id="createAuthorFormSubmit"
                        class="btn btn-primary px-4 md-save" href="/StoreBooks"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;">Добавить
                </button>

            </div>

        </div>
    </div>
</div>