<%@ page pageEncoding="UTF-8" %>
<%----------------------------------------------Удалить издательство-------------------------------------------------------%>
<div class="modal fade" id="DelGenreModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="z-index: 1052">
    <div class="modal-dialog modal-dialog-centered modal-md" style="z-index: 1052">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="DelGenreModalTitle">Вы действительно хотите удалить жанр?</h5><br>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">
                <h6 class="modal-title">Жанр будут удалены. Это действие необратимо</h6><br>
                <button type="button" class="btn btn-dark px-4 md-close" data-bs-dismiss="modal"
                        style="float: left; padding-top: 10px; padding-bottom: 10px;">Отмена
                </button>
                <form id="delGenreForm" style="display: none" action="${pageContext.request.contextPath}/DelGenre"
                      method="post">
                    <p><input placeholder="id" name="id" id="genreidtodelete" value="123">ТЕСТО</p>
                </form>
                <button type="submit" form="delGenreForm" id="DelPubById" data-id="" class="btn btn-primary px-4 md-save"
                        style="float: right; padding-top: 10px; padding-bottom: 10px;" href="/StoreBooks">Удалить
                </button>
            </div>
        </div>
    </div>
</div>