<%@ page pageEncoding="UTF-8" %>
<%---------------------------------------------------Добавить новое издательство--------------------------------------------------------%>
<div class="modal fade" id="CreatePubModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="CreatePubModalTitle">Добавить новое издательство</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">

                <form id="pubform" action="${pageContext.request.contextPath}/CreatePublishingHouse"
                      accept-charset="utf-8" method="post">
                    <input type="text" class="form-control" name="name" placeholder="Название издательства">
                </form>
                <button type="submit" form="pubform" class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;" href="/StoreBooks">Создать
                </button>
            </div>

        </div>
    </div>
</div>