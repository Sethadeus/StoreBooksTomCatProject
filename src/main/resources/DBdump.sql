--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    id_author integer NOT NULL,
    name_author text NOT NULL,
    description_author text,
    icon_author_path text
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id_book integer NOT NULL,
    name_book text NOT NULL,
    description text NOT NULL,
    price integer NOT NULL,
    avail boolean NOT NULL,
    number_page integer,
    icon_path text,
    year_release integer,
    id_author integer NOT NULL,
    id_publishing_house integer NOT NULL,
    new_price integer
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: bookgenre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookgenre (
    id_book integer NOT NULL,
    id_genre integer NOT NULL
);


ALTER TABLE public.bookgenre OWNER TO postgres;

--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id_genre integer NOT NULL,
    name_genre text NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: publishinghouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publishinghouse (
    id_publishing_house integer NOT NULL,
    name_publishing_house text NOT NULL
);


ALTER TABLE public.publishinghouse OWNER TO postgres;

--
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    id_review integer NOT NULL,
    id_book integer NOT NULL,
    autor_review text NOT NULL,
    review text NOT NULL
);


ALTER TABLE public.review OWNER TO postgres;

--
-- Name: samebook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.samebook (
    id_book integer NOT NULL,
    id_same_book integer NOT NULL
);


ALTER TABLE public.samebook OWNER TO postgres;

--
-- Name: sequence_id_author; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequence_id_author
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequence_id_author OWNER TO postgres;

--
-- Name: sequence_id_book; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequence_id_book
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequence_id_book OWNER TO postgres;

--
-- Name: sequence_id_genre; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequence_id_genre
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequence_id_genre OWNER TO postgres;

--
-- Name: sequence_id_publishing_house; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequence_id_publishing_house
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequence_id_publishing_house OWNER TO postgres;

--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.author VALUES (3, 'Джером Сэлинджер', 'Джеро́м Дэ́вид (Джей Ди) Сэ́линджер (англ. Jerome David J. D. Salinger /ˈsælɪndʒər/; 1 января 1919, Нью-Йорк — 27 января[6][7] 2010, Корниш, Нью-Гэмпшир) — американский писатель, произведения которого увидели свет в журнале The New Yorker во второй половине 1940-х и в 1950-е годы.

Сэлинджер вырос в Манхэттене, начал писать рассказы в средней школе. Первые сочинения были опубликованы ещё до начала Второй мировой войны. Когда началась война, Сэлинджер добровольцем пошёл на фронт. Его не брали по состоянию здоровья, но он добился своего. Уже будучи на фронте, он написал в своём дневнике: «Я чувствую, что я нахожусь в нужное время в нужном месте, потому что здесь идёт война за будущее всего человечества».

Во второй половине 1940-х годов за Сэлинджером закрепилась репутация одного из самых искусных и многообещающих мастеров американской новеллистики. Многие из его рассказов отразили травмирующие переживания войны.

В 1951 году Сэлинджер издаёт роман воспитания «Над пропастью во ржи», который имел оглушительный успех и снискал любовь читателей во всём мире. Не одно поколение молодёжи сочувственно следило за потерей детских иллюзий взрослеющим героем книги, Холденом Колфилдом. За короткий срок были проданы беспрецедентные 60 миллионов копий и до сих пор ежегодно продается около 250 000 экземпляров этой книги.

После 1965 года Сэлинджер перестал публиковаться и вёл затворнический образ жизни. Своё последнее интервью он дал в 1980 году.', 'J._D._Salinger_(Catcher_in_the_Rye_portrait).jpg');
INSERT INTO public.author VALUES (19, 'Стивен Кинг', 'Король ужаса', '20220328190623632.jpg');
INSERT INTO public.author VALUES (31, 'Джордж Оруэлл', 'уепеногн8лг', '20220329121527807.jpg');
INSERT INTO public.author VALUES (2, 'Джордж Мартин', 'Джордж Ре́ймонд Ри́чард Ма́ртин (англ. George Raymond Richard Martin, род. 20 сентября 1948) — современный американский писатель-фантаст, сценарист, продюсер и редактор, лауреат многих литературных премий. В 1970—1980-е годы получил известность благодаря рассказам и повестям в жанре научной фантастики, литературы ужасов и фэнтези. Наибольшую славу ему принес выходящий с 1996 года фэнтезийный цикл «Песнь Льда и Огня», позднее экранизированный компанией HBO в виде популярного телесериала «Игра престолов». Эти книги дали основания литературным критикам называть Мартина «американским Толкином». В 2011 году журнал Time включил Джорджа Мартина в свой список самых влиятельных людей в мире.', '20220328190039950.jpg');
INSERT INTO public.author VALUES (1, 'Джоан Роулинг', 'Джоа́н Ро́улинг (англ. Joanne Rowling; род. 31 июля 1965[6]), известная под псевдонимами Дж. К. Роулинг (J. K. Rowling), Джоан Кэ́тлин Роулинг (англ. Joanne Kathleen Rowling) и Ро́берт Гелбре́йт (Robert Galbraith), — британская писательница, сценаристка и кинопродюсер, наиболее известная как автор серии романов о Гарри Поттере. Книги о Гарри Поттере получили несколько наград и были проданы в количестве более 500 миллионов экземпляров. Они стали самой продаваемой серией книг в истории и основой для серии фильмов, ставшей третьей по кассовому сбору серией фильмов в истории. Джоан Роулинг сама утверждала сценарии фильмов, а также вошла в состав продюсеров последних двух частей.', 'JoanneRowling.jpg');
INSERT INTO public.author VALUES (26, 'Терри Пртачетт', 'Терри Пртачетт описание', '20220329073358134.jpg');


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.book VALUES (8, 'Битва королей', 'Перед вами — величественное шестикнижие «Песнь льда и огня». Эпическая, чеканная сага о мире Семи Королевств. О мире суровых земель вечного холода и радостных земель вечного лета. Мире лордов и героев, воинов и магов, чернокнижников и убийц — всех, кого свела воедино Судьба во исполнение древнего пророчества. О мире опасных приключений, великих деяний и тончайших политических интриг.', 800, false, 850, 'clash-of-kings.jpg', 1998, 2, 2, 785);
INSERT INTO public.book VALUES (3, 'Гарри Поттер и Кубок огня', 'Книга, покорившая мир, эталон литературы для читателей всех возрастов, синоним успеха. Книга, сделавшая Дж.К. Роулинг самым читаемым писателем современности. Книга, ставшая культовой уже для нескольких поколений. «Гарри Поттер и Кубок Огня» – история продолжается.', 600, false, 450, 'harry-potter-book-covers-illustration-olly-moss-7.jpg', 2000, 1, 1, 500);
INSERT INTO public.book VALUES (7, 'Игра Престолов', 'Перед вами — величественное шестикнижие «Песнь льда и огня». Эпическая, чеканная сага о мире Семи Королевств. О мире суровых земель вечного холода и радостных земель вечного лета. Мире лордов и героев, воинов и магов, чернокнижников и убийц — всех, кого свела воедино Судьба во исполнение древнего пророчества. О мире опасных приключений, великих деяний и тончайших политических интриг.', 800, true, 800, 'a-game-of-thrones-hb.jpg', 1996, 2, 2, 500);
INSERT INTO public.book VALUES (2, 'Гарри Поттер и узник Азкабана', 'Книга «Гарри Поттер и узник Азкабана» является культовым продолжением истории про мальчика-волшебника. В этой книге Гарри помогает разоблачить Петтигрю и спасти Сириуса Блэка. Только Дамблдор верит в невиновность Блэка, поэтому намекает Гермионе, что если они вернутся на три часа назад в прошлое то смогут спасти гиппогрифа и Блэка.', 700, true, 400, 'harry-potter-book-covers-illustration-olly-moss-1.jpg', 1999, 1, 0, 700);
INSERT INTO public.book VALUES (5, 'Гарри Поттер и Принц-полукровка', 'Книга, покорившая мир, эталон литературы для читателей всех возрастов, синоним успеха. Книга, сделавшая Дж.К. Роулинг самым читаемым писателем современности. Книга, ставшая культовой уже для нескольких поколений. «Гарри Поттер и Принц-полукровка» – история продолжается.', 600, true, 450, '20220329070707746.jpg', 2005, 1, 1, 600);
INSERT INTO public.book VALUES (0, 'Гарри Поттер и философский камень', 'Одиннадцатилетний мальчик-сирота Гарри Поттер живет в семье своей тетки и даже не подозревает, что он - настоящий волшебник. Но однажды прилетает сова с письмом для него, и жизнь Гарри Поттера изменяется навсегда. Он узнает, что зачислен в Школу Чародейства и Волшебства, выясняет правду о загадочной смерти своих родителей, а в результате ему удается раскрыть секрет философского камня.', 700, true, 400, 'harry-potter-book-covers-illustration-olly-moss-3.jpg', 1997, 31, 0, 700);
INSERT INTO public.book VALUES (1, 'Гарри Поттер и Тайная комната', 'Книга, покорившая мир, эталон литературы для читателей всех возрастов, синоним успеха. Книга, сделавшая Дж.К. Роулинг самым читаемым писателем современности.
«Гарри Поттер и Тайная комната» – история продолжается.', 600, false, 500, '20220329071010557.jpg', 1998, 1, 1, 400);
INSERT INTO public.book VALUES (6, 'Гарри Поттер и Дары Смерти', 'Книга, покорившая мир, эталон литературы, синоним успеха. Книга, ставшая культовой уже для нескольких поколений. «Гарри Поттер и Дары Смерти» – финал истории.', 700, false, 500, 'harry-potter-book-covers-illustration-olly-moss-4.jpg', 2007, 1, 0, 700);
INSERT INTO public.book VALUES (9, 'Буря мечей', 'Перед вами — величественное шестикнижие «Песнь льда и огня». Эпическая, чеканная сага о мире Семи Королевств. О мире суровых земель вечного холода и радостных земель вечного лета. Мире лордов и героев, воинов и магов, чернокнижников и убийц — всех, кого свела воедино Судьба во исполнение древнего пророчества. О мире опасных приключений, великих деяний и тончайших политических интриг.', 850, false, 800, 'A-Storm-of-Swords-HB.jpg', 2000, 2, 2, 850);
INSERT INTO public.book VALUES (10, 'Пир стервятников', 'Перед вами — величественное шестикнижие «Песнь льда и огня». Эпическая, чеканная сага о мире Семи Королевств. О мире суровых земель вечного холода и радостных земель вечного лета. Мире лордов и героев, воинов и магов, чернокнижников и убийц — всех, кого свела воедино Судьба во исполнение древнего пророчества. О мире опасных приключений, великих деяний и тончайших политических интриг.', 850, true, 800, '076020-FC50.jpg', 2005, 2, 2, 850);
INSERT INTO public.book VALUES (44, 'Над пропостью во ржи', 'Над пропостью во ржи описанугкапке', 500, true, 800, '20220329131644334.jpg', 2000, 3, 1, 500);
INSERT INTO public.book VALUES (47, 'Скотный двор', 'Скотный двор оптсание', 500, true, 800, '20220329132958816.jpg', 2000, 31, 17, 500);
INSERT INTO public.book VALUES (45, 'Гарри Поттер и орден феникса', 'описание', 500, true, 800, '20220329131814275.jpg', 2000, 19, 1, 400);


--
-- Data for Name: bookgenre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bookgenre VALUES (44, 14);
INSERT INTO public.bookgenre VALUES (2, 3);
INSERT INTO public.bookgenre VALUES (44, 5);
INSERT INTO public.bookgenre VALUES (2, 4);
INSERT INTO public.bookgenre VALUES (2, 1);
INSERT INTO public.bookgenre VALUES (6, 1);
INSERT INTO public.bookgenre VALUES (7, 3);
INSERT INTO public.bookgenre VALUES (0, 2);
INSERT INTO public.bookgenre VALUES (9, 2);
INSERT INTO public.bookgenre VALUES (10, 3);
INSERT INTO public.bookgenre VALUES (0, 1);
INSERT INTO public.bookgenre VALUES (0, 5);
INSERT INTO public.bookgenre VALUES (47, 5);
INSERT INTO public.bookgenre VALUES (47, 2);
INSERT INTO public.bookgenre VALUES (47, 15);
INSERT INTO public.bookgenre VALUES (45, 5);
INSERT INTO public.bookgenre VALUES (45, 3);
INSERT INTO public.bookgenre VALUES (45, 15);
INSERT INTO public.bookgenre VALUES (5, 2);
INSERT INTO public.bookgenre VALUES (5, 1);
INSERT INTO public.bookgenre VALUES (5, 5);
INSERT INTO public.bookgenre VALUES (1, 5);
INSERT INTO public.bookgenre VALUES (1, 2);
INSERT INTO public.bookgenre VALUES (3, 4);
INSERT INTO public.bookgenre VALUES (3, 3);
INSERT INTO public.bookgenre VALUES (8, 1);
INSERT INTO public.bookgenre VALUES (8, 3);


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genre VALUES (2, 'Фантастика');
INSERT INTO public.genre VALUES (3, 'Фэнтези');
INSERT INTO public.genre VALUES (1, 'Комедия');
INSERT INTO public.genre VALUES (4, 'Драма');
INSERT INTO public.genre VALUES (5, 'Хоррор');
INSERT INTO public.genre VALUES (14, 'Антиутопия');
INSERT INTO public.genre VALUES (15, 'Утопия');


--
-- Data for Name: publishinghouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.publishinghouse VALUES (0, 'ЭКСМО');
INSERT INTO public.publishinghouse VALUES (1, 'АСТ');
INSERT INTO public.publishinghouse VALUES (17, 'САМИЗДАТ');
INSERT INTO public.publishinghouse VALUES (4, 'АЗ­БУ­КА-АТТИКУС');
INSERT INTO public.publishinghouse VALUES (2, 'МИФ');


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.review VALUES (0, 0, 'Biba', 'Нраицца!');
INSERT INTO public.review VALUES (1, 0, 'Boba', 'Ужас! не советоваю читать');
INSERT INTO public.review VALUES (2, 0, 'Abobus', 'Луяшая книга ever');


--
-- Data for Name: samebook; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.samebook VALUES (47, 6);
INSERT INTO public.samebook VALUES (47, 3);
INSERT INTO public.samebook VALUES (47, 45);
INSERT INTO public.samebook VALUES (45, 0);
INSERT INTO public.samebook VALUES (45, 2);
INSERT INTO public.samebook VALUES (45, 6);
INSERT INTO public.samebook VALUES (5, 0);
INSERT INTO public.samebook VALUES (5, 7);
INSERT INTO public.samebook VALUES (1, 6);
INSERT INTO public.samebook VALUES (1, 3);
INSERT INTO public.samebook VALUES (8, 3);
INSERT INTO public.samebook VALUES (8, 5);
INSERT INTO public.samebook VALUES (8, 8);
INSERT INTO public.samebook VALUES (44, 2);
INSERT INTO public.samebook VALUES (44, 7);
INSERT INTO public.samebook VALUES (44, 0);
INSERT INTO public.samebook VALUES (0, 2);
INSERT INTO public.samebook VALUES (0, 1);


--
-- Name: sequence_id_author; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequence_id_author', 34, true);


--
-- Name: sequence_id_book; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequence_id_book', 48, true);


--
-- Name: sequence_id_genre; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequence_id_genre', 16, true);


--
-- Name: sequence_id_publishing_house; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequence_id_publishing_house', 20, true);


--
-- Name: bookgenre book_genre_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookgenre
    ADD CONSTRAINT book_genre_pk PRIMARY KEY (id_book, id_genre);


--
-- Name: author id_author_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT id_author_pk PRIMARY KEY (id_author);


--
-- Name: book id_book_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT id_book_pk PRIMARY KEY (id_book);


--
-- Name: genre id_genre_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT id_genre_pk PRIMARY KEY (id_genre);


--
-- Name: publishinghouse id_publishing_house_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publishinghouse
    ADD CONSTRAINT id_publishing_house_pk PRIMARY KEY (id_publishing_house);


--
-- Name: review id_review_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT id_review_pk PRIMARY KEY (id_review);


--
-- Name: samebook id_same_book_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samebook
    ADD CONSTRAINT id_same_book_pk PRIMARY KEY (id_book, id_same_book);


--
-- Name: book id_author_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT id_author_fk FOREIGN KEY (id_author) REFERENCES public.author(id_author) ON DELETE CASCADE;


--
-- Name: bookgenre id_book_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookgenre
    ADD CONSTRAINT id_book_fk FOREIGN KEY (id_book) REFERENCES public.book(id_book) ON DELETE CASCADE;


--
-- Name: samebook id_book_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samebook
    ADD CONSTRAINT id_book_fk FOREIGN KEY (id_book) REFERENCES public.book(id_book) ON DELETE CASCADE;


--
-- Name: review id_book_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT id_book_fk FOREIGN KEY (id_book) REFERENCES public.book(id_book) ON DELETE CASCADE;


--
-- Name: bookgenre id_genre_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookgenre
    ADD CONSTRAINT id_genre_fk FOREIGN KEY (id_genre) REFERENCES public.genre(id_genre) ON DELETE CASCADE;


--
-- Name: book id_publishing_house_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT id_publishing_house_fk FOREIGN KEY (id_publishing_house) REFERENCES public.publishinghouse(id_publishing_house) ON DELETE CASCADE;


--
-- Name: samebook id_same_book_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samebook
    ADD CONSTRAINT id_same_book_fk FOREIGN KEY (id_same_book) REFERENCES public.book(id_book) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

