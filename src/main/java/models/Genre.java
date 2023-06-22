package models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "genre")
public class Genre {
    @Id
    @Column(name = "id_genre", nullable = false)
    @SequenceGenerator(name = "genreSeq", sequenceName = "SEQUENCE_ID_GENRE", allocationSize = 1)
    @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "genreSeq")
    private Integer id_genre;

    @Column(name = "name_genre", nullable = false)
    private String name_genre;

    @ManyToMany(mappedBy = "genres")
    private List<Book> books;

    public Integer getId_genre() {
        return id_genre;
    }

    public void setId_genre(Integer id_genre) {
        this.id_genre = id_genre;
    }

    public String getName_genre() {
        return name_genre;
    }

    public void setName_genre(String name_genre) {
        this.name_genre = name_genre;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    @Override
    public String toString() {
        return String.valueOf(id_genre);
    }

    public Genre() {

    }
}