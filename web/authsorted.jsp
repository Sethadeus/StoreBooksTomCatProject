<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: azh
  Date: 16.03.2022
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8" />

    <title>StoreBooks</title>

    <script src="https://kit.fontawesome.com/6c8c358578.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist" style="margin: 25px">
    <li class="nav-item" role="presentation">
        <a class="nav-link active" id="book-tab" data-bs-toggle="tab" data-bs-target="#book" type="button" role="tab"
           aria-controls="book" aria-selected="true">Книги</a>
    </li>

    <li class="nav-item" role="presentation">
        <a class="nav-link" id="pub-auth" data-bs-toggle="tab" data-bs-target="#auth" type="button" role="tab"
           aria-controls="auth" aria-selected="false">Авторы</a>
    </li>

    <li class="nav-item" role="presentation">
        <a class="nav-link" id="pub-tab" data-bs-toggle="tab" data-bs-target="#pub" type="button" role="tab"
           aria-controls="pub" aria-selected="false">Издательства / Жанры</a>
    </li>
</ul>

<div class="tab-content">

    <div class="tab-pane active" id="book" role="tabpanel" aria-labelledby="book-tab">
        <%@include file="TabBookSorted.jsp" %>
    </div>

    <div class="tab-pane" id="pub" role="tabpanel" aria-labelledby="pub-tab">
        <%@include file="TabPublishingHouse.jsp" %>
    </div>

    <div class="tab-pane" id="auth" role="tabpanel" aria-labelledby="auth-tab">
        <%@include file="TabAuthor.jsp" %>
    </div>

</div>


<%@include file="Modals/Edit/ModalEditBook.jsp" %>
<%@include file="Modals/Edit/ModalEditAuthor.jsp" %>

<%@include file="Modals/Create/ModalCreateNewAuthor.jsp" %>
<%@include file="Modals/Create/ModalCreateNewBook.jsp" %>
<%@include file="Modals/Create/ModalCreateNewPublishingHouse.jsp" %>

<%@include file="Modals/Delete/ModalDeleteBook.jsp" %>
<%@include file="Modals/Delete/ModalDeleteAuthor.jsp" %>
<%@include file="Modals/Delete/ModalDeletePublishingHouse.jsp" %>
<%@include file="Modals/Delete/ModalDeleteGenre.jsp" %>



<script>
    var inputs = document.querySelectorAll('.file-input')

    for (var i = 0, len = inputs.length; i < len; i++) {
        customInput(inputs[i])
    }

    function customInput(el) {
        const fileInput = el.querySelector('[type="file"]')
        const label = el.querySelector('[data-js-label]')

        fileInput.onchange =
            fileInput.onmouseout = function () {
                if (!fileInput.value) return

                var value = fileInput.value.replace(/^.*[\\\/]/, '')
                el.className += ' -chosen'
                label.innerText = value
            }
    }
</script>

<script>
    function FillEditBookModal(but) {
        document.getElementById('EditBookName').value = but.dataset.name;
        document.getElementById('EditBookDesc').value = but.dataset.desc;
        document.getElementById('EditeModalBookYear').value = but.dataset.year;
        document.getElementById('EditModalBookPrice').value = but.dataset.price;

        document.getElementById('EditModalBookPrevPathIcon').value = but.dataset.iconpath;

        document.getElementById('EditPathLabel').textContent = but.dataset.iconpath;
        document.getElementById('EditModalBookPages').value = but.dataset.page;
        document.getElementById('EditModalBookAuthor').value = but.dataset.authorid;
        document.getElementById('EditModalBookPublishing').value = but.dataset.pubid;
        document.getElementById('EditeModalBookAvail').value = but.dataset.avail;
        document.getElementById('EditModalBookId').value = but.dataset.id;

        $('#EditGenreInputSelector').val(but.dataset.genre.split(','));
        $('#EditSameAppInputSelector').val(but.dataset.same.split(','));

        document.getElementById('EditModalBookDiscPrice').max = but.dataset.price;
        if (but.dataset.discprice !== '') {
            document.getElementById('EditModalBookDiscPrice').value = but.dataset.discprice;
        } else {
            document.getElementById('EditModalBookDiscPrice').value = but.dataset.price;
        }
        document.getElementById('EditModalBookDisc').value = Math.round(((but.dataset.price - document.getElementById('EditModalBookDiscPrice').value) / but.dataset.price) * 100);




    }

    function FillEditAuthorModal(but) {
        document.getElementById('EditModalAuthorName').value = but.dataset.name;
        document.getElementById('EditModalAuthorDesc').value = but.dataset.desc;
        document.getElementById('EditModalAuthorId').value = but.dataset.id;
        document.getElementById('EditModalAuthorPath').value = but.dataset.path;
    }


    function DelBook(but) {
        document.getElementById('bookidtodelete').value = but.dataset.id;
    }

    function DelAuthor(but){
        document.getElementById('authoridtodelete').value = but.dataset.id;
    }

    function DelPub(but) {
        document.getElementById('pubidtodelete').value = but.dataset.id;
    }

    function DelGenre(but) {
        document.getElementById('genreidtodelete').value = but.dataset.id;
    }

    function reculcPriceForDisc() {
        document.getElementById('EditModalBookDiscPrice').value = Math.round(document.getElementById('EditModalBookPrice').value - document.getElementById('EditModalBookPrice').value * document.getElementById('EditModalBookDisc').value / 100);
    }

    function reculcDiscForPrice() {
        document.getElementById('EditModalBookDisc').value = Math.round(((document.getElementById('EditModalBookPrice').value - document.getElementById('EditModalBookDiscPrice').value) / document.getElementById('EditModalBookPrice').value) * 100);
    }

    function CreateAuthor() {
        let listElems = document.querySelectorAll('.modal-backdrop');
        listElems[1].style.zIndex = '1051';
    }

    /*    // обработчик нажатий в селекторах для тэгов
        function selectChange (selectObject){
            var value = selectObject.value; // текстовое значение нажимаемого тэга

            $('#sameAppInput').tagsinput('add', value);
            $('#sameAppInputHidden').value = selectObject.dataset.id;
        }*/

</script>

</body>
</html>

